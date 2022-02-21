library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_top is
    Port ( CLK_I : in STD_LOGIC;
           RESET_I : in STD_LOGIC;
           Q_BIN_O : out STD_LOGIC_VECTOR (7 downto 0);
           Q_HOT_O : out STD_LOGIC_VECTOR (15 downto 0);
           Q_RIP_O : out STD_LOGIC_VECTOR (7 downto 0));
end counter_top;

architecture Behavioral of counter_top is

component binary_cnt
Port (RESET_I : in STD_LOGIC;
      CLK_I : in STD_LOGIC;
      Q_O : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component ripple_cnt
Port (RESET_I : in STD_LOGIC;
      CLK_I : in STD_LOGIC;
      Q_O : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component onehot_cnt
Port (RESET_I : in STD_LOGIC;
      CLK_I : in STD_LOGIC;
      Q_O : out STD_LOGIC_VECTOR (15 downto 0));
end component;

begin
U1: binary_cnt port map (
    RESET_I => RESET_I,
    CLK_I => CLK_I,
    Q_O => Q_BIN_O);
    

U2: ripple_cnt port map (
    RESET_I => RESET_I,
    CLK_I => CLK_I,
    Q_O => Q_RIP_O);
    

U3: onehot_cnt port map (
    RESET_I => RESET_I,
    CLK_I => CLK_I,
    Q_O => Q_HOT_O);

end Behavioral;
