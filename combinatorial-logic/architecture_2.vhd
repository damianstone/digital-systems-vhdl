library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.entity.all;


architecture Method2 of truth_table_example is
  begin
      process (a, b, c)
      begin
          y <= (a or b) and not c;
      end process;
  end Method2;
