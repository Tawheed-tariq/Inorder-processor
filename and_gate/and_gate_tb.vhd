library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for testbench (no ports needed)
entity and_gate_tb is
end and_gate_tb;

-- Architecture for testbench
architecture Behavioral of and_gate_tb is

    -- Signal declarations for testbench
    signal a : STD_LOGIC := '0';
    signal b : STD_LOGIC := '0';
    signal y : STD_LOGIC;

    -- Instantiate the AND gate
    component and_gate
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

begin
    -- Instantiate the and_gate
    uut: and_gate Port map (a => a, b => b, y => y);

    -- Test process
    process
    begin
        -- Test case 1: a = 0, b = 0
        a <= '0';
        b <= '0';
        wait for 1 fs;
        -- Test case 2: a = 0, b = 1
        a <= '0';
        b <= '1';
        wait for 1 fs;

        -- Test case 3: a = 1, b = 0
        a <= '1';
        b <= '0';
        wait for 1 fs;

        -- Test case 4: a = 1, b = 1
        a <= '1';
        b <= '1';
        wait for 1 fs;

        -- End simulation
        wait;
    end process;
end Behavioral;
