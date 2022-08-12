library ieee;
use ieee.std_logic_1164.all;

entity fa_tb is
end entity;

architecture arch_fa_tb of fa_tb is
        signal a_s, b_s, cin_s : std_logic;
        signal s_s, cout_s : std_logic;

        component fa is
                port ( a, b, cin : in std_logic;
                        s, cout : out std_logic);
        end component fa;

begin
        map_fa : fa port map ( a_s, b_s, cin_s, s_s, cout_s );

        input_a : process begin
                a_s <= '0';
                wait for 10 ns;
                a_s <= '1';
                wait for 10 ns;
        end process;

        input_b : process begin
                b_s <= '0';
                wait for 20 ns;
                b_s <= '1';
                wait for 20 ns;
        end process;

        input_cin : process begin
                cin_s <= '0';
                wait for 40 ns;
                cin_s <= '1';
                wait for 40 ns;
        end process;

end architecture arch_fa_tb;
