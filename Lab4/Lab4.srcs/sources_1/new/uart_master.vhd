library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_master is
    Port ( CLK      : in STD_LOGIC;
           RESET    : in STD_LOGIC;
           RX_READY : in STD_LOGIC;
           TX_DONE  : in STD_LOGIC;
           DATA_IN  : in STD_LOGIC_VECTOR (7 downto 0);
           TX_READY : out STD_LOGIC := '0';
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0) := x"00";
           LEDS     : out STD_LOGIC_VECTOR (6 downto 0));
end uart_master;

architecture Behavioral of uart_master is

type STATE_TYPE is (Byte1, Byte2, Byte3, Byte4, Byte5, Byte6, Byte7, Byte8, Byte9, Byte10, Byte11);
signal state : STATE_TYPE := Byte1;

begin
    LEDS <= DATA_IN(6 downto 0) when RX_READY = '1';

    process(CLK, RESET)
        variable ready: STD_LOGIC := '0';
        variable data_sent: STD_LOGIC := '0';
    begin
        ready := '0';
        if RESET = '1' then
            state <= Byte1;
            DATA_OUT <= (others => '0');
        elsif CLK'event and CLK = '1' then
            case state is
            
                when Byte1 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"48"; -- H
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte2;
                    end if;
                    
                when Byte2 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"45"; -- E
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte3;
                    end if;
                                  
                when Byte3 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"4C"; -- L
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte4;
                    end if;
                
                when Byte4 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"4C"; -- L
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte5;
                    end if;
                    
                when Byte5 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"4F"; -- O
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte6;
                    end if;
                    
                when Byte6 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"57"; -- W
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte7;
                    end if;
                    
                when Byte7 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"4F"; -- O
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte8;
                    end if;
                
                when Byte8 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"52"; -- R
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte9;
                    end if;
                    
                when Byte9 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"4C"; -- L
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte10;
                    end if;
                    
                when Byte10 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"44"; -- D
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte11;
                    end if;
                    
                when Byte11 =>
                    if TX_DONE = '1' then
                        DATA_OUT <= x"0D"; -- \r
                        ready := '1';
                        data_sent := '1';
                    end if;
                    if TX_DONE = '0' and data_sent = '1' then
                        data_sent := '0';
                        state <= Byte1;
                    end if;
            end case;
            
            TX_READY <= ready;
            
        end if;
    end process;


end Behavioral;
