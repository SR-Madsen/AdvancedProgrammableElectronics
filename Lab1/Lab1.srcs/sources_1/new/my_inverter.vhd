library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--entity my_inverter is
--    Port ( A_I : in STD_LOGIC;
--           Q_O : out STD_LOGIC);
--end my_inverter;

entity my_inverter is
        Port (CLK_I : in STD_LOGIC;
              Q_O : out STD_LOGIC_VECTOR(6 downto 0));
end my_inverter;

architecture Behavioral of my_inverter is

--begin
--    Q_O <= not A_I;
--end Behavioral;

signal q : std_logic_vector(6 downto 0) := "0000000";
signal clk : std_logic;

begin
    clk<=CLK_I;
    Q_O<=q;
    
    process(clk) begin
        if rising_edge(clk) then
            q<=q+1;
        end if;
    end process;
    
end Behavioral;


-- Updating the VHDL code to have two inputs: Add A/B as STD_logic in
-- AND: Q <= A and B;
-- NAND: Q <= not (A and B);
-- OR: Q <= A or B;
-- NOR: Q <= not (A or B);
-- XOR: Q <= A xor B;