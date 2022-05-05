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
    Port ( CLK_I        : in STD_LOGIC;                         -- SRAM clock
           HPIXEL_I     : in STD_LOGIC_VECTOR(11 downto 0);     -- Horizontal pixel value
           VPIXEL_I     : in STD_LOGIC_VECTOR(11 downto 0);     -- Vertical pixel value
           BLANK_I      : in STD_LOGIC;                         -- Indicates blank part of the screen
           FIFODATA_I   : in STD_LOGIC_VECTOR(63 downto 0);     -- Data from FIFO
           FIFODV_I     : in STD_LOGIC;                         -- Data valid signal from FIFO
           FIFOEMPTY_I  : in STD_LOGIC;                         -- FIFO empty signal
           SRAMDATA_IO  : inout STD_LOGIC_VECTOR(7 downto 0);   -- Data to and from SRAM
           SRAMADDR_O   : out STD_LOGIC_VECTOR(18 downto 0) := (others => '0'); -- Address to read/write for SRAM
           SRAMWEN_O    : out STD_LOGIC := '0';                 -- Write enable for SRAM
           FIFORD_O     : out STD_LOGIC := '0';                 -- Read enable for FIFO
           GAMMA_O      : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- Current pixel's gamma value
           GAMMANEXT_O  : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')   -- Next pixel's gamma value
         );
         
    attribute use_dsp48: string;
    attribute use_dsp48 of data_controller: entity is "yes";
    
end data_controller;

architecture Behavioral of data_controller is

signal hpixel : integer range 0 to 1920 := 0;
signal vpixel : integer range 0 to 1080 := 0;

begin


    -- Assign address to be read dependent on current pixel
    hpixel <= to_integer(unsigned(HPIXEL_I));
    vpixel <= to_integer(unsigned(VPIXEL_I));

    process(hpixel, vpixel)
    begin
        if BLANK_I = '1' then
            SRAMADDR_O <= (others => '0');
        else
            SRAMADDR_O <= std_logic_vector(to_unsigned(vpixel*480 + hpixel, 19));
        end if;
    end process;


end Behavioral;
