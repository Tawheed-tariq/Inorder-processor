library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unsigned_multiplier is
    port (
        a, b : in unsigned(7 downto 0);
        result : out unsigned(15 downto 0)
    );
end entity unsigned_multiplier;

architecture rtl of unsigned_multiplier is
begin
    process(a, b)
    begin
        result <= a * b;
    end process;
end architecture rtl;