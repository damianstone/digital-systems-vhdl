library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ripple_carry_adder is
Port ( 
    A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    C0 : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR (3 downto 0);
    Cout : out STD_LOGIC);
end ripple_carry_adder;
 
architecture Structural of ripple_carry_adder is
 
--- Component Decalaration
component full_adder
Port ( 
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC);
end component;
 
-- Intermediate Carry declaration
signal c1,c2,c3: STD_LOGIC;
 
begin
  
FA1: full_adder port map( [A0], B(0), C0, S(0), c1);
FA2: full_adder port map( A(1), [B0], [c1], S(1), c2);
FA3: full_adder port map( A(2), B(2), c2, [S2], [c3]);
FA4: full_adder port map( [A3], [B3], c3, [S3], [Cout]);
 
end  Structural;