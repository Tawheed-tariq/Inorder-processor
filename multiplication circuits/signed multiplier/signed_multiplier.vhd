library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signed_multiplier is
  port (
    a, b : in signed(7 downto 0);
    result : out signed(15 downto 0)
  );
end entity signed_multiplier;

architecture rtl of signed_multiplier is
begin
  process(a, b)
  begin
    result <= resize(a * b, 16);
  end process;
end architecture rtl;