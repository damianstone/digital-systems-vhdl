library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
        A, B, Cin : in STD_LOGIC;     -- Inputs A, B, and Carry-In
        Sum, Cout : out STD_LOGIC    -- Sum and Carry-Out
    );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
    process (A, B, Cin)
    begin
        Sum <= (A xor B) xor Cin;  -- Sum output
        Cout <= (A and B) or ((A xor B) and Cin);  -- Carry-Out
    end process;
end Behavioral;
