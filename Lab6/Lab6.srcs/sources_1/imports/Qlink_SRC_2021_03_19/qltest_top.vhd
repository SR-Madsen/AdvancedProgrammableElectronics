-------------------------------------------------------------------
-- QLTest       : Test/demo  of th UART <-> SoC-bus  link: QLink
-- Version      : XC7   ... intended for simplest possible use with Xilinx 7-series FPGA's
-- Revision     : 2021-03-17
-- 
-- (C) 2021  Anders Stengaard Sørensen (Author), Denmark
-- 
-- This VHDL source fil may be used, distributed and changed in any way, by anyone on the following conditions:
-- 1) The Author provide no guarantee and is not in any way liable for any issues that arise from the use of this source
-- 2) Projects, products etc. that make use of this source must credit/attribute the original work and Author
--
-- QLink stand for Quick-Link and is meant as a tool for students and researchers, to quickly and easily create a
-- link between a UART enabled computer/microcontroller/processor (CPU) and an FPGA, for study and research projects
-- Using a simple text oriented protocol carried by a UART, the CPU can generate read- and write-cycles on a data-bus
-- inside the FPGA.
--
-- History:  QLink is inspired by "Unity-Link" by Anders Lange, which is more comprehensible but is harder for students to use. 
--                https://ieeexplore.ieee.org/abstract/document/6696914
--           Unity-Link was inspired by "TOSNet" and "Micro TOSNet by Simon Falsig
--                https://opencores.org/projects/tosnet
--                https://opencores.org/projects/utosnet
--                https://ieeexplore.ieee.org/abstract/document/4957485
--                Falsig, Simon. "Interaction framework for loosely-coupled controllers." (Ph.D. Dissertation 2011).
--
-- Use:      QLinkMaster Version XC7 operate as a combined System Control module and System Communication module.
--           The user must use the clock and reset signals provided by QLinkMaster as system clock and system reset. QLinkMaster: 
--             . Generates a combined bitrate- and system-clock of 48MHz from a provided clock signal (external oscillator min 15.625MHz)
--             . Generates a system reset signal synchronized with the system clock. Reset is asserted while:
--                 The Xilinx Clock Managemant Module (MMCM) is locking on the the clock after power-up
--                 OR the reset input is asserted  
--           QLinkMaster operate at 3Mbps 8N1 with no handshake and no echoing.
--           When operating it accept the following commands issued through Tx:
--             #:wAADDDDDDDD   - Where AA is a 2-digit base 16 address, eg: 04 and DDDDDDDD is an 8-digit base 16 data word
--                               The FPGA create an internal write cycle but does not send anything in return on Rx
--             #:rAA.......... - Where AA is a 2-digit base 16 address and .......... are 10 arbitrary non "#" characters for padding
--                               The FPGA create an internal read-cycle and respond on Rx with: "!AA:DDDDDDDD
--                               Where AA is the read address and DDDDDDDD is an 8-digit base 16 representation of the data read
--             #:RAA.................... - With 20 arbitrary non "#" characters for padding
--                               The FPGA create an internal read-cycle and read the internal 32-bit clock cycle counter and
--                               respond with: !AA:DDDDDDDD;CCCCCCCC where CCCCCCCC is an 8-digit base 16 representation of the clock counter
--                               The padding in #r/#R commands ensure proper spacing between commands to allow the fpga to respond,
--                               The padding is not necessary if similar pauses between commands is ensured in another way.
--                               Characters not in the set: "#:rRwW0123456789abcdefABCDEF" are treated as spacing 
--
----------------------
-- Demo:    In this demo application, QLINK is instantiated and connected to a very simple state machine (SM)
--          The SM maintain an 8 bit register, routed to 8 outputs (LEDS) allowing the user to monitor the register state
--
--          Upon RESET, the LED register is set to "01010101"
--
--          In read cycles, the SM return a 32-bit value of: Prefix: X"FF0aa0" combined with the 8-bit address of the read cycle
--          allowing the PC host to verify that the address was received properly by QLINK
--          Also, the LED register will be set to the value of the address for manual verification
--
--          In write cycles, the SM will copy the 8 MSB of the received 32 bits data to the LED register 
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- USE ieee.numeric_std.ALL; 

Library UNISIM;                    -- For Xilinx primitives
use UNISIM.vcomponents.all;        --   allow all "components"

entity qltest_top is
    Port ( CLK_I     : in STD_LOGIC;
           TX_O        : out STD_LOGIC;
           RX_I        : in STD_LOGIC;
           LEDS_O      : out STD_LOGIC_VECTOR(7 downto 0);
           STATUSLED_O : out STD_LOGIC );
end qltest_top;

architecture rtl of qltest_top is


-- Define linkmaster component
component QLinkMaster is
  Generic ( CLK_I_PERIOD : real range 2.0 to 64.0);
  Port    ( RESET_I  : in STD_LOGIC;
            CLK_I  : in STD_LOGIC;
            RX_I     : in STD_LOGIC;
            TX_O     : out STD_LOGIC;
            --------------
            CLK48_O  : out STD_LOGIC;
            ADDR_B_O : out STD_LOGIC_VECTOR(7 downto 0);
            DATA_B_O : out STD_LOGIC_VECTOR(31 downto 0);
            DATA_B_I : in  STD_LOGIC_VECTOR(31 downto 0);
            WR_O     : out STD_LOGIC;
            RD_O     : out STD_LOGIC;
            RESET_O  : out STD_LOGIC;
            LED_O    : out STD_LOGIC );
end component;

-- Define memory component
component memory is
    Port ( CLK_I : in STD_LOGIC;
           ADDR_I : in STD_LOGIC_VECTOR (7 downto 0);
           WDATA_I : in STD_LOGIC_VECTOR (31 downto 0);
           RDATA_O : out STD_LOGIC_VECTOR (31 downto 0);
           WR_I : in STD_LOGIC;
           RD_I : in STD_LOGIC);
end component;

---------------------- SIGNALS -------------------------
  signal sys_reset : std_logic;
  signal clk48     : std_logic;
  signal adr       : std_logic_vector(7 downto 0);
  signal data_w    : std_logic_vector(31 downto 0);
  signal data_r    : std_logic_vector(31 downto 0);
  signal wr,rd     : std_logic;
  
  signal leds : std_logic_vector(7 downto 0);
begin

LEDS_O<=leds;


QLINK1: QLinkMaster
  generic map ( CLK_I_PERIOD => 83.33) -- Instantiate the QLinkMaster for 12MHz input clock   
  port map (
         RESET_I => '0',
         RESET_O => sys_reset,
         CLK_I =>CLK_I,
         RX_I    => RX_I,
         TX_O => TX_O,
         CLK48_O => clk48,
         ADDR_B_O => adr,
         DATA_B_O => data_w,
         DATA_B_I => data_r, 
         WR_O     => wr, 
         RD_O     => rd,
         LED_O    => STATUSLED_O);

DPRAM: memory
    port map ( CLK_I => CLK_I,
               ADDR_I => adr,
               WDATA_I => data_w,
               RDATA_O => data_r,
               WR_I => wr,
               RD_I => rd);

process(clk48)
begin
  if clk48'event and clk48='1' then
    if sys_reset='1' then
      leds<="01010101";
      --data_r<= X"aa55aa55";  
    else
      --data_r<= X"FF0aa0" & adr;  
      if wr='1' then
        leds<=data_w(31 downto 24);
      elsif rd='1' then  
        leds<=adr;
      else
        leds<=leds;
      end if;
    end if; -- sys_reset
  end if; -- clk100'event
end process;

end rtl;
