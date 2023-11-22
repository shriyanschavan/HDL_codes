library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sequence_Display_FSM is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           input_bit : in STD_LOGIC;
           output_display : out STD_LOGIC_VECTOR (2 downto 0));
end Sequence_Display_FSM;

architecture Behavioral of Sequence_Display_FSM is

    type state_type is (S0, S1, S2, S3, S4, S5);
    signal current_state, next_state : state_type;

begin
    process(clk, reset)
    begin
        if (reset = '1') then
            current_state <= S0; -- Initial state
        elsif (rising_edge(clk)) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, input_bit)
    begin
        case current_state is
            when S0 =>
                output_display <= "000"; -- Output 0
                if (input_bit = '1') then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
                
            when S1 =>
                output_display <= "010"; -- Output 2
                if (input_bit = '1') then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;
                
            when S2 =>
                output_display <= "100"; -- Output 4
                if (input_bit = '1') then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
                
            when S3 =>
                output_display <= "101"; -- Output 5
                if (input_bit = '1') then
                    next_state <= S4;
                else
                    next_state <= S0;
                end if;
                
            when S4 =>
                output_display <= "011"; -- Output 3
                if (input_bit = '1') then
                    next_state <= S5;
                else
                    next_state <= S0;
                end if;
                
            when S5 =>
                output_display <= "001"; -- Output 1
                if (input_bit = '1') then
                    next_state <= S0;
                else
                    next_state <= S0;
                end if;
                
        end case;
    end process;

end Behavioral;
