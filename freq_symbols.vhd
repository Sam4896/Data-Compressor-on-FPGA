library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned;
use ieee.numeric_std.all;
use ieee.std_logic_arith;
use work.input_data_type_package.all;


entity freq_symbols is
    Generic (
        input_data_width: integer --:=1500
    );
    Port ( 
        clk :  in  std_logic;
        ready : in bit :='1';
        i_data: in input_data_type(input_data_width-1 downto 0);
        sym_freq_array_out: out sym_freq_type_integer --integer type
    );
end freq_symbols;

architecture arch of freq_symbols is

--signal sym_list_all: sym_list_data_type;
--signal sym_list_ready: bit:='0';

shared variable sym_freq_array: sym_freq_type_integer := (others=>0);
shared variable input_data_integer: input_data_type_integer(input_data_width-1 downto 0) := (others=>0);

shared variable i_data_integer_ready: bit:='0';
shared variable freq_sym_complete: bit:='1';

shared variable i_data_received: bit:= '0';

--I read in ics documentation that the loop range entity should be a constant
--otherwise,the logic inside the loop may be replicated for all the possible 
--values ofthe loop ranges, which can be very expensive in terms of gates.


procedure convert_idata_to_integer(start,ending: integer; i_data: input_data_type(input_data_width-1 downto 0)) is
begin
    for i in start to ending loop
         if (i < input_data_width) then
            input_data_integer(i) := to_integer (unsigned(i_data(i)));
--         else
--            exit;
         end if;
    end loop;
end procedure;


procedure count_sym_freq(start, ending: integer; input_data_integer: input_data_type_integer(input_data_width-1 downto 0)) is
variable j: integer;
begin
     for j in start to ending loop
         if (j < input_data_width) then
            sym_freq_array(input_data_integer(j)):=sym_freq_array(input_data_integer(j))+1;
--         else
--            exit;
         end if;
     end loop;
end procedure;
 
begin
    

    --when the new input changes, fist the input data will be converted into the integer form so that things are easier to compare
    --when it is done, i_data_integer_ready will be set.
    --frequency counting processes will be sensitive to i_data_integer_ready and not clock, since right now we need to calculate the frequency of the symbols
    --when the input data changes
        
       
    new_input: process(clk)
    begin
        if (rising_edge(clk) and ready ='1' and i_data_received='0') then
            convert_idata_to_integer(0,input_data_width-1,i_data); --procedure called to convert the input data from std_vector to integer
            sym_freq_array:= (others=>0);
            i_data_received:='1';
            i_data_integer_ready:='1';
            freq_sym_complete:='0';
        end if;
    end process;
    

    p1: process(clk) 
    begin
        if (rising_edge(clk) and freq_sym_complete='0'and i_data_integer_ready ='1') then
--            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(0,99,input_data_integer);
            end if;
--        end if;
    end process;
    
    p2:  process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(100,199,input_data_integer);
            end if;
        end if;
    end process;
    
    p3:  process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(200,299,input_data_integer);
            end if;
        end if;
    end process;
    
    p4: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(300,399,input_data_integer);
            end if;
        end if;
    end process;
    
    p5: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(400,499,input_data_integer);
            end if;
        end if;
    end process;
    
    p6: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(500,599,input_data_integer);
            end if;
        end if;
    end process;
    
    p7: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(600,699,input_data_integer);
            end if;
        end if;
    end process;
    
    p8: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(700,799,input_data_integer);
            end if;
        end if;
    end process;
    
    p9: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(800,899,input_data_integer);
            end if;
        end if;
    end process;
    
    p10: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(900,999,input_data_integer);
            end if;
        end if;
    end process;
    
    p11: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(1000,1099,input_data_integer);
            end if;
        end if;
    end process;
    
    p12: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(1100,1199,input_data_integer);
            end if;
        end if;
    end process;
    
    p13: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(1200,1299,input_data_integer);
            end if;
        end if;
    end process;
    
    p14: process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(1300,1399,input_data_integer);
            end if;
        end if;
    end process;
    
    p15:  process(clk) 
    begin
        if rising_edge(clk) then
            if (freq_sym_complete='0'and i_data_integer_ready ='1') then
                count_sym_freq(1400,1499,input_data_integer);
                i_data_integer_ready:='0';    
                freq_sym_complete:='1';     
            end if;  
        end if;
    end process;
    
    process(clk)
    begin
       sym_freq_array_out<=sym_freq_array; 
    end process;

end arch;
