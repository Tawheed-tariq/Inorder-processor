library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BoothMultiplier is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit signed input multiplicand
        B : in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit signed input multiplier
        Product : out STD_LOGIC_VECTOR(7 downto 0)  -- 8-bit signed output product
    );
end BoothMultiplier;

architecture Behavioral of BoothMultiplier is
    signal result : signed(8 downto 0);  -- Internal result signal
begin
    process(A, B)
        variable multiplicand : signed(4 downto 0);  -- Multiplicand with sign extension
        variable temp_product : signed(8 downto 0);  -- Full product register
        variable multiplier : std_logic_vector(3 downto 0);  -- Multiplier register
        variable q_prev : std_logic;                 -- Previous bit
    begin
        -- Initialize values
        multiplicand := signed(A(3) & A);     -- Sign-extend multiplicand
        multiplier := B;                      -- Load multiplier
        temp_product := (others => '0');      -- Clear product
        q_prev := '0';                        -- Initialize previous bit
        
        -- Main algorithm loop
        for i in 1 to 4 loop
            -- Check for add/subtract condition
            if (multiplier(0) = '1' and q_prev = '0') then
                temp_product(8 downto 4) := temp_product(8 downto 4) - multiplicand;
            elsif (multiplier(0) = '0' and q_prev = '1') then
                temp_product(8 downto 4) := temp_product(8 downto 4) + multiplicand;
            end if;
            
            -- Save current multiplier LSB
            q_prev := multiplier(0);
            
            -- Arithmetic right shift the entire product register
            multiplier := std_logic_vector(temp_product(4 downto 1));
            temp_product := temp_product(8) & temp_product(8 downto 1);
        end loop;
        
        -- Assign to internal signal
        result <= temp_product;
    end process;
    
    -- Convert final result to output
    Product <= std_logic_vector(result(7 downto 0));
end Behavioral;