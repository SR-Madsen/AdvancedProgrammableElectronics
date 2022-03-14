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

signal baud_counter : integer range 0 to 15 := 9;

type STATE_TYPE is (Idle, Stop, Start, Bit0, Bit1, Bit2, Bit3, Bit4, Bit5, Bit6, Bit7);
signal state : STATE_TYPE := Idle;

signal rx_data : STD_LOGIC_VECTOR(7 downto 0) := x"00";

begin

    -- Baud counter logics
    Baud_divider: process(CLK, RESET)
    begin
        if RESET = '1' then
            baud_counter <= 0;
        elsif CLK'event and CLK = '1' and state /= Idle then            
            if baud_counter < 15 then
                baud_counter <= baud_counter + 1;
            else
                baud_counter <= 0;
            end if;
        end if;
        if state = Idle then
            baud_counter <= 9;
        end if;
    end process;
    
    -- Handshake signal
    READY <= '1' when state = Idle else '0';
    
    -- Next state logic
    Next_state: process(CLK, RESET)
    begin
        if RESET = '1' then
            state <= Idle;
            rx_data <= x"00";
            DATA <= x"00";
        elsif CLK'event and CLK = '1' then
            if state = Idle and RX = '0' then
                state <= Start;
            elsif baud_counter = 0 then
                case state is
                    when Idle  => null;
                    when Start => state <= Bit0;
                                  rx_data <= x"00";
                    when Bit0  => state <= Bit1;
                                  rx_data(0) <= RX;
                    when Bit1  => state <= Bit2;
                                  rx_data(1) <= RX;
                    when Bit2  => state <= Bit3;
                                  rx_data(2) <= RX;
                    when Bit3  => state <= Bit4;
                                  rx_data(3) <= RX;
                    when Bit4  => state <= Bit5;
                                  rx_data(4) <= RX;
                    when Bit5  => state <= Bit6;
                                  rx_data(5) <= RX;
                    when Bit6  => state <= Bit7;
                                  rx_data(6) <= RX;
                    when Bit7  => state <= Stop;
                                  rx_data(7) <= RX;
                    when Stop  => state <= Idle;
                                  DATA <= rx_data;
                end case;
            end if;
        end if;
    end process;
end Behavioral;
