----------------------------------------------------------------------------------
-- Company: SDU
-- Engineer: Sebastian
-- 
-- Create Date: 04/26/2022 11:48:25 AM
-- Design Name: 
-- Module Name: spi_slave_tx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Transmitter module for slave SPI
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity spi_slave_tx is
    Generic ( DATA_LENGTH : integer := 64);
    Port    ( SCLK_I : in STD_LOGIC;
              SS_I : in STD_LOGIC;
              TXDATA_I : in STD_LOGIC_VECTOR (DATA_LENGTH - 1 downto 0);
              MISO_O : out STD_LOGIC := '0';
              BUSY_O : out STD_LOGIC := '0');
end spi_slave_tx;

architecture Behavioral of spi_slave_tx is

type state_type is (READY, TRANSMIT, STOP);

signal state : state_type := READY;
signal index : integer := DATA_LENGTH - 1;

begin
    
    process(SCLK_I)
    begin
        if SCLK_I'event and SCLK_I = '0' then
            case state is
                when READY =>
                    if SS_I = '0' then
                        MISO_O <= TXDATA_I(index);
                        index <= index - 1;
                        BUSY_O <= '1';
                        state <= TRANSMIT;
                    end if;
                    
                when TRANSMIT =>
                    if index = 0 then
                        state <= STOP;
                    end if;
                    MISO_O <= TXDATA_I(index);
                    index <= index - 1;
                    
                when STOP =>
                    index <= DATA_LENGTH - 1;
                    BUSY_O <= '0';
                    state <= READY;
            end case;        
        end if;
    end process;
end Behavioral;
