library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binary_cnt is
    Port ( RESET_I : in STD_LOGIC;
           CLK_I : in STD_LOGIC;
           Q_O : out STD_LOGIC_VECTOR (7 downto 0));
end binary_cnt;

architecture Behavioral of binary_cnt is
    signal q : std_logic_vector (7 downto 0);

begin
    Q_O <= q;
    
    process (CLK_I, RESET_I)
    begin
        if RESET_I = '1' then
            q <= "00000000";
        elsif CLK_I'event and CLK_I = '1' then
            q <= q + 1;
        end if;
    end process;
end Behavioral;
