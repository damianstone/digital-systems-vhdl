library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sequential_Example is
    Port (
        clk, rst : in STD_LOGIC;     -- Clock and Reset inputs
        data_in : in STD_LOGIC;      -- Data input
        data_out : out STD_LOGIC     -- Data output
    );
end Sequential_Example;

architecture Behavioral of Sequential_Example is
    signal state : STD_LOGIC := '0';  -- Internal state signal
begin
    process (clk, rst)
    begin
        if rst = '1' then
            -- Reset condition: Initialize state and data_out
            state <= '0';
            data_out <= '0';
        elsif rising_edge(clk) then
            -- On rising clock edge, update the state based on data_in
            case state is
                when '0' =>
                    if data_in = '1' then
                        state <= '1';
                    else
                        state <= '0';
                    end if;
                when '1' =>
                    if data_in = '0' then
                        state <= '0';
                    else
                        state <= '1';
                    end if;
                when others =>
                    state <= '0';  -- Default state
            end case;
        end if;
    end process;

    -- Assign the output based on the current state
    data_out <= state;
end Behavioral;
