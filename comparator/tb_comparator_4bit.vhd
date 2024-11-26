LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY tb_comparator_4bit IS
END tb_comparator_4bit;

ARCHITECTURE behavior OF tb_comparator_4bit IS 
    -- Component Declaration for the 4-bit comparator
    COMPONENT comparator_4bit
    PORT(
        A : IN std_logic_vector(3 downto 0);
        B : IN std_logic_vector(3 downto 0);
        A_less_B : OUT std_logic;
        A_equal_B : OUT std_logic;
        A_greater_B : OUT std_logic
    );
    END COMPONENT;
    
    -- Inputs
    signal A : std_logic_vector(3 downto 0) := (others => '0');
    signal B : std_logic_vector(3 downto 0) := (others => '0');
    
    -- Outputs
    signal A_less_B : std_logic;
    signal A_equal_B : std_logic;
    signal A_greater_B : std_logic;

BEGIN
    -- Instantiate the 4-bit comparator
    uut: comparator_4bit PORT MAP (
        A => A,
        B => B,
        A_less_B => A_less_B,
        A_equal_B => A_equal_B,
        A_greater_B => A_greater_B
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case for A < B
        report "Test Case 1: A < B";
        A <= "0101";  -- 5
        B <= "1010";  -- 10
        wait for 20 ns;

        -- Test case for A > B
        report "Test Case 2: A > B";
        A <= "1010";  -- 10
        B <= "0101";  -- 5
        wait for 20 ns;

        -- Test case for A = B
        report "Test Case 3: A = B";
        A <= "0111";  -- 7
        B <= "0111";  -- 7
        wait for 20 ns;

        -- Additional edge cases
        report "Test Case 4: Minimum vs Maximum";
        A <= "0000";  -- 0
        B <= "1111";  -- 15
        wait for 20 ns;

        report "Test Case 5: Maximum vs Minimum";
        A <= "1111";  -- 15
        B <= "0000";  -- 0
        wait for 20 ns;

        wait;
    end process;
END;