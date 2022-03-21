-------------------------------------------------------------------
-- mmcm48        : A 48MHz Clock generator
-- Revision      : 2019-11-14
-- Submodule for : QLinkMaster
-- 
-- (C) 2019  Anders Stengaard Sørensen (Author), Denmark
-- 
-- This VHDL source fil may be used, distributed and changed in any way, by anyone on the following conditions:
-- 1) The Author provide no guarantee and is not in any way liable for any issues that arise from the use of this source
-- For more information, see the QLinkMaster module source

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;                    -- For Xilinx primitives
use UNISIM.vcomponents.all;        --   allow all "components"

entity mmcm48 is
Generic   (CLK_I_PERIOD : real 
           range 2.0 to 64.0 := 40.0); -- Period of input clock in ns
    Port ( RESET_I    : std_logic;
           CLK_I      : in STD_LOGIC;
           CLK48_O    : out STD_LOGIC;
           PLL_LOCK_O : out STD_LOGIC);
end mmcm48;

architecture rtl of mmcm48 is
  signal clk_feedback : std_logic;
  
begin 
  
MMCME2_BASE_inst : MMCME2_BASE
  generic map (
    BANDWIDTH => "OPTIMIZED",  
    CLKFBOUT_MULT_F => CLK_I_PERIOD, -- 40, -- 25MHz*40 = 1.000 GHz
    CLKFBOUT_PHASE => 0.0,  -- no phase change
    CLKIN1_PERIOD => CLK_I_PERIOD,  -- Specify 40ns <-> 25MHz for check
    -- CLKOUT0..5_DIVIDE : Divide amount for each CLKOUT (1-128)
    CLKOUT0_DIVIDE_F =>62.5, -- 16 MHz  .... 20.8333,  -- 48MHz
--    CLKOUT1_DIVIDE =>10,  --    100MHz
    CLKOUT0_DUTY_CYCLE => 0.5,  -- 50% duty cycle
--    CLKOUT1_DUTY_CYCLE => 0.5,  -- 50% duty cycle
    CLKOUT0_PHASE => 0.0,      -- 0 degree phase
--    CLKOUT1_PHASE => 0.0,     -- 90 degree phase
    DIVCLK_DIVIDE => 1,        -- Go for 25MHzx40/1 = 1GHz PLL freq
    STARTUP_WAIT => FALSE    -- Delay DONE until PLL Locks,
   )
   port map (
    CLKOUT0 => CLK48_O,   -- 1-bit output:
--    CLKOUT1 => CLK_1,
    -- CLKOUT1 => clk25_90,   -- 1-bit output:
    CLKFBOUT => clk_feedback, -- provide feedback
    CLKIN1 => CLK_I,     -- 1-bit input: Input clock
    PWRDWN => '0',     -- 1-bit input: Power-down
    RST => RESET_I,           -- 1-bit input: Reset
    CLKFBIN => clk_feedback,    -- 1-bit input: Feedback clock
    LOCKED => PLL_LOCK_O
   );
end rtl;
