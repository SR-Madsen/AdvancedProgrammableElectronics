library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lab2 is
    Generic (N : positive := 26);
    Port ( CLK_I : in STD_LOGIC;
           Q_O : out STD_LOGIC_VECTOR(6 downto 0));
end Lab2;

architecture Behavioral of Lab2 is

Component ila_0 is
PORT ( clk : IN STD_LOGIC;
       trig_in : IN STD_LOGIC;
       trig_in_ack : OUT STD_LOGIC;
       probe0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0));
END Component;

signal q : std_logic_vector(N-1 downto 0);
signal clk : std_logic;
signal ack: STD_LOGIC;

begin

    ila: ila_0
    Port map ( clk => CLK_I,
               trig_in => q(10),
               trig_in_ack => ack,
               probe0 => q(3 downto 0));

    clk<=CLK_I;
    Q_O<=q(N-1 downto N-7);
    
    process(clk) begin
        if (clk'event and clk = '1') then
        q <= q + 1;
    end if;
end process;


end Behavioral;
