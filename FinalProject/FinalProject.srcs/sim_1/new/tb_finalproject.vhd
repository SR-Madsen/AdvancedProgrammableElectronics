----------------------------------------------------------------------------------
-- Company: SDU
-- Engineer: Sebastian
-- 
-- Create Date: 05/16/2022 02:17:24 PM
-- Design Name: 
-- Module Name: tb_finalproject - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for final project
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity top_tb is
end;

architecture bench of top_tb is

  component top
      Port ( 
          CLK24MHZ : in STD_LOGIC;
          led : out STD_LOGIC_VECTOR (5 downto 0);
          hdmi_out_p : out STD_LOGIC_VECTOR(3 downto 0);
          hdmi_out_n : out STD_LOGIC_VECTOR(3 downto 0);
          spi_clk : in STD_LOGIC;
          spi_mosi : in STD_LOGIC;
          spi_miso : out STD_LOGIC;
          spi_ss : in STD_LOGIC;
          memaddr : out STD_LOGIC_VECTOR(18 downto 0);
          memdata : inout STD_LOGIC_VECTOR(7 downto 0);
          memoen : out STD_LOGIC := '0';
          memwen : out STD_LOGIC := '0';
          memcen : out STD_LOGIC := '0';
          short_gnd0, short_gnd1, short_gnd2 : out STD_LOGIC := '0'
      );
  end component;

  signal CLK24MHZ: STD_LOGIC;
  signal led: STD_LOGIC_VECTOR (5 downto 0);
  signal hdmi_out_p: STD_LOGIC_VECTOR(3 downto 0);
  signal hdmi_out_n: STD_LOGIC_VECTOR(3 downto 0);
  signal spi_clk: STD_LOGIC;
  signal spi_mosi: STD_LOGIC;
  signal spi_miso: STD_LOGIC;
  signal spi_ss: STD_LOGIC;
  signal memaddr: STD_LOGIC_VECTOR(18 downto 0);
  signal memdata: STD_LOGIC_VECTOR(7 downto 0);
  signal memoen: STD_LOGIC := '0';
  signal memwen: STD_LOGIC := '0';
  signal memcen: STD_LOGIC := '0';
  signal short_gnd0, short_gnd1, short_gnd2: STD_LOGIC := '0' ;

  constant clock_period: time := 41.66 ns;
  signal stop_the_clock: boolean;

begin

  uut: top port map ( CLK24MHZ   => CLK24MHZ,
                      led        => led,
                      hdmi_out_p => hdmi_out_p,
                      hdmi_out_n => hdmi_out_n,
                      spi_clk    => spi_clk,
                      spi_mosi   => spi_mosi,
                      spi_miso   => spi_miso,
                      spi_ss     => spi_ss,
                      memaddr    => memaddr,
                      memdata    => memdata,
                      memoen     => memoen,
                      memwen     => memwen,
                      memcen     => memcen,
                      short_gnd0 => short_gnd0,
                      short_gnd1 => short_gnd1,
                      short_gnd2 => short_gnd2 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    spi_clk <= '0';
    spi_mosi <= '0';
    spi_ss <= '1';

    -- Put test bench stimulus code here
    spi_ss <= '0';
    spi_mosi <= '1';
    if rising_edge(CLK24MHz) then
        spi_clk <= not spi_clk;
    end if;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK24MHZ <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;