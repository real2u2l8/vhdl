library ieee;
use ieee.std_logic_1164;

entity mux2_1 is
    port( a, b, s : in std_logic;
            o : out std_logic)
end entity;

architecture arch_mux2_1 of mux2_1 is
begin
    o <= (not s and a) or (s and b);
end architecture arch_mux2_1

