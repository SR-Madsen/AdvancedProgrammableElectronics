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
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

-- Modified for 24 MHZ
-- By Anders Stengaard Sørensen
-- University of Southern Denmark
-- 2022 03 24

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
        hdmi_out_n : out STD_LOGIC_VECTOR(3 downto 0)
    );
end top;

architecture Behavioral of top is
    COMPONENT clocking
    generic (
        clk_period : real := 41.66;
        clk_mul    : real := 30.94;
        pix_div    : real := 5.0;
        pix5x_div  : integer := 1
    );
    PORT ( 
        clk_I           : in  STD_LOGIC;
        clkpixel_O      : out  STD_LOGIC;
        clk5xpixel_O    : out  STD_LOGIC
    );
    END COMPONENT;

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

    -- Counter for LEDs
	signal count: unsigned(31 downto 0) := X"00000000";
	
    -- Clock engine    
    signal cEng_pixel : std_logic;
    signal cEng_5xpixel : std_logic;
    
    -- VGA timing
    signal pixel_h : STD_LOGIC_VECTOR(11 downto 0);
    signal pixel_v : STD_LOGIC_VECTOR(11 downto 0);
    signal blank   : std_logic;
    signal hsync   : std_logic;
    signal vsync   : std_logic;
    
    -- Pixel colour data
    signal red_ram_p   : std_logic_vector(7 downto 0) := (others => '0');
    signal green_ram_p : std_logic_vector(7 downto 0) := (others => '0');
    signal blue_ram_p  : std_logic_vector(7 downto 0) := (others => '0');
    
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
 
    -- Generate the pixel clock and 5x pixel clock              -- 720p target : 72.25 MHz pixel clock (371.25 MHz 5x)
    -- The frequency is resolution and refresh rate dependent   -- 1080p@50Hz target: 123.75 MHz pixel clock (618.75 MHz 5x)
    MMCM_clockEngine: clocking                                  -- 1080p@60Hz target: 148.5 MHz pixel clock (742.5 MHz 5x)
     generic map (
         clk_period => 41.66,    -- Define 24 MHz period
         clk_mul    => 30.94,    -- Input: 24 MHz               -- 720p: 46.40 => 1113.6 MHz, 1080p@50Hz: 25.78 => 618.72 MHz, 1080p@60Hz: 30.94 => 742.56 MHz
         pix_div    => 5.00,     --                             -- 720p: 15.0  => 72.24 MHz , 1080p@50Hz: 5.0   => 123.74 MHz, 1080p@60Hz: 5.0   => 148.512 MHz
         pix5x_div  => 1         --                             -- 720p: 3     => 371.2 MHz , 1080p@50Hz: 1     => 618.72 MHz, 1080p@60Hz: 1     => 742.56 MHz
     )
     port map (
         clk_I              => CLK24MHZ,
         clkpixel_O         => cEng_pixel,
         clk5xpixel_O       => cEng_5xpixel
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
    
    process(pixel_h, pixel_v)
    begin
        if unsigned(pixel_h) = 200 or unsigned(pixel_h) = 1720 then
            red_ram_p <= x"00";
            green_ram_p <= x"00";
            blue_ram_p <= x"00";
        elsif unsigned(pixel_v) = 200 or unsigned(pixel_v) = 880 then
            red_ram_p <= x"00";
            green_ram_p <= x"00";
            blue_ram_p <= x"00";
        else
            red_ram_p <= x"FF";
            green_ram_p <= x"FF";
            blue_ram_p <= x"FF";
        end if;
    end process;
    
    -- Colour pattern generation based on horiz/vert location
    --red_ram_p <= std_logic_vector(signed( count(28 downto 21)) + signed( pixel_h(7 downto 0)));
    --green_ram_p <= std_logic_vector(signed( count(28 downto 21)) + signed( pixel_v(7 downto 0)));
    --blue_ram_p <= std_logic_vector(count(28 downto 21));

    -- TMDS signal generation
    -- This takes pixel colour values and sync data, generating the
    -- 10-bit coding.
    dvid_1: dvid PORT MAP(
        clk        => cEng_5xpixel,
        clk_pixel  => cEng_pixel,
        red_p      => red_ram_p,
        green_p    => green_ram_p,
        blue_p     => blue_ram_p,
        blank      => blank,
        hsync      => hsync,
        vsync      => vsync,
        diff_out_p => hdmi_out_p,
        diff_out_n => hdmi_out_n
    );

end Behavioral;
