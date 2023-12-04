library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CIRCUIT1 is
  port( A: in bit;
        B: in bit;
        D: out bit);
end CIRCUIT1;

architecture BEHAV of CIRCUIT1 is
  -- internal signal
  -- this is the signal that is used to connect the OR gate to the NOT gate
  signal C : bit;

  begin
    -- this runs second using the output of the OR gate
    -- NOT gate
    -- this is concurrent
    D <= not C;

  -- the following is sequential  
  process(A, B)
  begin
    -- This runs first generating the output C which is then used in the NOT gate
    -- OR gate
    if A = '1' or B = '1' then
      C <= '1';
    else
      C <= '0';
    end if;

  end process;
end BEHAV;  