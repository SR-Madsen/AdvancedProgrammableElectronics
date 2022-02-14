library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lab2 is
    Generic (N : positive := 26);
    Port ( CLK_I : in STD_LOGIC;
           Q_O : out STD_LOGIC_VECTOR(6 downto 0));
end Lab2;

architecture Behavioral of Lab2 is

signal q : std_logic_vector(N-1 downto 0);
signal clk : std_logic;

begin
    clk<=CLK_I;
    Q_O<=q(N-1 downto N-7);
    
    process(clk) begin
        if (clk'event and clk = '1') then
        q <= q + 1;
    end if;
end process;


end Behavioral;
