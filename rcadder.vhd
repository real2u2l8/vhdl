-- 16bit Ripple Carry Adder 
library ieee;
use ieee.std_logic_1164.all;

entity rcadder is
Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        Cin : in STD_LOGIC;
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

signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: STD_LOGIC;
begin
 
FA1: fa port map( a(0), b(0), Cin, s(0), c1);
FA2: fa port map( a(1), b(1), c1, s(1), c2);
FA3: fa port map( a(2), b(2), c2, s(2), c3);
FA4: fa port map( a(3), b(3), c3, s(3), c4);
FA5: fa port map( a(4), b(4), c4, s(4), c5);
FA6: fa port map( a(5), b(5), c5, s(5), c6);
FA7: fa port map( a(6), b(6), c6, s(6), c7);
FA8: fa port map( a(7), b(7), c7, s(7), c8);
FA9: fa port map( a(8), b(8), c8, s(8), c9);
FA10: fa port map( a(9), b(9), c9, s(9), c10);
FA11: fa port map( a(10), b(10), c10, s(10), c11);
FA12: fa port map( a(11), b(11), c11, s(11), c12);
FA13: fa port map( a(12), b(12), c12, s(12), c13);
FA14: fa port map( a(13), b(13), c13, s(13), c14);
FA15: fa port map( a(14), b(14), c14, s(14), c15);
FA16: fa port map( a(15), b(15), c15, s(15), Cout);
 
end architecture arch_rcadder;