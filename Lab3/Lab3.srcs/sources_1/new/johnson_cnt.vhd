library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity johnson_cnt is
    Port ( RESET_I : in STD_LOGIC;
           CLK_I : in STD_LOGIC;
           Q_O : out STD_LOGIC_VECTOR (3 downto 0));
end johnson_cnt;

architecture Behavioral of johnson_cnt is
    signal q: STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
Q_O <= q;

process (CLK_I, RESET_I)
begin
    if RESET_I = '1' then
        q <= "0000";
    elsif CLK_I'event and CLK_I = '1' then
        q(1) <= q(0);
        q(2) <= q(1);
        q(3) <= q(2);
        q(0) <= not q(3);
    end if;
end process;

end Behavioral;
