-- Traffic Conftorl (신호등)회로  TestBench
library ieee;
use ieee.std_logic_1164.all;

entity tc4way_tb is
end entity tc4way_tb;

architecture arch_tc4way_tb of tc4way_tb is
    signal clk_s, rst_s : std_logic;
    signal G_s, LG_s ,Y_s, R_s : std_logic;

    component tc4way is
        port (clk, rst : in std_logic;
                g, lg, y, r : out std_logic );
    end component;

    begin
        map0 : tc4way port map (clk_s, rst_s, G_s, LG_s, Y_s, R_s);

        clocking : process begin
            clk_s <= '0';
            wait for 10 ns;
            clk_s <= '1';
            wait for 10 ns;
        end process;

        reseting : process begin
            rst_s <= '1';
            wait for 5 ns;
            rst_s <= '0';
            wait for 995 ns;
        end process;
end architecture arch_tc4way_tb ;