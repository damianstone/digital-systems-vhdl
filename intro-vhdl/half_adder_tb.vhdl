library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture testbench of half_adder_tb is
   signal a, b, sum, cout: std_logic;
begin
   uut: entity work.half_adder
      port map(
         a => a,
         b => b,
         sum => sum,
         cout => cout
      );

   process
   begin
      a <= '0'; -- Set your inputs here
      b <= '1';

      wait for 10 ns; -- Simulate for a duration
      a <= '1';
      b <= '0';

      wait for 10 ns;

      -- Add more input scenarios and waits as needed

      report "Simulation finished" severity note;
      wait;
   end process;
end testbench;
