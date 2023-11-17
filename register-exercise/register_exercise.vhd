library library IEEE;
use IEEE.std_logic_1164.all;

entity OR_gate is
  PORT (
    input1: in std_logic;
    input2: in std_logic;
    output_result: out std_logic
  );
end OR_gate;

architecture behavioral of OR_gate is
begin
  process(input1, input2)
  begin
    output_result <= input1 or input2;  -- OR gate behavior
  end process;
end behavioral;

entity reg is
  PORT ( d: in std_logic;
  clk: in std_logic;
  q: out std_logic );
end reg;

architecture of reg is
  signal dff1, dff2 : std_logic;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      -- the input of the OR gate is the input of the first register
      q1 := dff1 <= d
      q2 := dff2 <= q1 -- input of the OR gate
      q <= q2 -- input of the OR gate
    end if;
  end process;
end reg;