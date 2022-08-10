-- 16bit Ripple Carry Adder 
library ieee;
use ieee.std_logic_1164.all;

entity rcadder is
Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        S : out STD_LOGIC_VECTOR (15 downto 0);
        Cout : out STD_LOGIC);
end rcadder;
 
architecture arch_rcadder of rcadder is
        component fa
        Port (  a : in STD_LOGIC;
                b : in STD_LOGIC;
                cin : in STD_LOGIC;
                s : out STD_LOGIC;
                cout : out STD_LOGIC    );
        end component fa;

signal c: std_logic_vector(15 downto 0);
begin
c(0) <= '0';
FA1: fa port map( a(0), b(0), c(0), s(0), c(1));
FA2: fa port map( a(1), b(1), c(1), s(1), c(2));
FA3: fa port map( a(2), b(2), c(2), s(2), c(3));
FA4: fa port map( a(3), b(3), c(3), s(3), c(4));
FA5: fa port map( a(4), b(4), c(4), s(4), c(5));
FA6: fa port map( a(5), b(5), c(5), s(5), c(6));
FA7: fa port map( a(6), b(6), c(6), s(6), c(7));
FA8: fa port map( a(7), b(7), c(7), s(7), c(8));
FA9: fa port map( a(8), b(8), c(8), s(8), c(9));
FA10: fa port map( a(9), b(9), c(9), s(9), c(10));
FA11: fa port map( a(10), b(10), c(10), s(10), c(11));
FA12: fa port map( a(11), b(11), c(11), s(11), c(12));
FA13: fa port map( a(12), b(12), c(12), s(12), c(13));
FA14: fa port map( a(13), b(13), c(13), s(13), c(14));
FA15: fa port map( a(14), b(14), c(14), s(14), c(15));
FA16: fa port map( a(15), b(15), c(15), s(15), cout);
 
end architecture arch_rcadder;