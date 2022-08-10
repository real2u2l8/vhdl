-- Full Adder Test Bench
library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity rcadder_tb is
end entity rcadder_tb;

architecture arch_rcadder_tb of rcadder_tb is
    signal A_s, B_s, Cin_s, S_s, Cout_s : std_logic;
    component rcadder is
        port ( A    : in STD_LOGIC_VECTOR (15 downto 0);
                B   : in STD_LOGIC_VECTOR (15 downto 0);
                Cin : in STD_LOGIC;
                S   : out STD_LOGIC_VECTOR (15 downto 0);
                Cout : out STD_LOGIC );
        end component rcadder;
    begin
        FA : rcadder port map ( A_s, B_s, Cin_s, S_s, Cout_s );
            inputFA : process
            variable i : integer := 1;
            begin
                while(i <= 16) loop
                    A_s <= '0';
                    wait for 10 ns;
                    A_s <= '1';
                    wait for 10 ns;
                    B_s <= '0';
                    wait for 20 ns;
                    B_s <= '1';
                    wait for 20 ns;
                    Cin_s <= '0';
                    wait for 40 ns;
                    Cin_s <='1';
                    wait for 40 ns;
                end loop;
            end process;
        


end architecture arch_rcadder_tb ; 