library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Top_tb is
end Top_tb;

architecture Behavioral of Top_tb is
    component Top
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC
        );
    end component;
    
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    
    constant CLK_PERIOD : time := 10 ns;
    
begin
    UUT: Top port map (
        clk => clk,
        reset => reset
    );
    
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;
    
    stim_proc: process
    begin
        reset <= '1';
        wait for CLK_PERIOD*4;
        
        reset <= '0';
        wait for CLK_PERIOD*20;  -- Wait for 200 ns
        
        reset <= '1';
        wait for CLK_PERIOD*2;
        reset <= '0';
        
        wait for CLK_PERIOD*20;
        
        wait;
    end process;
end Behavioral;