----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2022 12:39:30 PM
-- Design Name: 
-- Module Name: spi_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: SPI controller for TX and RX slaves
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity spi_controller is
    Generic ( SPI_DATA_LENGTH : integer := 64);
    Port    ( CLK_I : in STD_LOGIC;
              SPIDATA_I : in STD_LOGIC_VECTOR(SPI_DATA_LENGTH - 1 downto 0);
              SPIDATA_O : out STD_LOGIC_VECTOR(SPI_DATA_LENGTH - 1 downto 0) := (others => '0');
              WREN_O : out STD_LOGIC := '0';
           
              SCLK_I : in STD_LOGIC;
              SS_I : in STD_LOGIC;
              MOSI_I : in STD_LOGIC;
              MISO_O : out STD_LOGIC := '0'
    );
end spi_controller;

architecture Behavioral of spi_controller is

Component spi_slave_rx is
    Generic ( DATA_LENGTH : integer := SPI_DATA_LENGTH);
    Port    ( SCLK_I : in STD_LOGIC;
              SS_I : in STD_LOGIC;
              MOSI_I : in STD_LOGIC;
              RXDATA_O : out STD_LOGIC_VECTOR (DATA_LENGTH - 1 downto 0);
              BUSY_O : out STD_LOGIC);
end Component;

signal spidata : STD_LOGIC_VECTOR(SPI_DATA_LENGTH - 1 downto 0) := (others => '0');
signal busy_rx : STD_LOGIC := '0';

Component spi_slave_tx is
    Generic ( DATA_LENGTH : integer := SPI_DATA_LENGTH);
    Port    ( SCLK_I : in STD_LOGIC;
              SS_I : in STD_LOGIC;
              TXDATA_I : in STD_LOGIC_VECTOR (DATA_LENGTH - 1 downto 0);
              MISO_O : out STD_LOGIC;
              BUSY_O : out STD_LOGIC);
end Component;

signal busy_tx : STD_LOGIC := '0';

type state_type is (DATED, FRESH, OUTPUT);
signal state : state_type := DATED;

begin
    
    rx_module: spi_slave_rx
    port map ( SCLK_I   => SCLK_I,
               SS_I     => SS_I,
               MOSI_I   => MOSI_I,
               RXDATA_O => spidata,
               BUSY_O   => busy_rx
    );
    
    tx_module: spi_slave_tx
    port map ( SCLK_I   => SCLK_I,
               SS_I     => SS_I,
               TXDATA_I => SPIDATA_I,
               MISO_O   => MISO_O,
               BUSY_O   => busy_tx
    );

    process(CLK_I)
    begin
        if CLK_I'event and CLK_I = '1' then
            case state is
                when DATED =>
                    if busy_rx = '1' then
                        state <= FRESH;
                    end if;
                when FRESH =>
                    if busy_rx = '0' then
                        WREN_O <= '1';
                        SPIDATA_O <= spidata;
                        state <= OUTPUT;
                    end if;
                when OUTPUT =>
                    WREN_O <= '0';
                    state <= DATED;
            end case;
        end if;
    end process;

end Behavioral;
