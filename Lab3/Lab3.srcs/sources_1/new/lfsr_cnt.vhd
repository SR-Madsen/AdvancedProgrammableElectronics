library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr_cnt is
    Port ( RESET_I : in STD_LOGIC;
           CLK_I : in STD_LOGIC;
           Q_O : out STD_LOGIC_VECTOR (3 downto 0));
end lfsr_cnt;

architecture Behavioral of lfsr_cnt is
    signal q, q_next: STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal feedback: STD_LOGIC;

begin
Q_O <= q;
    
process (CLK_I, RESET_I)
begin
    if RESET_I = '1' then
        q <= "0000";
    elsif CLK_I'event and CLK_I = '1' then
        q <= q_next;
    end if;
end process;

feedback <= q(3) XOR q(2);
q_next <= feedback & q(7 downto 1);

end Behavioral;
