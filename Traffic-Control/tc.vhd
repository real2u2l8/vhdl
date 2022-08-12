
library ieee;
use ieee.std_logic_1164.all;

entity tc is
    port (clk, rst : in std_logic;
            g, y, r : out std_logic );
end entity tc;

architecture arch_tc of tc is
    signal gout, yout, rout : std_logic;
    signal gin, yin, rin : std_logic;
    signal en : std_logic;
    component dff is
        port ( d : in std_logic;
                en : in std_logic;
                rst : in std_logic;
                clk : in std_logic;
                q : out std_logic );
    end component dff;

    begin
        en <= '1';
        map_g : dff port map ( gin, en, rst, clk, gout );
        map_y : dff port map ( yin, en, rst, clk, yout );
        map_r : dff port map ( rin, en, rst, clk, rout );

        gin <= not gout and not yout and rout;
        yin <= gout and not yout and not rout;
        rin <= (not gout and not yout and not rout) 
                or (not gout and yout and not rout);
        g <= gout;
        y <= yout;
        r <= rout;

end architecture arch_tc;
