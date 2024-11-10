library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BoothMultiplier_tb is
end BoothMultiplier_tb;

architecture Behavioral of BoothMultiplier_tb is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Product : STD_LOGIC_VECTOR(7 downto 0);
    
    -- Function to convert std_logic_vector to string for better reporting
    function to_string(sv: std_logic_vector) return string is
        variable result: string(1 to sv'length);
    begin
        for i in sv'range loop
            case sv(i) is
                when '0' => result(i+1) := '0';
                when '1' => result(i+1) := '1';
                when others => result(i+1) := 'X';
            end case;
        end loop;
        return result;
    end function;
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.BoothMultiplier
        port map (
            A => A,
            B => B,
            Product => Product
        );

    -- Stimulus process
    process
        variable expected : signed(7 downto 0);
    begin
        -- Test case 1: 3 * 2 = 6
        A <= "0011";  -- 3
        B <= "0010";  -- 2
        expected := to_signed(6, 8);
        wait for 10 ns;
        assert signed(Product) = expected
            report "Test 1 failed: 3 * 2 = " & 
                  integer'image(to_integer(signed(Product))) & 
                  " (expected 6)" severity ERROR;
        
        -- Test case 2: -3 * 2 = -6
        A <= "1101";  -- -3
        B <= "0010";  -- 2
        expected := to_signed(-6, 8);
        wait for 10 ns;
        assert signed(Product) = expected
            report "Test 2 failed: -3 * 2 = " & 
                  integer'image(to_integer(signed(Product))) & 
                  " (expected -6)" severity ERROR;
        
        -- Test case 3: -2 * -2 = 4
        A <= "1110";  -- -2
        B <= "1110";  -- -2
        expected := to_signed(4, 8);
        wait for 10 ns;
        assert signed(Product) = expected
            report "Test 3 failed: -2 * -2 = " & 
                  integer'image(to_integer(signed(Product))) & 
                  " (expected 4)" severity ERROR;
        
        -- Test case 4: 4 * -3 = -12
        A <= "0100";  -- 4
        B <= "1101";  -- -3
        expected := to_signed(-12, 8);
        wait for 10 ns;
        assert signed(Product) = expected
            report "Test 4 failed: 4 * -3 = " & 
                  integer'image(to_integer(signed(Product))) & 
                  " (expected -12)" severity ERROR;

        -- Additional test cases
        -- Test case 5: 0 * 5 = 0
        A <= "0000";  -- 0
        B <= "0101";  -- 5
        expected := to_signed(0, 8);
        wait for 10 ns;
        assert signed(Product) = expected
            report "Test 5 failed: 0 * 5 = " & 
                  integer'image(to_integer(signed(Product))) & 
                  " (expected 0)" severity ERROR;
                  
        report "Simulation completed" severity NOTE;
        wait;
    end process;
end Behavioral;