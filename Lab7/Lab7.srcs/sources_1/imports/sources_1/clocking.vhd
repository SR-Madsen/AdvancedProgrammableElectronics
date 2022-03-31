----------------------------------------------------------------------------------
-- Colin "domipheus" Riley
-- Clocking helper.
-- useful for generating clocks for DVI-D purposes with ODDR2 TMDS serialization
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity clocking is
 generic (
       clk_period : real := 41.66;
       clk_mul    : real := 46.40;    
       pix_div    : real := 15.0;
       pix5x_div  : integer := 3
  );
    Port ( 
        clk_I           : in  STD_LOGIC;
        clkpixel_O      : out  STD_LOGIC;
        clk5xpixel_O    : out  STD_LOGIC;
        clk5xpixelinv_O : out  STD_LOGIC
	);
end clocking;

architecture Behavioral of clocking is
    signal clock_pixel      : std_logic;
    signal clock_x5pixel    : std_logic;
    signal clock_x5pixelinv : std_logic;
    signal clk_feedback     : std_logic;

begin

    MMCME2_BASE_inst : MMCM_BASE
    generic map (
        BANDWIDTH => "OPTIMIZED",
        CLKFBOUT_MULT_F => clk_mul,
        
        CLKFBOUT_PHASE => 0.0,
        CLKIN1_PERIOD => clk_period,
        
        DIVCLK_DIVIDE => 1,
        REF_JITTER1 => 0.0,
        STARTUP_WAIT => FALSE,
         
        CLKOUT0_DIVIDE_F => pix_div,
        CLKOUT0_DUTY_CYCLE => 0.5,
        CLKOUT0_PHASE => 0.0,
        
        CLKOUT1_DIVIDE => pix5x_div,
        CLKOUT1_DUTY_CYCLE => 0.5,
        CLKOUT1_PHASE => 0.0,
        
        CLKOUT2_DIVIDE => pix5x_div,
        CLKOUT2_DUTY_CYCLE => 0.5,
        CLKOUT2_PHASE => 180.0
    )
    port map (
      CLKIN1   => clk_I,
      CLKOUT0  => clkpixel_O,
      CLKOUT1  => clk5xpixel_O,
      CLKOUT2  => clk5xpixelinv_O,
      CLKFBOUT => clk_feedback,
      CLKFBIN  => clk_feedback,
      RST      => '0',
      PWRDWN   => '0'
    );

end Behavioral;

