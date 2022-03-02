library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_tx is
    Port ( CLK     : in STD_LOGIC;
           READY   : in STD_LOGIC;
           DATA    : in STD_LOGIC_VECTOR (7 downto 0);
           RESET   : in STD_LOGIC;
           DONE    : out STD_LOGIC := '1';
           TX      : out STD_LOGIC := '1');
end uart_tx;

architecture Behavioral of uart_tx is

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
    DONE <= '1' when state = Stop else '0';
    
    -- Next state logic
    Next_state: process(CLK, RESET)
    begin
        if RESET = '1' then
            state <= Stop;
        elsif CLK'event and CLK = '1' then
            if baud_counter = 0 then
                case state is
                    when Stop  => if READY = '1' then 
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
            when Stop  =>  TX <= '1';
            when Start =>  TX <= '0';
            when Bit0  =>  TX <= DATA(0);
            when Bit1  =>  TX <= DATA(1);
            when Bit2  =>  TX <= DATA(2);
            when Bit3  =>  TX <= DATA(3);
            when Bit4  =>  TX <= DATA(4);
            when Bit5  =>  TX <= DATA(5);
            when Bit6  =>  TX <= DATA(6);
            when Bit7  =>  TX <= DATA(7);
        end case;
      end process;
end Behavioral;