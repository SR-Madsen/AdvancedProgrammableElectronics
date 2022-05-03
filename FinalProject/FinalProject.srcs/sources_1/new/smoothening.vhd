----------------------------------------------------------------------------------
-- Company: SDU
-- Engineer: Sebastian
-- 
-- Create Date: 05/03/2022 09:50:36 AM
-- Design Name: 
-- Module Name: smoothening - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Filter used for smoothening of images
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity smoothening is
    Port ( CLK_I        : in STD_LOGIC;
           GAMMA_I      : in STD_LOGIC_VECTOR(7 downto 0);
           GAMMANEXT_I  : in STD_LOGIC_VECTOR(7 downto 0);
           RED_O        : out STD_LOGIC_VECTOR(7 downto 0);
           GREEN_O      : out STD_LOGIC_VECTOR(7 downto 0);
           BLUE_O       : out STD_LOGIC_VECTOR(7 downto 0)
         );
         
    attribute use_dsp48: string;
    attribute use_dsp48 of smoothening: entity is "yes";
    
end smoothening;

architecture Behavioral of smoothening is

signal curr_integer : UNSIGNED(7 downto 0);
signal next_integer : UNSIGNED(7 downto 0);

type smooth_array is array (0 to 3) of unsigned(7 downto 0);
signal gamma_smooth: smooth_array;

begin

    curr_integer <= unsigned(GAMMA_I);
    next_integer <= unsigned(GAMMANEXT_I);

    process(GAMMANEXT_I)
    begin
        gamma_smooth(0) <= curr_integer;
        gamma_smooth(1) <= (curr_integer + next_integer)/4;
        gamma_smooth(2) <= (curr_integer + next_integer)/4*2;
        gamma_smooth(3) <= (curr_integer + next_integer)/4*3;
    end process;
    
    -- TODO: FIX!! Det her virker ikke nødvendigvis med porches. Prøv at forbindes PIXEL_V i stedet, eller få mere data fra controller
    process(CLK_I)
    begin
        if CLK_I'event and CLK_I = '1' then
            gamma_smooth <= "0" & gamma_smooth(3 downto 1);
        end if;
    end process;
    
    RED_O <= STD_LOGIC_VECTOR(gamma_smooth(0));
    GREEN_O <= STD_LOGIC_VECTOR(gamma_smooth(0));
    BLUE_O <= STD_LOGIC_VECTOR(gamma_smooth(0));

end Behavioral;
