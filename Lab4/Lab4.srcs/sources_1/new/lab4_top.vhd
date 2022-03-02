library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab4_top is
    Port (CLK_I     : in STD_LOGIC;
          UART_RX_I : in STD_LOGIC;
          UART_TX_O : out STD_LOGIC;
          LED_O     : out STD_LOGIC_VECTOR(6 downto 0));
end lab4_top;

architecture Behavioral of lab4_top is

signal clk12 : std_logic; -- Input clock signal
signal clk16 : std_logic; -- 16 MHz UART clock

-----------------
Component MMCM    -- Declare module defined in mmcm.vhd
    Generic   ( CLK_IN_PERIOD : real := 83.33);
    Port      ( RESET_I       : std_logic;
                CLK_I         : in STD_LOGIC;
                CLK16_O       : out STD_LOGIC);
end Component;
------------------

signal TX_READY : STD_LOGIC;
signal TX_DONE  : STD_LOGIC;
signal TX_DATA  : STD_LOGIC_VECTOR(7 downto 0);

-----------------
Component UART_TX   -- Declare module defined in uart_tx.vhd
    Port ( CLK     : in STD_LOGIC;
           READY   : in STD_LOGIC;
           DATA    : in STD_LOGIC_VECTOR (7 downto 0);
           RESET   : in STD_LOGIC;
           DONE    : out STD_LOGIC;
           TX      : out STD_LOGIC);
end Component;
------------------

signal RX_READY : STD_LOGIC;
signal RX_DATA  : STD_LOGIC_VECTOR(7 downto 0);

------------------
Component UART_RX   -- Declare module defined in uart_rx.vhd
    Port ( CLK     : in STD_LOGIC;
           RX      : in STD_LOGIC;
           RESET   : in STD_LOGIC;
           READY   : out STD_LOGIC;
           DATA    : out STD_LOGIC_VECTOR (7 downto 0));
end Component;
------------------

------------------
Component UART_MASTER   -- Declare module defined in uart_master.vhd
    Port ( CLK      : in STD_LOGIC;
           RESET    : in STD_LOGIC;
           RX_READY : in STD_LOGIC;
           TX_DONE  : in STD_LOGIC;
           DATA_IN  : in STD_LOGIC_VECTOR (7 downto 0);
           TX_READY : out STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           LEDS     : out STD_LOGIC_VECTOR (6 downto 0));
end Component;
------------------

begin

clk12 <= CLK_I;

clock: MMCM -- Instantiate a copy of MMCM for adjusting input clock
    Generic map ( CLK_IN_PERIOD=>83.33)
    Port map    ( RESET_I => '0',
                  CLK_I => clk12,
                  CLK16_O => clk16);

tx_slave: UART_TX
    Port map ( CLK => clk16,
               READY => TX_READY,
               DATA => TX_DATA,
               RESET => '0',
               DONE => TX_DONE,
               TX => UART_TX_O);

rx_slave: UART_RX
    Port map ( CLK => clk16,
               RX => UART_RX_I,
               RESET => '0',
               READY => RX_READY,
               DATA => RX_DATA);
               
comm_master: UART_MASTER
    Port map ( CLK => clk16,
               RESET => '0',
               RX_READY => RX_READY,
               TX_DONE => TX_DONE,
               DATA_IN => RX_DATA,
               TX_READY => TX_READY,
               DATA_OUT => TX_DATA,
               LEDS => LED_O);

end Behavioral;
