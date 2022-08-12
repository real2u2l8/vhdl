library ieee;
use ieee.std_logic_1164.all;

entity fa is
        port ( a, b, cin : in std_logic;
                s, cout : out std_logic );
end entity fa;

architecture arch_fa of fa is
        signal a_xor_b : std_logic; -- half adder 의 조합으로 표현하기 위한
begin
        a_xor_b <= a xor b;
        s <= a_xor_b xor cin;
        cout <= ( a and b ) or ( a_xor_b and cin );

end architecture arch_fa;

