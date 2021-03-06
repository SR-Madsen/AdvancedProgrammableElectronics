library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity serializer is
  Port ( CLK_PIXEL_I    : in STD_LOGIC;
         CLK_5XPIXEL_I  : in STD_LOGIC;
         PDATA_I        : in STD_LOGIC_VECTOR(9 downto 0);
         SDATA_O        : out STD_LOGIC
        );
end serializer;

architecture Behavioral of serializer is

signal bit1_shift: STD_LOGIC;
signal bit2_shift: STD_LOGIC;
signal reset:      STD_LOGIC := '1';

begin
    
    -- Initial reset of internal SERDES registers
    process(CLK_PIXEL_I)
    begin
        if CLK_PIXEL_I'event and CLK_PIXEL_I = '1' then
            reset <= '0';
        end if;
    end process;
    
    -- OSERDESE2: Output SERial/DESerializer with bitslip
    -- 7 Series
    -- Xilinx HDL Language Template, version 2018.3
    OSERDESE2_master : OSERDESE2
    generic map (
        DATA_RATE_OQ => "DDR",      -- DDR, SDR
        DATA_RATE_TQ => "SDR",      -- DDR, BUF, SDR
        DATA_WIDTH => 10,           -- Parallel data width (2-8,10,14)
        INIT_OQ => '0',             -- Initial value of OQ output (1'b0,1'b1)
        INIT_TQ => '0',             -- Initial value of TQ output (1'b0,1'b1)
        SERDES_MODE => "MASTER",    -- MASTER, SLAVE
        SRVAL_OQ => '0',            -- OQ output value when SR is used (1'b0,1'b1)
        SRVAL_TQ => '0',            -- TQ output value when SR is used (1'b0,1'b1)
        TBYTE_CTL => "FALSE",       -- Enable tristate byte operation (FALSE, TRUE)
        TBYTE_SRC => "FALSE",       -- Tristate byte source (FALSE, TRUE)
        TRISTATE_WIDTH => 1         -- 3-state converter width (1,4)
    )
    port map (
        CLK => CLK_5XPIXEL_I,   -- 1-bit input: High speed clock
        CLKDIV => CLK_PIXEL_I,  -- 1-bit input: Divided clock
        
        OFB => open,            -- 1-bit output: Feedback path for data
        OQ => SDATA_O,          -- 1-bit output: Data path output
        
        -- D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
        D1 => PDATA_I(0),
        D2 => PDATA_I(1),
        D3 => PDATA_I(2),
        D4 => PDATA_I(3),
        D5 => PDATA_I(4),
        D6 => PDATA_I(5),
        D7 => PDATA_I(6),
        D8 => PDATA_I(7),
        
        OCE => '1',             -- 1-bit input: Output data clock enable
        RST => reset,         -- 1-bit input: Reset
        
        -- SHIFTIN1 / SHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
        SHIFTIN1 => bit1_shift,
        SHIFTIN2 => bit2_shift,
        
        -- SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
        SHIFTOUT1 => open,
        SHIFTOUT2 => open,
        
        -- T1 - T4: 1-bit (each) input: Parallel 3-state inputs
        T1 => '0',
        T2 => '0',
        T3 => '0',
        T4 => '0',
        
        TBYTEIN => '0',         -- 1-bit input: Byte group tristate
        TCE => '1',             -- 1-bit input: 3-state clock enable
        TBYTEOUT => open,       -- 1-bit output: Byte group tristate
        TFB => open,            -- 1-bit output: 3-state control
        TQ => open              -- 1-bit output: 3-state control
    );
    
    
    OSERDESE2_slave : OSERDESE2
    generic map (
        DATA_RATE_OQ => "DDR",      -- DDR, SDR
        DATA_RATE_TQ => "SDR",      -- DDR, BUF, SDR
        DATA_WIDTH => 10,           -- Parallel data width (2-8,10,14)
        INIT_OQ => '0',             -- Initial value of OQ output (1'b0,1'b1)
        INIT_TQ => '0',             -- Initial value of TQ output (1'b0,1'b1)
        SERDES_MODE => "SLAVE",     -- MASTER, SLAVE
        SRVAL_OQ => '0',            -- OQ output value when SR is used (1'b0,1'b1)
        SRVAL_TQ => '0',            -- TQ output value when SR is used (1'b0,1'b1)
        TBYTE_CTL => "FALSE",       -- Enable tristate byte operation (FALSE, TRUE)
        TBYTE_SRC => "FALSE",       -- Tristate byte source (FALSE, TRUE)
        TRISTATE_WIDTH => 1         -- 3-state converter width (1,4)
    )
    port map (
        CLK => CLK_5XPIXEL_I,   -- 1-bit input: High speed clock
        CLKDIV => CLK_PIXEL_I,  -- 1-bit input: Divided clock
        
        OFB => open,            -- 1-bit output: Feedback path for data
        OQ => open,             -- 1-bit output: Data path output
        
        -- D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
        D1 => '0',
        D2 => '0',
        D3 => PDATA_I(8),
        D4 => PDATA_I(9),
        D5 => '0',
        D6 => '0',
        D7 => '0',
        D8 => '0',
        
        OCE => '1',             -- 1-bit input: Output data clock enable
        RST => reset,         -- 1-bit input: Reset
        
        -- SHIFTIN1 / SHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
        SHIFTIN1 => '0',
        SHIFTIN2 => '0',
        
        -- SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
        SHIFTOUT1 => bit1_shift,
        SHIFTOUT2 => bit2_shift,
        
        -- T1 - T4: 1-bit (each) input: Parallel 3-state inputs
        T1 => '0',
        T2 => '0',
        T3 => '0',
        T4 => '0',
        
        TBYTEIN => '0',         -- 1-bit input: Byte group tristate
        TCE => '1',             -- 1-bit input: 3-state clock enable
        TBYTEOUT => open,       -- 1-bit output: Byte group tristate
        TFB => open,            -- 1-bit output: 3-state control
        TQ => open              -- 1-bit output: 3-state control
    );
    
end Behavioral;
