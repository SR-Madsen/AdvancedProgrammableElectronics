library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_level is
    Port ( CLK_I : in STD_LOGIC;
           DATAP_O : out STD_LOGIC;
           DATAN_O : out STD_LOGIC);
end top_level;


architecture Behavioral of top_level is

component diff_o is
    Port ( INPUT : in STD_LOGIC;
           OUTP : out STD_LOGIC;
           OUTN : out STD_LOGIC);
end component;

signal buffer_input: STD_LOGIC_VECTOR(21 downto 0) := (others => '0');

begin

    o_buffer: diff_o
    port map ( INPUT => buffer_input(21),
               OUTP => DATAP_O,
               OUTN => DATAN_O);
    
    process(CLK_I)
    begin
        if CLK_I'event and CLK_I = '1' then
            buffer_input <= buffer_input + 1;
        end if;
    end process;

end Behavioral;
