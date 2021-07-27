library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package input_data_type_package is
    type input_data_type is array (natural range <>) of std_logic_vector(7 downto 0);
    type input_data_type_integer is array (natural range <>) of integer;
    type sym_freq_type_integer is array (255 downto 0) of integer;
end package input_data_type_package;