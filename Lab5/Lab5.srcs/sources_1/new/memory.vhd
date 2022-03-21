library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library XPM;
use XPM.Vcomponents.ALL;

library UNISIM;
use UNISIM.VComponents.ALL;

entity memory is
    Port (CLK_I:  in STD_LOGIC;
          ADDR_I: in STD_LOGIC_VECTOR(5 downto 0);
          DOUT_O: out STD_LOGIC_VECTOR(7 downto 0));
end memory;

architecture Behavioral of memory is
signal dbiterra: STD_LOGIC;
signal sbiterra: STD_LOGIC;

begin

-- xpm_memory_sprom: Single Port ROM
-- Xilinx Parameterized Macro, version 2020.1
xpm_memory_sprom_inst : xpm_memory_sprom
generic map (
    ADDR_WIDTH_A => 6,
    AUTO_SLEEP_TIME => 0,
    CASCADE_HEIGHT => 0,
    ECC_MODE => "no_ecc",
    MEMORY_INIT_FILE => "string_file.mem",
    MEMORY_INIT_PARAM => "",
    MEMORY_OPTIMIZATION => "true",
    MEMORY_PRIMITIVE => "auto",
    MEMORY_SIZE => 512,
    MESSAGE_CONTROL => 0,
    READ_DATA_WIDTH_A => 8,
    READ_LATENCY_A => 2,
    READ_RESET_VALUE_A => "0",
    RST_MODE_A => "SYNC",
    SIM_ASSERT_CHK => 0,
    USE_MEM_INIT => 1,
    WAKEUP_TIME => "disable_sleep"
)
port map (
    dbiterra => dbiterra,               -- 1-bit output: Leave open.
    douta => DOUT_O,                     -- READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
    sbiterra => sbiterra,               -- 1-bit output: Leave open.
    addra => ADDR_I,                     -- ADDR_WIDTH_A-bit input: Address for port A read operations.
    clka => CLK_I,                       -- 1-bit input: Clock signal for port A.
    ena => '1',                         -- 1-bit input: Memory enable signal for port A. Must be high on clock
                                        -- cycles when read operations are initiated. Pipelined internally.
    injectdbiterra => '0',   -- 1-bit input: Do not change from the provided value.
    injectsbiterra => '0',   -- 1-bit input: Do not change from the provided value.
    regcea => '1',                   -- 1-bit input: Do not change from the provided value.
    rsta => '0',                       -- 1-bit input: Reset signal for the final port A output register
                                        -- stage. Synchronously resets output port douta to the value specified
                                        -- by parameter READ_RESET_VALUE_A.
    sleep => '0'                      -- 1-bit input: sleep signal to enable the dynamic power saving feature.
);


end Behavioral;
