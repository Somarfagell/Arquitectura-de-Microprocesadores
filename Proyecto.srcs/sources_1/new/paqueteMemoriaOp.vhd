library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteMemoriaOP is 
    component memoriaOP is Port ( 
        opCode : in STD_LOGIC_VECTOR (4 downto 0);
        opCodeOut : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
end package;