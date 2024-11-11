library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_tb is
end entity multiplier_tb;

architecture tb of multiplier_tb is
    -- Component declaration
    component multiplier is
        port (
            a, b : in signed(7 downto 0);
            result : out signed(15 downto 0)
        );
    end component;

    -- Signals for stimulus and response
    signal a_tb, b_tb : signed(7 downto 0);
    signal result_tb : signed(15 downto 0);

begin
    -- Instantiate the multiplier component
    uut : multiplier
        port map (
            a => a_tb,
            b => b_tb,
            result => result_tb
        );

    -- Testbench process
    process
    begin
        -- Test positive numbers
        a_tb <= "00001010"; -- 10
        b_tb <= "00001100"; -- 12
        wait for 10 ns;
        assert result_tb = "0000110100" -- 120
            report "Test case 1 failed" severity error;

        -- Test negative numbers
        a_tb <= "11110110"; -- -10
        b_tb <= "11110100"; -- -12
        wait for 10 ns;
        assert result_tb = "0000110100" -- 120
            report "Test case 2 failed" severity error;

        -- Test zero
        a_tb <= "00000000"; -- 0
        b_tb <= "00000000"; -- 0
        wait for 10 ns;
        assert result_tb = "0000000000" -- 0
            report "Test case 3 failed" severity error;

        -- Test max positive
        a_tb <= "01111111"; -- 127
        b_tb <= "01111111"; -- 127
        wait for 10 ns;
        assert result_tb = "0111111101" -- 16129
            report "Test case 4 failed" severity error;

        -- Test max negative
        a_tb <= "10000000"; -- -128
        b_tb <= "10000000"; -- -128
        wait for 10 ns;
        assert result_tb = "0100000000" -- 16384
            report "Test case 5 failed" severity error;

        report "All test cases passed" severity note;
        wait;
    end process;
end architecture tb;