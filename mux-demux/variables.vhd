library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.entity.all;

architecture Method3 of entiry is

  begin
    process (a, b, c)
    -- variables declaration
    variable a_or_b : STD_LOGIC;
    variable not_c : STD_LOGIC;

    -- use of variables
    begin
        a_or_b := a or b;
        not_c := not c;

        if (a_or_b = '1' and not_c = '1') then
            y <= '1';
        else
            y <= '0';
            
        end if;
    end process;

end Method3;
