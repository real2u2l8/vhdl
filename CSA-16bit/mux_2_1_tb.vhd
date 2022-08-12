library ieee;
use ieee.std_logic_1164.all;

entity mux2_1_tb is
end entity mux2_1_tb;

architecture arch_mux2_1_tb of mux2_1_tb is
    signal a_s, b_s, s_s : std_logic;
    signal o_s : std_logic;
    component mux2_1 is
        port( a, b, s : std_logic;
                o : out std_logic );
    end component mux2_1;

begin
    map_mux : mux2_1 port map (a_s, b_s, s_s, o_s);
    input_a : process begin
        a_s <= '0';
        wati for 10 ns;
        a_s <= '1';
        wati for 10 ns;
    end process;
    input_b : process begin
        b_s <= '0';
        wati for 15 ns;
        b_s <= '1';
        wati for 15 ns;
    end process;
    input_s : process begin
        s_s <= '0';
        wati for 40 ns;
        s_s <= '1';
        wati for 40 ns;
    end process;

end architecture arch_mux2_1_tb;