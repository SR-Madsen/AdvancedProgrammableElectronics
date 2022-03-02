library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity mmcm is
Generic (CLK_IN_PERIOD : real range 0.938 to 100.000 := 83.33);
   Port (RESET_I       : std_logic;
         CLK_I         : in STD_LOGIC;
         CLK16_O       : out STD_LOGIC);
         --CLK33_O    : out STD_LOGIC;
         --CLK20_O    : out STD_LOGIC);
end mmcm;

architecture Behavioral of mmcm is

signal clk_feedback : std_logic; -- for mmcm feedback loop
  
begin
  
MMCME2_BASE_inst : MMCME2_BASE
  generic map (
    BANDWIDTH => "OPTIMIZED",  
    CLKFBOUT_MULT_F => 64.0,         -- 12 MHz * 64.00 = 768 MHz   <<--- Adapt to actual clock frequency
                                     -- The multiply factor must be chosen so fclk * multiplier is in the 600MHz to 1.2GHz interval
    CLKFBOUT_PHASE => 0.0,           -- no phase change
    CLKIN1_PERIOD => CLK_IN_PERIOD,  -- set to generic input
    
    -- CLKOUT0..5_DIVIDE : Divide amount for each CLKOUT (1-128)
    CLKOUT0_DIVIDE_F => 48.0,        -- 768/48.0 = 16 MHz
    CLKOUT0_DUTY_CYCLE => 0.5,       -- 50% duty cycle
    CLKOUT0_PHASE => 0.0,            -- 0 degree phase
    
    --CLKOUT1_DIVIDE =>21,             -- 700/21 = 33.333MHz
    --CLKOUT1_DUTY_CYCLE => 0.5,       -- 50% duty cycle
    --CLKOUT1_PHASE => 0.0,            -- 0 degree phase
    
    --CLKOUT2_DIVIDE =>35,             -- 700/35 = 20MHz
    --CLKOUT2_DUTY_CYCLE => 0.5,       -- 50% duty cycle
    --CLKOUT2_PHASE => 180.0,          -- 90 degree phase
    
    DIVCLK_DIVIDE => 1,              -- Go for = 1:1 PLL freq
    REF_JITTER1 => 0.0,              -- Reference input jitter
    STARTUP_WAIT => FALSE            -- Delay DONE until PLL Locks,
   )
   port map (
    CLKOUT0 => CLK16_O,   
    --CLKOUT1 => CLK33_O ,
    --CLKOUT2 => CLK20_O ,
    CLKFBOUT => clk_feedback,        -- provide internal feedback
    CLKIN1 => CLK_I,                 -- 1-bit input: Input clock
    PWRDWN => '0',                   -- 1-bit input: Power-down
    RST => RESET_I,                  -- 1-bit input: Reset
    CLKFBIN => clk_feedback          -- 1-bit input: Feedback clock
   );

end Behavioral;
