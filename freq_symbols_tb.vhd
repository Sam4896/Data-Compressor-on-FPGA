library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.math_real.all;
use work.input_data_type_package.all;

entity freq_symbols_tb is
--  Port ( );
end freq_symbols_tb;

architecture Behavioral of freq_symbols_tb is

    component freq_symbols is
    Generic (
        input_data_width: integer
    );
    Port ( 
        clk :  in  std_logic;
        i_data: in input_data_type(input_data_width downto 0);
        sym_freq_array_final: out sym_freq_type_integer --integer type
    );
    end component;
    
    signal period : time := 20 ns;
    signal clk: std_logic;

    
        
    --function to give random length of input data
    shared variable seed1, seed2: integer :=5;
    signal random_i_data_generated: bit:='0';
    
    impure function random_value(min_val, max_val: integer) return integer is
    variable r:real;
    begin
        uniform(seed1, seed2, r);
        return integer(r * real(max_val - min_val)  + real(min_val));
    end function;
    
    
--    shared variable input_data_width: integer:=random_value(700,1490); -- for the generic map
    shared variable input_data_width: integer:=289; -- for the generic map
    signal ready: bit;
    
    signal i_data: input_data_type(input_data_width-1 downto 0);
    shared variable i_data_vector_variable: input_data_type(input_data_width-1 downto 0);
    
begin
    uut: entity work.freq_symbols
    generic map(input_data_width=>input_data_width)
    port map(
        clk=>clk,
        i_data=>i_data,
        ready=>ready
    );
    
    
    process
    begin
        clk <= '1';
        wait for period/2;
        clk <= '0';
        wait for period/2;
    end process;
   

    process(clk)
    begin
        if rising_edge(clk) then
            if random_i_data_generated = '0' then
                for i in 0 to input_data_width-1 loop
                    i_data_vector_variable(i):= conv_std_logic_vector(random_value(0,255),i_data_vector_variable(i)'length);
                end loop;
            end if;
            random_i_data_generated <= '1';
        end if;
    end process;
    
    process(clk)
    begin
        if rising_edge(clk) and random_i_data_generated='1' then
--            if random_i_data_generated='1' then
                i_data<=i_data_vector_variable;
                ready<='1';
--            end if;
        end if;
    end process;
    
end Behavioral;
