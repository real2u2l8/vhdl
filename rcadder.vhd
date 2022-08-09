-- 16bit Ripple Carry Adder 
library ieee;
use ieee.std_logic_1164.all;

entity rcadder is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end rcadder;
 
architecture arch_rcadder of rcadder is
 
-- Full Adder VHDL Code Component Decalaration
component fa
Port (  a : in STD_LOGIC;
        b : in STD_LOGIC;
        cin : in STD_LOGIC;
        s : out STD_LOGIC;
        cout : out STD_LOGIC    );
end component fa;

signal c1,c2,c3: STD_LOGIC;
begin
 
FA1: fa port map( a(0), b(0), cin, s(0), c1);
FA2: fa port map( a(1), b(1), c1, s(1), c2);
FA3: fa port map( a(2), b(2), c2, S(2), c3);
FA4: fa port map( a(3), b(3), c3, S(3), cout);
 
end architecture arch_rcadder;