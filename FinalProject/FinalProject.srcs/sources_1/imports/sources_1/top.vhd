----------------------------------------------------------------------------------
-- Company: Domipheus Labs 
-- Engineer: Colin "domipheus" Riley
-- 
-- Create Date: 26.04.2018 23:29:09
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: Arty S7 HDMI out to PMod A example.
-- Target Devices: Arty S7 XC7S50 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: VGA/TMDS/DVID code from Mike Field <hamster@snap.net.nz> 
-- 
----------------------------------------------------------------------------------

-- Modified for 24 MHZ
-- By Anders Stengaard Sørensen
-- University of Southern Denmark
-- 2022 03 24

-- Used as basis for further expansion with connection through SPI and SRAM
-- By Sebastian Rud Madsen
-- University of Southern Denmark
-- April and May 2022

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity top is
    Port ( 
        CLK24MHZ : in STD_LOGIC;
        led : out STD_LOGIC_VECTOR (5 downto 0);
        hdmi_out_p : out STD_LOGIC_VECTOR(3 downto 0);
        hdmi_out_n : out STD_LOGIC_VECTOR(3 downto 0);
        spi_clk : in STD_LOGIC;
        spi_mosi : in STD_LOGIC;
        spi_miso : out STD_LOGIC;
        spi_ss : in STD_LOGIC;
        memaddr : out STD_LOGIC_VECTOR(18 downto 0);
        memdata : inout STD_LOGIC_VECTOR(7 downto 0);
        memoen : out STD_LOGIC := '0'; -- Output enable, always on
        memwen : out STD_LOGIC := '1'; -- '0' = write, '1' = read
        memcen : out STD_LOGIC := '0'; -- Chip enable, always on
        short_gnd0, short_gnd1, short_gnd2 : out STD_LOGIC := '0' -- Pins set to ground to shorten loops
    );
end top;

architecture Behavioral of top is                                   -- 720p target: 72.25 MHz pixel clock (371.25 MHz 5x)
    COMPONENT clocking                                              -- 1080p@50Hz target: 123.75 MHz pixel clock (618.75 MHz 5x)
    generic (                                                       -- 1080p@60Hz target: 148.5 MHz pixel clock (742.5 MHz 5x)
        clk_period : real := 41.66;     -- Define 24 MHz period
        clk_mul    : real := 31.00;     -- Input: 24 MHz            -- 720p: 46.40 => 1113.6 MHz, 1080p@50Hz: 25.78 => 618.72 MHz, 1080p@60Hz: 30.94 => 742.56 MHz
        pix_div    : real := 5.0;       --                          -- 720p: 15.0  => 72.24 MHz , 1080p@50Hz: 5.0   => 123.74 MHz, 1080p@60Hz: 5.0   => 148.512 MHz
        pix5x_div  : integer := 1;      --                          -- 720p: 3     => 371.2 MHz , 1080p@50Hz: 1     => 618.72 MHz, 1080p@60Hz: 1     => 742.56 MHz
        spi_div    : integer := 35      -- 21.216 MHz
    );
    PORT ( 
        clk_I           : in  STD_LOGIC;
        clkpixel_O      : out STD_LOGIC;
        clk5xpixel_O    : out STD_LOGIC;
        clkspi_O        : out STD_LOGIC
    );
    END COMPONENT;
    
    Component spi_controller is
    Generic ( SPI_DATA_LENGTH : integer := 64);
    Port    ( CLK_I : in STD_LOGIC;
              SPIDATA_I : in STD_LOGIC_VECTOR(SPI_DATA_LENGTH - 1 downto 0);
              SPIDATA_O : out STD_LOGIC_VECTOR(SPI_DATA_LENGTH - 1 downto 0);
              WREN_O : out STD_LOGIC;
           
              SCLK_I : in STD_LOGIC;
              SS_I : in STD_LOGIC;
              MOSI_I : in STD_LOGIC;
              MISO_O : out STD_LOGIC
    );
    end Component;
    
    Component async_fifo is
    Port ( RDCLK_I     : in STD_LOGIC;
           WRCLK_I     : in STD_LOGIC;
           RDEN_I      : in STD_LOGIC;
           WREN_I      : in STD_LOGIC;
           DIN_I       : in STD_LOGIC_VECTOR(63 downto 0);
           DATAVALID_O : out STD_LOGIC;
           EMPTY_O     : out STD_LOGIC;
           FULL_O      : out STD_LOGIC;
           DOUT_O      : out STD_LOGIC_VECTOR(63 downto 0);
           WR_BUSY_O   : out STD_LOGIC;
           RD_BUSY_O   : out STD_LOGIC
           );
