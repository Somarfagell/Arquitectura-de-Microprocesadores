library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteMemoriaPrograma is 
    component memoriaPrograma is Port ( 
        PC : in STD_LOGIC_VECTOR (9 downto 0);
        Instruccion : out STD_LOGIC_VECTOR (24 downto 0)
    );
    end component;
end package;