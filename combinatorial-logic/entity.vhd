library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC.ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity truth_table_example is
    Port ( a, b, c : in STD_LOGIC;  -- Inputs: truth table
           y : out STD_LOGIC);    -- Output
end truth_table_example;