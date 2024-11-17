library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package CustomALU_Pkg is
    function add_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;
    function sub_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;
    function and_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;
    function or_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;
    function xor_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;
    function nor_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;
end CustomALU_Pkg;

package body CustomALU_Pkg is
    -- Addition Function
    function add_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
        variable Result: STD_LOGIC_VECTOR(7 downto 0);
        variable Carry: STD_LOGIC_VECTOR(8 downto 0);  -- One extra bit for initial carry
    begin
        Carry(0) := '0';  -- Initial carry is 0
        
        for i in 0 to 7 loop
            Result(i) := A(i) xor B(i) xor Carry(i);
            Carry(i+1) := (A(i) and B(i)) or (A(i) and Carry(i)) or (B(i) and Carry(i));
        end loop;
        
        return Result;
    end function;

    -- Subtraction Function
    function sub_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
        variable Result: STD_LOGIC_VECTOR(7 downto 0);
        variable Borrow: STD_LOGIC_VECTOR(8 downto 0);  -- One extra bit for initial borrow
        variable B_comp: STD_LOGIC_VECTOR(7 downto 0);  -- Two's complement of B
    begin
        -- Create two's complement of B
        B_comp := not B;
        Borrow(0) := '1';  -- Add 1 for two's complement
        
        for i in 0 to 7 loop
            Result(i) := A(i) xor B_comp(i) xor Borrow(i);
            Borrow(i+1) := (A(i) and B_comp(i)) or (A(i) and Borrow(i)) or (B_comp(i) and Borrow(i));
        end loop;
        
        return Result;
    end function;

    -- Bitwise AND (no changes needed)
    function and_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
        variable Result: STD_LOGIC_VECTOR(7 downto 0);
    begin
        for i in 7 downto 0 loop
            Result(i) := A(i) and B(i);
        end loop;
        return Result;
    end function;

    -- Bitwise OR (no changes needed)
    function or_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
        variable Result: STD_LOGIC_VECTOR(7 downto 0);
    begin
        for i in 7 downto 0 loop
            Result(i) := A(i) or B(i);
        end loop;
        return Result;
    end function;

    -- Bitwise XOR (no changes needed)
    function xor_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
        variable Result: STD_LOGIC_VECTOR(7 downto 0);
    begin
        for i in 7 downto 0 loop
            Result(i) := A(i) xor B(i);
        end loop;
        return Result;
    end function;

    -- Bitwise NOR (no changes needed)
    function nor_8bit(A, B: STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
        variable Result: STD_LOGIC_VECTOR(7 downto 0);
    begin
        for i in 7 downto 0 loop
            Result(i) := not (A(i) or B(i));
        end loop;
        return Result;
    end function;
end CustomALU_Pkg;