library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_cnt is
    Port ( RESET_I : in STD_LOGIC;
           CLK_I : in STD_LOGIC;
           Q_O : out STD_LOGIC_VECTOR (7 downto 0));
end ripple_cnt;

architecture Behavioral of ripple_cnt is
    signal q : std_logic_vector (7 downto 0);
    signal nclk : std_logic;

begin
    Q_O <= q;
    nclk <= not CLK_I;
    
    process (nclk, RESET_I)
    begin
        if RESET_I = '1' then
            q(0) <= '0';
        elsif nclk'event and nclk = '0' then
            q(0) <= not q(0);
        end if;
    end process;
    
    process (q(0),RESET_I) -- Second stage
    begin -- process
        if RESET_I='1' then
            q(1)<='0';
        elsif q(0)'event and q(0)='0' then
            q(1)<= not q(1);
        end if;
    end process;
    
    
    process (q(1),RESET_I) -- Third stage
    begin -- process
        if RESET_I='1' then
            q(2)<='0';
        elsif q(1)'event and q(1)='0' then
            q(2)<= not q(2);
        end if;
    end process;


    process (q(2),RESET_I) -- Fourth stage
    begin -- process
        if RESET_I='1' then
            q(3)<='0';
        elsif q(2)'event and q(2)='0' then
            q(3)<= not q(3);
        end if;
    end process;
    
    
    process (q(3),RESET_I) -- Fifth stage
    begin -- process
        if RESET_I='1' then
            q(4)<='0';
        elsif q(3)'event and q(3)='0' then
            q(4)<= not q(4);
        end if;
    end process;
    
    
    process (q(4),RESET_I) -- Sixth stage
    begin -- process
        if RESET_I='1' then
            q(5)<='0';
        elsif q(4)'event and q(4)='0' then
            q(5)<= not q(5);
        end if;
    end process;
    
    
    process (q(5),RESET_I) -- Seventh stage
    begin -- process
        if RESET_I='1' then
            q(6)<='0';
        elsif q(5)'event and q(5)='0' then
            q(6)<= not q(6);
        end if;
    end process;
    
    
    process (q(6),RESET_I) -- Eightht stage
    begin -- process
        if RESET_I='1' then
            q(7)<='0';
        elsif q(6)'event and q(6)='0' then
            q(7)<= not q(7);
        end if;
    end process;
    
end Behavioral;
