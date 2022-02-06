library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_inverter is
        Port (CLK_O : out STD_LOGIC;
              LED_O : out STD_LOGIC_VECTOR(6 downto 0);
              U10_IO : inout STD_LOGIC;
              U13_I : in STD_LOGIC);
end my_inverter;


architecture Behavioral of my_inverter is


signal leds : std_logic_vector(6 downto 0) := "0000000";
signal clk : std_logic;

signal q13 : std_logic;
signal q12_11 : std_logic;
signal q10 : std_logic;
signal q09 : std_logic;


begin
    -- Input to first inverter
    q13 <= U13_I;
    
    -- Instantly propagate through another inverter
    q12_11 <= not q13;
    q10 <= not q12_11;

    -- Output to capacitor.
    U10_IO <= q10;
    
    -- Read back from capacitor, output as clock through inverter
    q09    <= U10_IO;
    clk    <= not q09;

    -- Connect clock and LED outputs
    CLK_O <= clk;
    LED_O <= leds;
    
    -- LED update
    process(clk) begin
        if rising_edge(clk) then
            leds <= leds + 1;
        end if;
    end process;
end Behavioral;


-- Updating the VHDL code to have two inputs: Add A/B as STD_logic in
-- AND: Q <= A and B;
-- NAND: Q <= not (A and B);
-- OR: Q <= A or B;
-- NOR: Q <= not (A or B);
-- XOR: Q <= A xor B;