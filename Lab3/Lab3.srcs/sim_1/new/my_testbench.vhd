
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity my_testbench is
--  Port ( );
end my_testbench;

architecture Behavioral of my_testbench is

component my_and
    Port (A_I : in STD_LOGIC;
          B_I : in STD_LOGIC;
          Q_O : out STD_LOGIC);
end component;

signal stim : std_logic_vector(1 downto 0);
signal resp : std_logic;

begin
U1 : my_and port map (
    A_I => stim(0),
    B_I => stim(1),
    Q_O => resp);
    
stim <= "00",
        "01" after 1000 ns,
        "11" after 2000 ns,
        "10" after 3000 ns;

end Behavioral;
