library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.entity.all;

architecture Method1 of truth_table_example is
begin
    process (a, b, c)
    begin -- add just the cases when y = '1'
        if (a = '0' and b = '1' and c = '0') or
           (a = '1' and b = '0' and c = '0') or
           (a = '1' and b = '1' and c = '0') then
            y <= '1';
        else
            y <= '0';
        end if;
    end process;
end Method1;
