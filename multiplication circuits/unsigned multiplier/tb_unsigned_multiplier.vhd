library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_unsigned_multiplier is
end entity tb_unsigned_multiplier;

architecture tb of tb_unsigned_multiplier is
    component unsigned_multiplier
        port (
            a, b : in unsigned(7 downto 0);
            result : out unsigned(15 downto 0)
        );
    end component;

    signal a, b : unsigned(7 downto 0);
    signal result : unsigned(15 downto 0);
begin
    DUT : unsigned_multiplier
        port map (
            a => a,
            b => b,
            result => result
        );

    process
    begin
        a <= "00001010"; -- 10
        b <= "00000011"; -- 3
        wait for 10 ns;
        assert result = "0000000000011110" -- 30
            report "Test failed for 10 * 3" severity error;

        a <= "11111111"; -- 255
        b <= "00000001"; -- 1
        wait for 10 ns;
        assert result = "0000000011111111" -- 255
            report "Test failed for 255 * 1" severity error;

        a <= "00001111"; -- 15
        b <= "00001111"; -- 15
        wait for 10 ns;
        assert result = "0000000011100001" -- 225
            report "Test failed for 15 * 15" severity error;

        wait;
    end process;
end architecture tb;