end Component;

    COMPONENT vga_gen
    generic (                                   -- 720p values:             -- 1080p values:
        hRez       : natural := 1920;           -- 1280                     -- 1920
        hStartSync : natural := 1920+88;        -- 1280 + 72                -- 1920 + 88
        hEndSync   : natural := 1920+88+44;     -- 1280 + 72 + 80           -- 1920 + 88 + 44
        hMaxCount  : natural := 1920+88+44+148; -- 1280 + 72 + 80 + 216     -- 1920 + 88 + 44 + 148
        hsyncActive : std_logic := '0';
            
        vRez       : natural := 1080;            -- 720                      -- 1080
        vStartSync : natural := 1080+4;          -- 720 + 3                  -- 1080 + 4
        vEndSync   : natural := 1080+4+5;        -- 720 + 3 + 5              -- 1080 + 4 + 5
        vMaxCount  : natural := 1080+4+5+36;     -- 720 + 3 + 5 + 22         -- 1080 + 4 + 5 + 36
        vsyncActive : std_logic := '1';
        prefetch_idx:natural := 8
    );
    PORT(    
        pixel_clock  : in std_logic; 
        pixel_h      : out STD_LOGIC_VECTOR(11 downto 0);
        pixel_v      : out STD_LOGIC_VECTOR(11 downto 0);
        pixel_h_pref : out STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
        pixel_v_pref : out STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
        blank_pref   : OUT std_logic;
        blank        : OUT std_logic;
        hsync        : OUT std_logic;
        vsync        : OUT std_logic
    );
    END COMPONENT;
    
    Component data_controller is
    Port ( CLK_I        : in STD_LOGIC;                         -- Pixel clock
           HPIXEL_I     : in STD_LOGIC_VECTOR(11 downto 0);     -- Horizontal pixel value
           VPIXEL_I     : in STD_LOGIC_VECTOR(11 downto 0);     -- Vertical pixel value
           BLANK_I      : in STD_LOGIC;                         -- Indicates blank part of the screen
           FIFODATA_I   : in STD_LOGIC_VECTOR(63 downto 0);     -- Data from FIFO
           FIFODV_I     : in STD_LOGIC;                         -- Data valid signal from FIFO
           FIFOEMPTY_I  : in STD_LOGIC;                         -- FIFO empty signal
           SRAMDATA_IO  : inout STD_LOGIC_VECTOR(7 downto 0);   -- Data to and from SRAM
           SRAMADDR_O   : out STD_LOGIC_VECTOR(18 downto 0) := (others => '0'); -- Address to read/write for SRAM
           SRAMWEN_O    : out STD_LOGIC := '1';                 -- Write enable for SRAM
           FIFORD_O     : out STD_LOGIC := '0';                 -- Read enable for FIFO
           GAMMA_O      : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- Current pixel's gamma value
           GAMMANEXT_O  : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')   -- Next pixel's gamma value
           );
    end Component;
         
    
    Component smoothening is
    Port ( CLK_I        : in STD_LOGIC;
           GAMMA_I      : in STD_LOGIC_VECTOR(7 downto 0);
           GAMMANEXT_I  : in STD_LOGIC_VECTOR(7 downto 0);
           RED_O        : out STD_LOGIC_VECTOR(7 downto 0);
           GREEN_O      : out STD_LOGIC_VECTOR(7 downto 0);
           BLUE_O       : out STD_LOGIC_VECTOR(7 downto 0)
           );
    end Component;

    COMPONENT dvid
    PORT(
        clk      : IN std_logic;
        clk_pixel: IN std_logic;
        red_p    : IN std_logic_vector(7 downto 0);
        green_p  : IN std_logic_vector(7 downto 0);
        blue_p   : IN std_logic_vector(7 downto 0);
        blank    : IN std_logic;
        hsync    : IN std_logic;
        vsync    : IN std_logic;
        diff_out_p: out STD_LOGIC_VECTOR(3 downto 0);
        diff_out_n: out STD_LOGIC_VECTOR(3 downto 0)
    );
    END COMPONENT;
    
    Component ila_0 is
    PORT ( clk : IN STD_LOGIC;
           probe0 : IN STD_LOGIC_VECTOR(7 downto 0);
           probe1 : IN STD_LOGIC_VECTOR(7 downto 0);
           probe2 : IN STD_LOGIC_VECTOR(7 downto 0);
           probe3 : IN STD_LOGIC;
           probe4 : IN STD_LOGIC;
           probe5 : IN STD_LOGIC;
           probe6 : IN STD_LOGIC_VECTOR(18 downto 0);
           probe7 : IN STD_LOGIC_VECTOR(11 downto 0);
           probe8 : IN STD_LOGIC_VECTOR(11 downto 0);
           probe9 : IN STD_LOGIC;
           probe10 : IN STD_LOGIC;
           probe11 : IN STD_LOGIC
    );
    end Component;

    -- Counter for LEDs
	signal count: unsigned(31 downto 0) := X"00000000";
	
    -- Clock engine    
    signal cEng_pixel   : std_logic;
    signal cEng_5xpixel : std_logic;
    signal cEng_spi     : std_logic;
    
    -- FIFO signals
    signal fifo_din  : STD_LOGIC_VECTOR(63 downto 0);
    signal fifo_wren : STD_LOGIC;
    signal fifo_dout : STD_LOGIC_VECTOR(63 downto 0);
    signal fifo_rden : STD_LOGIC;
    signal fifo_dv   : STD_LOGIC;
    signal fifo_empty: STD_LOGIC;
    signal fifo_wr_busy : STD_LOGIC;
    signal fifo_rd_busy : STD_LOGIC;
    
    -- VGA timing
    signal pixel_h : STD_LOGIC_VECTOR(11 downto 0);
    signal pixel_v : STD_LOGIC_VECTOR(11 downto 0);
    signal blank   : std_logic;
    signal hsync   : std_logic;
    signal vsync   : std_logic;
    
    -- Pixel data
    signal gamma : STD_LOGIC_VECTOR(7 downto 0);
    signal gamma_next : STD_LOGIC_VECTOR(7 downto 0);
    signal red_val   : std_logic_vector(7 downto 0) := (others => '0');
    signal green_val : std_logic_vector(7 downto 0) := (others => '0');
    signal blue_val  : std_logic_vector(7 downto 0) := (others => '0');
    
    -- ILA signal
    signal sramaddr : STD_LOGIC_VECTOR(18 downto 0);
    signal sramwen : STD_LOGIC;
    
