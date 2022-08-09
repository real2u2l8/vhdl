-- ghdl -a fa.vhd (vhd파일 컴파일)
-- ghdl -a fa_tb.vhd
-- ghdl -e fa_tb
-- ghdl -r fa_tb --stop-time=190ns --wave=fa_tb.ghw
-- gtkwave fa_tb.dhw //명령어 없으면 설치
-- Full Adder

-- library : 라이브러리를 불러옴. IP(반도체 지적재산 설계회로)
-- example : altera, xilinx와 같은 패키지 이름이 존재
library ieee;
-- use : 불러온 라이브러리 내의 패키지 묶음을 사용하도록 불러온다. 
use ieee.std_logic_1164.all;
-- fa is full adder
entity fa is
port ( a, b, cin : in std_logic; -- std_logic : 1, 0, x, z, U
        s, cout : out std_logic );
end entity fa;

architecture arch_fa of fa is 
signal temp_b : std_logic;
begin
    temp_b <= b xor cin; -- <= : connect signal stream, 디지털 로직 신호를 연결해준다.
    s <= a xor temp_b;
    cout <= (temp_b and a) or (b and cin);

end architecture arch_fa;