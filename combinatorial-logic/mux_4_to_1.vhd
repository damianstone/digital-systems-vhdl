library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port ( 
        S : in STD_LOGIC_VECTOR(1 downto 0);
        I : in STD_LOGIC_VECTOR(3 downto 0);  
        Y : out STD_LOGIC  
    );
end mux_4to1;

architecture Behavioral of mux_4to1 is
  
begin
    process (S, I)

    begin
        case S is
            when "00" =>
                y <= I(0);
            when "01" =>
                y <= I(1);
            when "10" =>
                y <= I(2);
            when "11" =>
                y <= I(3);
            when others =>
                y <= 'X';
        end case;

    end process;

end Behavioral;
