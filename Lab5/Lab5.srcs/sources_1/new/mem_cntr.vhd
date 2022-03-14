library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mem_cntr is
    Port ( CLK_I : in STD_LOGIC;
           RESET_I : in STD_LOGIC;
           READY_I : in STD_LOGIC;
           ADDR_O : out STD_LOGIC_VECTOR (4 downto 0));
end mem_cntr;

architecture Behavioral of mem_cntr is

type STATE_TYPE is (LOW, HIGH);
signal state : STATE_TYPE := LOW;

signal address: STD_LOGIC_VECTOR(4 downto 0) := "00000";

begin

ADDR_O <= address;

process(CLK_I)
begin
    if RESET_I = '1' then
        address <= "00000";
    elsif CLK_I'event and CLK_I = '1' then
        case state is
            when LOW =>
                if READY_I = '1' then
                    address <= address + 1;
                    state <= HIGH;
                end if;
            
            when HIGH =>
                if READY_I = '0' then
                    state <= LOW;
                end if;
        end case;
    end if;
end process;

end Behavioral;
