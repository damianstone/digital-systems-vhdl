library library IEEE;
use IEEE.std_logic_1164.all;

entity REGISTER_EXERCISE is
  PORT ( d: in std_logic;
  clk: in std_logic;
  theOut: out std_logic);
end REGISTER_EXERCISE;

architecture of REGISTER_EXERCISE is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      q1 <= theOut or q2;
      q2 <= q1;
      theOut <= q2;
    end if;
  end process;
end REGISTER_EXERCISE;