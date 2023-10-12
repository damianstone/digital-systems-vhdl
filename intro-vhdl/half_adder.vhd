--this is a comment
--file name: half_adder.vhd

library ieee;
use ieee.std_logic_1164.all;

-- entity is for define inputs and outputs 
-- the name of the circuit 
entity half_adder is
port(
	a: in std_logic; -- input
	b: in std_logic; -- input
	sum: out std_logic;  -- output
	cout: out std_logic -- output
	);
end half_adder;

-- architecture is for define the logic of the entity
-- name: dataflow
-- entity: half_adder
architecture dataflow of half_adder is
begin
	sum <= (not a and b) or (a and not b); -- sum logic
	cout <= a and b; -- carry logic
end dataflow;
