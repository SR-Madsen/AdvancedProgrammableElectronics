library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.vcomponents.all;

entity diff_o is
    Port ( INPUT : in STD_LOGIC;
           OUTP : out STD_LOGIC;
           OUTN : out STD_LOGIC);
end diff_o;

architecture Behavioral of diff_o is

begin
-- OBUFDS: Differential Output Buffer
-- 7 Series
-- Xilinx HDL Language Template, version 2018.2
OBUFDS_inst : OBUFDS
generic map ( IOSTANDARD => "DEFAULT",  -- Specify the output I/O standard
              SLEW => "SLOW")           -- Specify the output slew rate
port map ( O => OUTP,                   -- Diff_p output (connect directly to top-level port)
           OB => OUTN,                  -- Diff_n output (connect directly to top-level port)
           I => INPUT);                 -- Buffer input

end Behavioral;
