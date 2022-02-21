library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_bench is
--  Port ( );
end counter_bench;

architecture Behavioral of counter_bench is

component counter_top
Port ( CLK_I : in STD_LOGIC;
       RESET_I : in STD_LOGIC;
       Q_BIN_O : out STD_LOGIC_VECTOR(7 downto 0);
       Q_HOT_O : out STD_LOGIC_VECTOR(15 downto 0);
       Q_RIP_O : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal reset : STD_LOGIC := '1';
signal clk : STD_LOGIC := '0';
signal q_binary : STD_LOGIC_VECTOR(7 downto 0);  
signal q_ripple : STD_LOGIC_VECTOR(7 downto 0);
signal q_onehot : STD_LOGIC_VECTOR(15 downto 0);     

begin

reset <= '0' after 100 ns;
clk <= not clk after 7 ns;

U1: counter_top port map (
    RESET_I => reset,
    CLK_I => clk,
    Q_BIN_O => q_binary,
    Q_RIP_O => q_ripple,
    Q_HOT_O => q_onehot);

end Behavioral;
