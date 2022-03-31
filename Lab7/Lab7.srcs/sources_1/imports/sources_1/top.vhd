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
        led : out STD_LOGIC_VECTOR (3 downto 0);
        hdmi_out_p : out STD_LOGIC_VECTOR(3 downto 0);
        hdmi_out_n : out STD_LOGIC_VECTOR(3 downto 0)
    );
end top;

architecture Behavioral of top is
    COMPONENT clocking
    generic (
        clk_period : real := 41.66;
        clk_mul    : real := 46.40;    
        pix_div    : real := 15.0;
        pix5x_div  : integer := 3
    );
    PORT ( 
        clk_I           : in  STD_LOGIC;
        clkpixel_O      : out  STD_LOGIC;
        clk5xpixel_O    : out  STD_LOGIC;
        clk5xpixelinv_O : out  STD_LOGIC
    );
    END COMPONENT;

    COMPONENT vga_gen
    generic (
            hRez       : natural := 1280;    
            hStartSync : natural := 1280+72;
            hEndSync   : natural := 1280+72+80;
            hMaxCount  : natural := 1280+72+80+216;
            hsyncActive : std_logic := '0';
            
            vRez       : natural := 720;
            vStartSync : natural := 720+3;
            vEndSync   : natural := 720+3+5;
            vMaxCount  : natural := 720+3+5+22;
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
        clk_n    : IN std_logic;
        clk_pixel: IN std_logic;
        red_p    : IN std_logic_vector(7 downto 0);
        green_p  : IN std_logic_vector(7 downto 0);
        blue_p   : IN std_logic_vector(7 downto 0);
        blank    : IN std_logic;
        hsync    : IN std_logic;
        vsync    : IN std_logic;          
        red_s    : OUT std_logic;
        green_s  : OUT std_logic;
        blue_s   : OUT std_logic;
        clock_s  : OUT std_logic
    );
    END COMPONENT;

    -- Counter for LEDs
	signal count: unsigned(31 downto 0) := X"00000000";
	
    -- Clock engine    
    signal cEng_pixel : std_logic;
    signal cEng_5xpixel : std_logic;    
    signal cEng_5xpixel_inv : std_logic;
    
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
    
    -- TMDS
    signal red_s   : std_logic;
    signal green_s : std_logic;
    signal blue_s  : std_logic;
    signal clock_s : std_logic;
    
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
 
    -- Gen 74.25MHz pixel and 371.25MHz 5xpixel (+ inverted) clock generation
    -- This is for 1280x720x60Hz - frequency must change for other resolutions
    MMCM_clockEngine: clocking
     generic map (
         clk_period => 41.66,    -- Define 24 MHz period
         clk_mul    => 46.40,    -- Input: 24 MHz        - Result: 1113.6 MHz
         pix_div    => 15.0,     -- Target: 74.25 MHz    - Actual: 72.24 MHz
         pix5x_div  => 3         -- Target: 371.25 MHz   - Actual: 371.2 MHz
     )
     port map (
         clk_I              => CLK24MHZ,
         clkpixel_O         => cEng_pixel,
         clk5xpixel_O       => cEng_5xpixel,
         clk5xpixelinv_O    => cEng_5xpixel_inv
     );

    -- This generates controls and offsets required for a fixed resolution
    -- Default to 1280x720x60Hz. You can modify the below values, and clock,
    -- to output different resolutions.
    Inst_vga_gen: vga_gen 
    generic map (
        hRez        => 1280,
        hStartSync  => 1280+72,
        hEndSync    => 1280+72+80,
        hMaxCount   => 1280+72+80+216,
        hsyncActive => '0',
        vRez        => 720,
        vStartSync  => 720+3,
        vEndSync    => 720+3+5,
        vMaxCount   => 720+3+5+22,
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
    
    -- Colour pattern generation based on horiz/vert location
    red_ram_p <= std_logic_vector(signed( count(28 downto 21)) + signed( pixel_h(7 downto 0)));  
    green_ram_p <= std_logic_vector(signed( count(28 downto 21)) + signed( pixel_v(7 downto 0)));  
    blue_ram_p <= std_logic_vector(count(28 downto 21));

    -- TMDS signal generation
    -- This takes pixel colour values and synd data, generating the
    -- 10-bit coding.
    dvid_1: dvid PORT MAP(
        clk        => cEng_5xpixel,
        clk_n      => cEng_5xpixel_inv, 
        clk_pixel  => cEng_pixel,
        red_p      => red_ram_p,
        green_p    => green_ram_p,
        blue_p     => blue_ram_p,
        blank      => blank,
        hsync      => hsync,
        vsync      => vsync,
        
        -- outputs to TMDS drivers
        red_s      => red_s,
        green_s    => green_s,
        blue_s     => blue_s,
        clock_s    => clock_s
    );
    
    -- Differential output buffers
    OBUFDS_blue  : OBUFDS port map ( O  => hdmi_out_p(0), OB => hdmi_out_n(0), I  => blue_s );
    OBUFDS_green   : OBUFDS port map ( O  => hdmi_out_p(1), OB => hdmi_out_n(1), I  => green_s );
    OBUFDS_red : OBUFDS port map ( O  => hdmi_out_p(2), OB => hdmi_out_n(2), I  => red_s );
    OBUFDS_clock : OBUFDS port map ( O  => hdmi_out_p(3), OB => hdmi_out_n(3), I  => clock_s );

end Behavioral;
