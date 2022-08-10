-- D FliFlop Test Bench
library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is
end entity dff_tb;

architecture arch_dff_tb of dff_tb is
    signal d_s, clk_s, rst_s, en_s, qout : std_logic;

    component dff is
        port (d : in std_logic;
        en : in std_logic;
        rst : in std_logic;
        clk : in std_logic;
        q : out std_logic );
    end component dff;

begin
    map_dff : dff port map (d_s, en_s, rst_s, clk_s, qout);

    clocking : process
    begin
        clk_s <= '0';
        wait for 10 ns;
        clk_s <= '1';
        wait for 10 ns;
    end process;

    input_d : process
    begin
        d_s <= '0';
        wait for 25 ns;
        d_s <= '1';
        wait for 10 ns;
    end process;

    input_en : process
    begin
        en_s <= '0';
        wait for 40 ns;
        en_s <= '1';
        wait for 15 ns;
    end process;

    input_rst : process 
    begin
        rst_s <= '1';
        wait for 10 ns;
        rst_s <= '0';
        wait for 990 ns;
    end process;
end architecture arch_dff_tb;