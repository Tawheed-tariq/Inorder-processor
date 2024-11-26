library IEEE;
use IEEE.std_logic_1164.all;

entity comparator_4bit is
port (
    A, B: in std_logic_vector(3 downto 0); -- 4-bit inputs for comparison
    A_less_B: out std_logic;   -- '1' if A < B else '0'
    A_equal_B: out std_logic;  -- '1' if A = B else '0'
    A_greater_B: out std_logic -- '1' if A > B else '0'
);
end comparator_4bit;

architecture comparator_structural of comparator_4bit is
    -- Temporary signals for each bit comparison
    signal equal_bits: std_logic_vector(3 downto 0);
    signal less_bits, greater_bits: std_logic_vector(3 downto 0);
begin
    -- Equality comparisons for each bit
    equal_bits(0) <= A(0) xnor B(0);
    equal_bits(1) <= A(1) xnor B(1);
    equal_bits(2) <= A(2) xnor B(2);
    equal_bits(3) <= A(3) xnor B(3);

    -- A_equal_B is true only when all bits are equal
    A_equal_B <= equal_bits(0) and equal_bits(1) and equal_bits(2) and equal_bits(3);

    -- Less than comparison logic
    -- Checks each bit position with higher significance
    A_less_B <= 
        (not A(3) and B(3)) or 
        (equal_bits(3) and not A(2) and B(2)) or 
        (equal_bits(3) and equal_bits(2) and not A(1) and B(1)) or 
        (equal_bits(3) and equal_bits(2) and equal_bits(1) and not A(0) and B(0));

    -- Greater than comparison logic
    A_greater_B <= 
        (A(3) and not B(3)) or 
        (equal_bits(3) and A(2) and not B(2)) or 
        (equal_bits(3) and equal_bits(2) and A(1) and not B(1)) or 
        (equal_bits(3) and equal_bits(2) and equal_bits(1) and A(0) and not B(0));
end comparator_structural;