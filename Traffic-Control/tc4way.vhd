-- Traffic Conftorl 4way (신호등)회로 
library ieee;
use ieee.std_logic_1164.all;

entity tc4way is
    port (clk, rst : in std_logic;
            g, lg ,y, r : out std_logic );
end entity tc4way;

architecture arch_tc4way of tc4way is
    signal gout, lgout, yout, rout : std_logic;
    signal gin, lgin, yin, rin : std_logic;
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
        map_lg : dff port map ( lgin, en, rst, clk, lgout );
        map_y : dff port map ( yin, en, rst, clk, yout );
        map_r : dff port map ( rin, en, rst, clk, rout );

        gin <= (not gout and not lgout and not yout and rout) or (gout and lgout and not yout and not rout);
        lgin <= not gout and not lgout and not yout and rout;
        yin <= gout and not lgout and not yout and not rout;
        rin <= (not gout and not lgout and not yout and not rout) or (not gout and not lgout and yout and not rout);
        
        g <= gout;
        lg <= lgout;
        y <= yout;
        r <= rout;

end architecture arch_tc4way;
