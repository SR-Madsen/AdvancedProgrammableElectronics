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
-- Description: Filter used for smoothing of images
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity smoothening is
    Port ( CLK_I        : in STD_LOGIC;
           GAMMA_I      : in STD_LOGIC_VECTOR(7 downto 0);
           GAMMANEXT_I  : in STD_LOGIC_VECTOR(7 downto 0);
           RED_O        : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
           GREEN_O      : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
           BLUE_O       : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
         );
         
    --attribute use_dsp48: string;
    --attribute use_dsp48 of smoothening: entity is "yes";
    
end smoothening;

architecture Behavioral of smoothening is

signal curr_gamma : UNSIGNED(7 downto 0) := (others => '0');
signal next_gamma : UNSIGNED(7 downto 0) := (others => '0');

type smooth_array is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
shared variable gamma_smooth: smooth_array := (others => (others => '0'));

type state_type is (CALC, SHIFT);
signal state: state_type := CALC;

begin

    curr_gamma <= unsigned(GAMMA_I);
    next_gamma <= unsigned(GAMMANEXT_I);

    -- Math to iterate from number x to number y with three steps (i.e., from 200 to 300 with steps 225, 250, 275).
    -- Delta = (y - x)/4*i for i = 1:3
    -- Step = x + Delta
    process(CLK_I)
    variable delta : integer := 0;
    variable counter : integer := 0;
    begin
        if CLK_I'event and CLK_I = '1' then
            case state is
                when CALC =>
                    delta := (to_integer(next_gamma) - to_integer(curr_gamma))/4;
                    gamma_smooth(0) := std_logic_vector(curr_gamma);
                    gamma_smooth(1) := std_logic_vector(curr_gamma + Delta);
                    gamma_smooth(2) := std_logic_vector(curr_gamma + Delta*2);
                    gamma_smooth(3) := std_logic_vector(curr_gamma + Delta*3);
                    RED_O <= gamma_smooth(0);
                    GREEN_O <= gamma_smooth(0);
                    BLUE_O <= gamma_smooth(0);
                    state <= SHIFT;
                
                when SHIFT =>
                    gamma_smooth := gamma_smooth(1 to 3) & gamma_smooth(0);
                    RED_O <= gamma_smooth(0);
                    GREEN_O <= gamma_smooth(0);
                    BLUE_O <= gamma_smooth(0);
                    if counter >= 2 then
                        state <= CALC;
                        counter := 0;
                    else
                        counter := counter + 1;
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
