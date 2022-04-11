--------------------------------------------------------------------------------
-- Engineer:      Mike Field <hamster@snap.net.nz>
-- Description:   Converts VGA signals into DVID bitstreams.
--
--                'clk' and 'clk_n' should be 5x clk_pixel.
--
--                'blank' should be asserted during the non-display 
--                portions of the frame
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity dvid is
    Port ( clk       : in  STD_LOGIC;
           clk_pixel : in  STD_LOGIC;
           red_p     : in  STD_LOGIC_VECTOR (7 downto 0);
           green_p   : in  STD_LOGIC_VECTOR (7 downto 0);
           blue_p    : in  STD_LOGIC_VECTOR (7 downto 0);
           blank     : in  STD_LOGIC;
           hsync     : in  STD_LOGIC;
           vsync     : in  STD_LOGIC;
           diff_out_p: out STD_LOGIC_VECTOR(3 downto 0);
           diff_out_n: out STD_LOGIC_VECTOR(3 downto 0));
           --blue_s    : out STD_LOGIC;
           --red_s     : out STD_LOGIC;
           --green_s   : out STD_LOGIC;
           --clock_s   : out STD_LOGIC);
end dvid;

architecture Behavioral of dvid is
   COMPONENT TMDS_encoder
   PORT(
      clk     : IN  std_logic;
      data    : IN  std_logic_vector(7 downto 0);
      c       : IN  std_logic_vector(1 downto 0);
      blank   : IN  std_logic;          
      encoded : OUT std_logic_vector(9 downto 0)
      );
   END COMPONENT;
   
   Component serializer is
   Port ( CLK_PIXEL_I    : in STD_LOGIC;
          CLK_5XPIXEL_I  : in STD_LOGIC;
          RESET_I        : in STD_LOGIC;
          PDATA_I        : in STD_LOGIC_VECTOR(9 downto 0);
          SDATA_O        : out STD_LOGIC
        );
   end Component;

   signal encoded_red, encoded_green, encoded_blue : std_logic_vector(9 downto 0);
   signal latched_red, latched_green, latched_blue : std_logic_vector(9 downto 0) := (others => '0');
   
   signal shift_clock   : std_logic_vector(9 downto 0) := "0000011111";
   
   constant c_red       : std_logic_vector(1 downto 0) := (others => '0');
   constant c_green     : std_logic_vector(1 downto 0) := (others => '0');
   signal   c_blue      : std_logic_vector(1 downto 0);
   
   signal red_s : STD_LOGIC;
   signal green_s : STD_LOGIC;
   signal blue_s : STD_LOGIC;
   signal clock_s : STD_LOGIC;

begin
    
    c_blue <= vsync & hsync;
   
    TMDS_encoder_red:   TMDS_encoder PORT MAP(clk => clk_pixel, data => red_p,   c => c_red,   blank => blank, encoded => encoded_red);
    TMDS_encoder_green: TMDS_encoder PORT MAP(clk => clk_pixel, data => green_p, c => c_green, blank => blank, encoded => encoded_green);
    TMDS_encoder_blue:  TMDS_encoder PORT MAP(clk => clk_pixel, data => blue_p,  c => c_blue,  blank => blank, encoded => encoded_blue);
   
    process(clk_pixel)
    begin
       if rising_edge(clk_pixel) then 
             latched_red   <= encoded_red;
             latched_green <= encoded_green;
             latched_blue  <= encoded_blue;
       end if;
    end process;
   
    SERDES_red: serializer port map (
                     CLK_PIXEL_I => clk_pixel,
                     CLK_5XPIXEL_I => clk,
                     RESET_I => '0',
                     PDATA_I => latched_red,
                     SDATA_O => red_s);
                    
    SERDES_green: serializer port map (
                     CLK_PIXEL_I => clk_pixel,
                     CLK_5XPIXEL_I => clk,
                     RESET_I => '0',
                     PDATA_I => latched_green,
                     SDATA_O => green_s);
                     
    SERDES_blue: serializer port map (
                     CLK_PIXEL_I => clk_pixel,
                     CLK_5XPIXEL_I => clk,
                     RESET_I => '0',
                     PDATA_I => latched_blue,
                     SDATA_O => blue_s);
                     
    SERDES_clock: serializer port map (
                     CLK_PIXEL_I => clk_pixel,
                     CLK_5XPIXEL_I => clk,
                     RESET_I => '0',
                     PDATA_I => shift_clock,
                     SDATA_O => clock_s);
                      
                      
    -- Differential output buffers
    OBUFDS_blue  : OBUFDS port map ( O  => diff_out_p(0), OB => diff_out_n(0), I  => blue_s );
    OBUFDS_green : OBUFDS port map ( O  => diff_out_p(1), OB => diff_out_n(1), I  => green_s );
    OBUFDS_red   : OBUFDS port map ( O  => diff_out_p(2), OB => diff_out_n(2), I  => red_s );
    OBUFDS_clock : OBUFDS port map ( O  => diff_out_p(3), OB => diff_out_n(3), I  => clock_s );

   
end Behavioral; 