library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_rx is
    Port ( CLK     : in STD_LOGIC;
           RX      : in STD_LOGIC;
           RESET   : in STD_LOGIC;
           READY   : out STD_LOGIC := '0';
           DATA    : out STD_LOGIC_VECTOR (7 downto 0) := x"00");
end uart_rx;

architecture Behavioral of uart_rx is

signal baud_counter : integer range 0 to 15 := 0;

type STATE_TYPE is (Stop, Start, Bit0, Bit1, Bit2, Bit3, Bit4, Bit5, Bit6, Bit7);
signal state : STATE_TYPE := Stop;


begin

    -- Baud counter logics
    Baud_divider: process(CLK, RESET)
    begin
        if RESET = '1' then
            baud_counter <= 0;
        elsif CLK'event and CLK = '1' then            
            if baud_counter < 15 then
                baud_counter <= baud_counter + 1;
            else
                baud_counter <= 0;
            end if;
        end if;
    end process;
    
    -- Handshake signal
    READY <= '1' when state = Stop else '0';
    
    -- Next state logic
    Next_state: process(CLK, RESET)
    begin
        if RESET = '1' then
            state <= Stop;
        elsif CLK'event and CLK = '1' then
            if baud_counter = 0 then
                case state is
                    when Stop  => if RX = '0' then
                                  state <= Start; end if;
                    when Start => state <= Bit0;
                    when Bit0  => state <= Bit1;
                    when Bit1  => state <= Bit2;
                    when Bit2  => state <= Bit3;
                    When Bit3  => state <= Bit4;
                    When Bit4  => state <= Bit5;
                    When Bit5  => state <= Bit6;
                    When Bit6  => state <= Bit7;
                    When Bit7  => state <= Stop;
                end case;
            end if;
        end if;
    end process;

    -- Output logic
    Output_logic: process(state)
    begin
        case state is
            when Bit0   =>  DATA(0) <= RX;
            when Bit1   =>  DATA(1) <= RX;
            when Bit2   =>  DATA(2) <= RX;
            when Bit3   =>  DATA(3) <= RX;
            when Bit4   =>  DATA(4) <= RX;
            when Bit5   =>  DATA(5) <= RX;
            when Bit6   =>  DATA(6) <= RX;
            when Bit7   =>  DATA(7) <= RX;
            when Start  =>  DATA    <= x"00";
            when others =>  null;
        end case;
    end process;
end Behavioral;
