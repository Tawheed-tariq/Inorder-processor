library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.CustomALU_pkg.ALL;

entity ALU is
    Port (
        A : in STD_LOGIC_VECTOR (7 downto 0);  
        B : in STD_LOGIC_VECTOR (7 downto 0); 
        sel : in STD_LOGIC_VECTOR (2 downto 0); 
        Result : out STD_LOGIC_VECTOR (7 downto 0); 
        Zero : out STD_LOGIC                
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
                temp_result := (others => '0');  
        end case;

        Result <= temp_result; 
        
        if temp_result = "00000000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
end Behavioral;
