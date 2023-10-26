library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Moore_FSM is
    Port (
        clk, rst, start : in STD_LOGIC;
        output1, output2 : out STD_LOGIC
    );
end Moore_FSM;

architecture Behavioral of Moore_FSM is
    type state_type is (StateA, StateB);
    
    signal current_state, next_state : state_type := StateA;

    begin
    process (clk, rst)
    begin
        if rst = '1' then
            current_state <= StateA;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process (current_state, start)
    begin
        case current_state is
            when StateA =>
                output1 <= '1';
                output2 <= '0';

                if start = '1' then
                    next_state <= StateB;
                else
                    next_state <= StateA;
                end if;

            when StateB =>
                output1 <= '0';
                output2 <= '1';

                if start = '0' then
                    next_state <= StateA;
                else
                    next_state <= StateB;
                end if;
        end case;
    end process;
end Behavioral;
