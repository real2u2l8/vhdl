library ieee;
use ieee.std_logic_1164.all;

entity csa16 is
        port ( a, b : in std_logic_vector(15 downto 0);
                cin : in std_logic;
                s : out std_logic_vector(15 downto 0);
                cout : out std_logic );
end entity csa16;

architecture arch_csa16 of csa16 is
        signal carry : std_logic_vector(2 downto 0);
        signal carry_a : std_logic_vector(16 downto 3);
        signal carry_b : std_logic_vector(16 downto 3);
        signal sum_a : std_logic_vector(15 downto 2);
        signal sum_b : std_logic_vector(15 downto 2);
        signal carry_mux : std_logic_vector(3 downto 0);

        component fa is
                port ( a, b, cin : in std_logic;
                        s, cout : out std_logic );
        end component fa;

        component mux2_1 is
                port ( a, b, s : in std_logic;
                        o : out std_logic );
        end component mux2_1;

begin
        stage1_0 : fa port map ( a(0), b(0), carry(0), s(0), carry(1) );
        stage1_1 : fa port map ( a(1), b(1), carry(1), s(1), carry(2) );

        stage2_a2 : fa port map ( a(2), b(2), '0', sum_a(2), carry_a(3) );
        stage2_b2 : fa port map ( a(2), b(2), '1', sum_b(2), carry_b(3) );
        stage2_mux2 : mux2_1 port map ( sum_a(2), sum_b(2), carry(2), s(2) );
        stage2_a3 : fa port map ( a(3), b(3), carry_a(3), sum_a(3), carry_a(4) );
        stage2_b3 : fa port map ( a(3), b(3), carry_b(3), sum_b(3), carry_b(4) );
        stage2_mux3 : mux2_1 port map ( sum_a(3), sum_b(3), carry(2), s(3) );
        stage2_mux_c2 : mux2_1 port map ( carry_a(4), carry_b(4), carry(2), carry_mux(0));

        stage3_a4 : fa port map ( a(4), b(4), '0', sum_a(4), carry_a(5) );
        stage3_b4 : fa port map ( a(4), b(4), '1', sum_b(4), carry_b(5) );
        stage3_mux4 : mux2_1 port map ( sum_a(4), sum_b(4), carry_mux(0), s(4) );
        stage3_a5 : fa port map ( a(5), b(5), carry_a(5), sum_a(5), carry_a(6) );
        stage3_b5 : fa port map ( a(5), b(5), carry_b(5), sum_b(5), carry_b(6) );
        stage3_mux5 : mux2_1 port map ( sum_a(5), sum_b(5), carry_mux(0), s(5) );
        stage3_a6 : fa port map ( a(6), b(6), carry_a(6), sum_a(6), carry_a(7) );
        stage3_b6 : fa port map ( a(6), b(6), carry_b(6), sum_b(6), carry_b(7) );
        stage3_mux6 : mux2_1 port map ( sum_a(6), sum_b(6), carry_mux(0), s(6) );
        stage3_mux_c3 : mux2_1 port map ( carry_a(7), carry_b(7), carry_mux(0), carry_mux(1) );

        stage4_a7 : fa port map ( a(7), b(7), '0', sum_a(7), carry_a(8) );
        stage4_b7 : fa port map ( a(7), b(7), '1', sum_b(7), carry_b(8) );
        stage4_mux7 : mux2_1 port map ( sum_a(7), sum_b(7), carry_mux(1), s(7) );
        stage4_a8 : fa port map ( a(8), b(8), carry_a(8), sum_a(8), carry_a(9) );
        stage4_b8 : fa port map ( a(8), b(8), carry_b(8), sum_b(8), carry_b(9) );
        stage4_mux8 : mux2_1 port map ( sum_a(8), sum_b(8), carry_mux(1), s(8) );
        stage4_a9 : fa port map ( a(9), b(9), carry_a(9), sum_a(9), carry_a(10) );
        stage4_b9 : fa port map ( a(9), b(9), carry_b(9), sum_b(9), carry_b(10) );
        stage4_mux9 : mux2_1 port map ( sum_a(9), sum_b(9), carry_mux(1), s(9) );
        stage4_a10 : fa port map ( a(10),b(10),carry_a(10),sum_a(10),carry_a(11) );
        stage4_b10 : fa port map ( a(10),b(10),carry_b(10),sum_b(10),carry_b(11) );
        stage4_mux10 : mux2_1 port map ( sum_a(10),sum_b(10),carry_mux(1),s(10));
        stage4_mux_c4 : mux2_1 port map ( carry_a(11), carry_b(11), carry_mux(1), carry_mux(2));

        stage5_a11 : fa port map (a(11),b(11),'0',sum_a(11),carry_a(12) );
        stage5_b11 : fa port map (a(11),b(11),'1',sum_b(11),carry_b(12) );
        stage5_mux11 : mux2_1 port map ( sum_a(11), sum_b(11), carry_mux(2), s(11) );
        stage5_a12 : fa port map (a(12),b(12),carry_a(12),sum_a(12),carry_a(13));
        stage5_b12 : fa port map (a(12),b(12),carry_b(12),sum_b(12),carry_b(13));
        stage5_mux12 : mux2_1 port map ( sum_a(12), sum_b(12), carry_mux(2), s(12) );
        stage5_a13 : fa port map (a(13),b(13),carry_a(13),sum_a(13),carry_a(14));
        stage5_b13 : fa port map (a(13),b(13),carry_b(13),sum_b(13),carry_b(14));
        stage5_mux13 : mux2_1 port map ( sum_a(13), sum_b(13), carry_mux(2), s(13) );
        stage5_a14 : fa port map (a(14),b(14),carry_a(14),sum_a(14),carry_a(15));
        stage5_b14 : fa port map (a(14),b(14),carry_b(14),sum_b(14),carry_b(15));
        stage5_mux14 : mux2_1 port map ( sum_a(14), sum_b(14), carry_mux(2), s(14) );
        stage5_a15 : fa port map (a(15),b(15),carry_a(15),sum_a(15),carry_a(16));
        stage5_b15 : fa port map (a(15),b(15),carry_b(15),sum_b(15),carry_b(16));
        stage5_mux15 : mux2_1 port map ( sum_a(15), sum_b(15), carry_mux(2), s(15) );
        stage5_mux_c5 : mux2_1 port map ( carry_a(16), carry_b(16), carry_mux(2), carry_mux(3));

        carry(0) <= cin;
        cout <= carry_mux(3);

end architecture arch_csa16;

