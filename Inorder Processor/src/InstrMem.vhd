library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstrMem is
    Port (
        clk : in STD_LOGIC;
        addr : in STD_LOGIC_VECTOR(7 downto 0);
        instr : out STD_LOGIC_VECTOR(31 downto 0)
    );
end InstrMem;

architecture Behavioral of InstrMem is
    type mem_type is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
    signal memory : mem_type := (
        0 => "00000000000110100000101000000000",   --ADD
        1 => "00100000000011000000111100000000",   --SUB
        2 => "01000000000001110000011000000000",   --AND
        3 => "01100000000101000011000100000000",   --OR
        4 => "10000000001001110010010000000000",   --XOR
        5 => "10100000000101000010001100000000",   --NOR
        6 => "11000000000111100000000100000000",   --STORE
        others => (others => '0')
    );
begin
    process(clk)
    begin
        if rising_edge(clk) then
            instr <= memory(to_integer(unsigned(addr)));
        end if;
    end process;
end Behavioral;