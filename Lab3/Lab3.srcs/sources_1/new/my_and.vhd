
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity my_and is
    Port ( A_I : in STD_LOGIC;
           B_I : in STD_LOGIC;
           Q_O : out STD_LOGIC);
end my_and;

architecture Behavioral of my_and is

begin

Q_O <= A_I and B_I;

end Behavioral;