begin
    
    -- Increment the counter each 24MHz cycle
    process(CLK24MHZ)
    begin
        if rising_edge(CLK24MHZ) then
            count <= count + 1;
        end if;
    end process;

    -- Assign LEDs to bits far enough up the counter as to see them count.
    led(0) <= count(24);
    led(1) <= count(25);
    led(2) <= count(26);
    led(3) <= count(27);
    led(4) <= count(28);
    led(5) <= count(29);
 
    -- Generate the pixel clock and 5x pixel clock              -- 720p target: 72.25 MHz pixel clock (371.25 MHz 5x)
    -- The frequency is resolution and refresh rate dependent   -- 1080p@50Hz target: 123.75 MHz pixel clock (618.75 MHz 5x)
    MMCM_clockEngine: clocking                                  -- 1080p@60Hz target: 148.5 MHz pixel clock (742.5 MHz 5x)
     generic map (
         clk_period => 41.66,    -- Define 24 MHz period
         clk_mul    => 31.00,    -- Input: 24 MHz               -- 720p: 46.40 => 1113.6 MHz, 1080p@50Hz: 25.78 => 618.72 MHz, 1080p@60Hz: 30.94 => 742.56 MHz
         pix_div    => 5.00,     --                             -- 720p: 15.0  => 72.24 MHz , 1080p@50Hz: 5.0   => 123.74 MHz, 1080p@60Hz: 5.0   => 148.512 MHz
         pix5x_div  => 1,        --                             -- 720p: 3     => 371.2 MHz , 1080p@50Hz: 1     => 618.72 MHz, 1080p@60Hz: 1     => 742.56 MHz
         spi_div    => 35        -- 21.216 MHz
     )
     port map (
         clk_I              => CLK24MHZ,
         clkpixel_O         => cEng_pixel,
         clk5xpixel_O       => cEng_5xpixel,
         clkspi_O           => cEng_spi
     );
    
    -- Top of SPI controller, containing a TX and RX module.
    -- Retrieves data from submodules and puts it into the FIFO
    spi_top: spi_controller
    Generic map ( SPI_DATA_LENGTH => 64)
    Port map    ( CLK_I => cEng_spi,
                  SPIDATA_I => (others => '0'),
                  SPIDATA_O => fifo_din,
                  WREN_O => fifo_wren,
           
                  SCLK_I => spi_clk,
                  SS_I   => spi_ss,
                  MOSI_I => spi_mosi,
                  MISO_O => spi_miso
    );
    
    fifo: async_fifo
    Port map ( RDCLK_I => cEng_pixel,
               WRCLK_I => cEng_spi,
               RDEN_I => fifo_rden,
               WREN_I => fifo_wren,
               DIN_I => fifo_din,
               DATAVALID_O => fifo_dv,
               EMPTY_O => fifo_empty,
               FULL_O => open,
               DOUT_O => fifo_dout,
               WR_BUSY_O => open,
               RD_BUSY_O => open
    );

    -- This generates controls and offsets required for a fixed resolution
    -- Modify the values and clock to output different resolutions
    Inst_vga_gen: vga_gen 
    generic map (                       -- 720p values:             -- 1080p values:
        hRez        => 1920,            -- 1280                     -- 1920
        hStartSync  => 1920+88,         -- 1280 + 72                -- 1920 + 88
        hEndSync    => 1920+88+44,      -- 1280 + 72 + 80           -- 1920 + 88 + 44
        hMaxCount   => 1920+88+44+148,  -- 1280 + 72 + 80 + 216     -- 1920 + 88 + 44 + 148
        hsyncActive => '0',
        vRez        => 1080,             -- 720                      -- 1080
        vStartSync  => 1080+4,           -- 720 + 3                  -- 1080 + 4
        vEndSync    => 1080+4+5,         -- 720 + 3 + 5              -- 1080 + 4 + 5
        vMaxCount   => 1080+4+5+36,      -- 720 + 3 + 5 + 22         -- 1080 + 4 + 5 + 36
        vsyncActive => '1'
    )
    PORT MAP( 
        pixel_clock  => cEng_pixel,    
        pixel_h      => pixel_h,
        pixel_v      => pixel_v,
        blank        => blank,
        hsync        => hsync,
        vsync        => vsync
    );
    
    -- Data controller for communicating with SPI FIFO and SRAM
    data_cont: data_controller
    Port map ( CLK_I => cEng_pixel,
               HPIXEL_I => pixel_h,
               VPIXEL_I => pixel_v,
               BLANK_I => blank,
               FIFODATA_I => fifo_dout,
               FIFODV_I => fifo_dv,
               FIFOEMPTY_I => fifo_empty,
               SRAMDATA_IO => memdata,
               SRAMADDR_O => sramaddr,
               SRAMWEN_O => sramwen,
               FIFORD_O => fifo_rden,
               GAMMA_O => gamma,
               GAMMANEXT_O => gamma_next
             );
    
    -- DSP module for smoothening of pixel transitions
    color_filter: smoothening
    Port map ( CLK_I => cEng_pixel,
               GAMMA_I => gamma,
               GAMMANEXT_I => gamma_next,
               RED_O => red_val,
               GREEN_O => green_val,
               BLUE_O => blue_val
             );

    -- TMDS signal generation
    -- This takes pixel colour values and sync data, generating the
    -- 10-bit coding.
    dvid_1: dvid PORT MAP(
        clk        => cEng_5xpixel,
        clk_pixel  => cEng_pixel,
        red_p      => red_val,
        green_p    => green_val,
        blue_p     => blue_val,
        blank      => blank,
        hsync      => hsync,
        vsync      => vsync,
        diff_out_p => hdmi_out_p,
        diff_out_n => hdmi_out_n
    );
    
    --memaddr <= sramaddr;
    --memwen <= sramwen;
    -- Integrated Logic Analyzer
--    ila: ila_0
--    Port map ( clk => cEng_pixel,
--               probe0 => red_val,
--               probe1 => gamma,
--               probe2 => gamma_next,
--               probe3 => spi_clk,
--               probe4 => spi_ss,
--               probe5 => spi_mosi,
--               probe6 => sramaddr,
--               probe7 => pixel_h,
--               probe8 => pixel_v,
--               probe9 => fifo_empty,
--               probe10 => fifo_dv,
--               probe11 => fifo_wren
--    );

end Behavioral;
