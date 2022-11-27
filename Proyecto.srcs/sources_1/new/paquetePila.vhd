
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paquetePila is 
    component Pila is port(
        clk,clr,wpc,up,dw : in std_logic;
        PC_in : in std_logic_vector(15 downto 0);
        PC_out : out std_logic_vector(15 downto 0)
    );
    end component;
end package;  
