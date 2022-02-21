
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity onehot_cnt is
    Port ( RESET_I : in STD_LOGIC;
           CLK_I : in STD_LOGIC;
           Q_O : out STD_LOGIC_VECTOR (15 downto 0));
end onehot_cnt;

architecture Behavioral of onehot_cnt is
    signal q : std_logic_vector (15 downto 0);
    

begin
    Q_O <= q;
    
    process (CLK_I, RESET_I)
    begin
        if RESET_I = '1' then
            q <= "0000000000000001";
        elsif CLK_I'event and CLK_I = '1' then
            q(0) <= q(15);
            q(15 downto 1) <= q(14 downto 0);
        end if;    
    end process;
end Behavioral;
