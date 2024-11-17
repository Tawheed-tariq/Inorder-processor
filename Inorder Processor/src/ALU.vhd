library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.CustomALU_pkg.ALL;

entity ALU is
    Port (
        A : in STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit input A
        B : in STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit input B
        sel : in STD_LOGIC_VECTOR (2 downto 0); -- 3-bit select input
        Result : out STD_LOGIC_VECTOR (7 downto 0); -- 8-bit output Result
        Zero : out STD_LOGIC                 -- Zero flag
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, sel)
    variable temp_result : STD_LOGIC_VECTOR (7 downto 0);
    begin
        case sel is
            when "000" => -- ADD
                temp_result := add_8bit(A, B);
            when "001" => -- SUBTRACT
                temp_result := sub_8bit(A, B);
            when "010" => -- AND
                temp_result := and_8bit(A, B);
            when "011" => -- OR
                temp_result := or_8bit(A, B);
            when "100" => -- XOR
                temp_result := xor_8bit(A, B);
            when "101" => -- NOR
                temp_result := nor_8bit(A, B);
            when others =>
                temp_result := (others => '0');  -- Default case
        end case;

        Result <= temp_result; -- Assign result to output
        
        -- Set the Zero flag
        if temp_result = "00000000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
end Behavioral;
