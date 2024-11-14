library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_signed_multiplier is
end entity tb_signed_multiplier;

architecture tb of tb_signed_multiplier is
    component signed_multiplier
        port (
            a, b : in signed(7 downto 0);
            result : out signed(15 downto 0)
        );
    end component;

    signal a, b : signed(7 downto 0);
    signal result : signed(15 downto 0);
begin
    dut : signed_multiplier
        port map (
            a => a,
            b => b,
            result => result
        );

    process
    begin
        -- Positive numbers
        a <= "00001010"; -- 10
        b <= "00000110"; -- 6
        wait for 10 ns;
        assert result = "0000000000111100" report "Test failed for 10 * 6, expected 600 got " & integer'image(to_integer(result)) severity error;

        -- Negative numbers
        a <= "11110110"; -- -10
        b <= "11111010"; -- -6
        wait for 10 ns;
        assert result = "0000000000111100" report "Test failed for -10 * -6, expected 60 got " & integer'image(to_integer(result)) severity error;

        -- Mixed signs
        a <= "00001010"; -- 10
        b <= "11111010"; -- -6
        wait for 10 ns;
        assert result = "1111111111000100" report "Test failed for 10 * -6, expected -60 got " & integer'image(to_integer(result)) severity error;

        wait;
    end process;
end architecture tb;