LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_gcd IS
END;
ARCHITECTURE tb OF tb_gcd IS
  SIGNAL M : INTEGER := 16;
  SIGNAL TestArrayLength : INTEGER := 6;

  COMPONENT top_gcd IS
    GENERIC (N : INTEGER := M);
    PORT (
      clk, reset, start : IN STD_LOGIC;
      Ain, Bin : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
      GCDout : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
      done : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL A, B : STD_LOGIC_VECTOR(M - 1 DOWNTO 0);
  SIGNAL GCD : STD_LOGIC_VECTOR(M - 1 DOWNTO 0);
  SIGNAL reset : STD_LOGIC := '1';
  SIGNAL start : STD_LOGIC := '0';
  SIGNAL Done : STD_LOGIC;

  CONSTANT halfperiod : TIME := 50 ps;

  TYPE t_matrix IS ARRAY (0 TO TestArrayLength - 1, 0 TO 1) OF INTEGER;
  -- matrix 4 x 8
  SIGNAL testnumbers : t_matrix := ((375, 565), (451, 451), (42, 285),
  (432, 111), (51, 357), (11571, 1767));

BEGIN
  u1 : top_gcd GENERIC MAP(N => 16)
  PORT MAP(clk, reset, start, A, B, GCD, Done);
  clk <= NOT clk AFTER halfperiod;

  PROCESS
  BEGIN
    REPORT("Starting simulation...");
    trydiffvalues : FOR k IN 0 TO TestArrayLength - 1 LOOP
      reset <= '0';
      WAIT FOR 2 * halfperiod;
      A <= STD_LOGIC_VECTOR(to_unsigned(testnumbers(k, 0), M));
      B <= STD_LOGIC_VECTOR(to_unsigned(testnumbers(k, 1), M));
      start <= '1';
      WAIT UNTIL done = '1';

    END LOOP trydiffvalues;

    REPORT("End simulation...");
    WAIT;
  END PROCESS;
END;