library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_mod is
  Generic (N : positive := 33);
  -- MSB: 100Mhz/2^32 ~0.023 Hz 
  -- LSB: 100MHz/2^25 ~3 Hz
  Port (CLK_I : in  STD_LOGIC;
          Q_O : out STD_LOGIC_VECTOR(6 downto 0));
end counter_mod;

architecture Behavioral of counter_mod is

  signal q : std_logic_vector(N-1 downto 0);
  signal clk12 : std_logic;
  signal clk100 : std_logic;

-----------------
 Component my_mmcm    -- Declare module that is defined in other file 
    Generic   (CLK_IN_PERIOD :real := 40.00); -- Period of input clock in ns
    Port ( RESET_I    : std_logic;
           CLK_I      : in STD_LOGIC;
           CLK100_O      : out STD_LOGIC;
           CLK33_O       : out STD_LOGIC;
           CLK20_O       : out STD_LOGIC);
end Component;
------------------
     
begin
  clk12<=CLK_I;           -- rename clock input (alias could be used instead)
  Q_O<=q(N-1 downto N-7); -- Map top 7 bits of counter to outputs
  
 clock: my_mmcm                        -- Instantiate a copy of my_mmcm module declared above
 Generic map (CLK_IN_PERIOD=>40.00)  -- This is the actual value passed to that instance of the module 
                                       -- it will be overrided by -clock period in constraints file though
 Port  map (
  RESET_I    => '0',                   -- Never RESET
  CLK_I => clk12,                      -- Use 12MHz as input clock
  CLK100_O => clk100);                 -- Map the 100MHz clock output to clk100 signal
  
  
  process(clk100) begin                -- The (32) bit counter
    if (clk100'event and clk100 = '1') then
      q<=q+1;
    end if;
  end process;
end Behavioral;
