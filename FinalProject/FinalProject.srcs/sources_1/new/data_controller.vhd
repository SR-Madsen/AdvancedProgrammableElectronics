----------------------------------------------------------------------------------
-- Company: SDU
-- Engineer: Sebastian
-- 
-- Create Date: 05/03/2022 09:50:00 AM
-- Design Name: 
-- Module Name: data_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Used for collecting data from SPI and writing it to the SRAM, as well
-- as reading data from the SRAM as instructed by VGA driver.
--
-- Responsibilities:
-- Read from the FIFO whenever data is ready. Do not output to the screen untill image end is received.
-- Split FIFO data into address and RGB.
-- Turn RGB into gamma value.
-- Store gamma value in SRAM.
--
-- Continuously read the next pixel's gamma value and save both current and next.
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_controller is
    Port ( CLK_I        : in STD_LOGIC;                         -- Pixel clock
           HPIXEL_I     : in STD_LOGIC_VECTOR(11 downto 0);     -- Horizontal pixel value
           VPIXEL_I     : in STD_LOGIC_VECTOR(11 downto 0);     -- Vertical pixel value
           BLANK_I      : in STD_LOGIC;                         -- Indicates blank part of the screen
           FIFODATA_I   : in STD_LOGIC_VECTOR(63 downto 0);     -- Data from FIFO
           FIFODV_I     : in STD_LOGIC;                         -- Data valid signal from FIFO
           FIFOEMPTY_I  : in STD_LOGIC;                         -- FIFO empty signal
           SRAMDATA_IO  : inout STD_LOGIC_VECTOR(7 downto 0);   -- Data to and from SRAM
           SRAMADDR_O   : out STD_LOGIC_VECTOR(18 downto 0) := (others => '0'); -- Address to read/write for SRAM
           SRAMWEN_O    : out STD_LOGIC := '1';                 -- Write enable for SRAM
           FIFORD_O     : out STD_LOGIC := '0';                 -- Read enable for FIFO
           GAMMA_O      : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- Current pixel's gamma value
           GAMMANEXT_O  : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')   -- Next pixel's gamma value
         );

    --attribute use_dsp48: string;
    --attribute use_dsp48 of data_controller: entity is "yes";
    
end data_controller;

architecture Behavioral of data_controller is

type state_type is (RECEIVE, START, WRITE, RUN);
signal state : state_type := RUN;

signal hpixel : integer range 0 to 1920 := 0;
signal vpixel : integer range 0 to 1080 := 0;

signal gamma_int      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal gamma_int_next : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

signal spi_receive : STD_LOGIC := '0';

signal rdata, gdata, bdata : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal addr: STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
signal gamma_out : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

signal rdatashift1, rdatashift6 : UNSIGNED(15 downto 0) := (others => '0');
signal gdatashift7, gdatashift0 : UNSIGNED(15 downto 0) := (others => '0');
signal bdatashift4, bdatashift3, bdatashift0 : UNSIGNED(15 downto 0) := (others => '0');

signal gamma_calc : UNSIGNED(15 downto 0) := (others => '0');

signal wen : STD_LOGIC := '1';
signal data_in : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal data_out : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin

    hpixel <= to_integer(unsigned(HPIXEL_I(11 downto 2)));
    vpixel <= to_integer(unsigned(VPIXEL_I(11 downto 2)));
    GAMMA_O <= gamma_int;
    GAMMANEXT_O <= gamma_int_next;
    
    -- RGB to gamma ITU-R BT.601 conversion, see https://sistenix.com/rgb2ycbcr.html
    rdatashift1 <= "0000000" & unsigned(rdata) & "0";
    rdatashift6 <= "00" & unsigned(rdata) & "000000";
    gdatashift7 <= "0" & unsigned(gdata) & "0000000";
    gdatashift0 <= "00000000" & unsigned(gdata);
    bdatashift4 <= "0000" & unsigned(bdata) & "0000";
    bdatashift3 <= "00000" & unsigned(bdata) & "000";
    bdatashift0 <= "00000000" & unsigned(bdata);
    
    gamma_calc <= 16 + shift_right(rdatashift6 + rdatashift1 + gdatashift7 + gdatashift0 + bdatashift4 + bdatashift3 + bdatashift0, 8);
    gamma_out <= std_logic_vector(gamma_calc(7 downto 0));
    
    -- SRAM tri-state buffer
    SRAMWEN_O <= wen;
    SRAMDATA_IO <= data_out when wen = '0' else (others => 'Z');
    data_in <= SRAMDATA_IO;
    
    -- Read next gamma data from SRAM, or write gamma data to SRAM
    process(hpixel)
    begin
        if BLANK_I = '0' and spi_receive = '0' then
            gamma_int <= gamma_int_next;
            gamma_int_next <= data_in;
            SRAMADDR_O <= std_logic_vector(to_unsigned(vpixel*480 + hpixel + 1, 19));
        elsif spi_receive = '1' then
            SRAMADDR_O <= addr;
            data_out <= gamma_out;
        end if;
    end process;
    
    -- Read from the SPI FIFO if any data has been received
    process(CLK_I)
    begin
        if CLK_I'event and CLK_I = '1' then
            case state is
                when RUN =>
                    if FIFOEMPTY_I = '0' then
                        FIFORD_O <= '1';
                        state <= START;
                    end if;
                
                when START =>
                    FIFORD_O <= '0';
                    if FIFODV_I = '1' then
                        if FIFODATA_I(63 downto 56) = "01000010" then
                            state <= RECEIVE;
                            spi_receive <= '1';
                        else
                            state <= RUN;
                        end if;
                    end if;
                
                when RECEIVE =>
                    wen <= '1';
                    if FIFOEMPTY_I = '0' then
                        FIFORD_O <= '1';
                        state <= WRITE;
                    end if;
                
                when WRITE =>
                    FIFORD_O <= '0';
                    if FIFODV_I = '1' then
                        if FIFODATA_I(63 downto 56) = "01000101" then
                            state <= RUN;
                            spi_receive <= '0';
                        else
                            addr <= FIFODATA_I(50 downto 32);
                            rdata <= FIFODATA_I(31 downto 24);
                            gdata <= FIFODATA_I(23 downto 16);
                            bdata <= FIFODATA_I(15 downto 8);
                            wen <= '0';
                            state <= RECEIVE;
                        end if;
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
