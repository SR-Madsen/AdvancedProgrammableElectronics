----------------------------------------------------------------------------------
-- Company: SDU
-- Engineer: Sebastian
-- 
-- Create Date: 04/26/2022 11:48:25 AM
-- Design Name: 
-- Module Name: spi_slave_rx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Receiver module for slave SPI
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity spi_slave_rx is
    Generic ( DATA_LENGTH : integer := 64);
    Port    ( SCLK_I : in STD_LOGIC;
              SS_I : in STD_LOGIC;
              MOSI_I : in STD_LOGIC;
              RXDATA_O : out STD_LOGIC_VECTOR (DATA_LENGTH - 1 downto 0) := (others => '0');
              BUSY_O : out STD_LOGIC := '0');
end spi_slave_rx;

architecture Behavioral of spi_slave_rx is

type state_type is (READY, RECEIVE, STOP);

signal state        : state_type := READY;
signal rxdata_temp  : STD_LOGIC_VECTOR(DATA_LENGTH - 1 downto 0);
signal index        : integer := DATA_LENGTH - 1;

begin

    process(SCLK_I)
    begin
        if SCLK_I'event and SCLK_I = '1' then
            case state is
                when READY =>
                    if SS_I = '0' then
                        rxdata_temp(index) <= MOSI_I;
                        index <= index - 1;
                        BUSY_O <= '1';
                        state <= RECEIVE;
                    end if;
                
                when RECEIVE =>
                    if index = 0 then
                        state <= STOP;
                    end if;
                    rxdata_temp(index) <= MOSI_I;
                    index <= index - 1;
                    
                when STOP =>
                    RXDATA_O <= rxdata_temp;
                    rxdata_temp <= (others => '0');
                    BUSY_O <= '0';
                    index <= DATA_LENGTH - 1;
                    state <= READY;
            end case;
        end if;
    end process;
end Behavioral;
