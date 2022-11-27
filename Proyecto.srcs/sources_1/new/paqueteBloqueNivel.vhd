library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteBloqueNivel is 
    component bloqueNivel is Port ( 
        clr : in STD_LOGIC;
        clk : in STD_LOGIC;
        NA : out STD_LOGIC);    
    end component;
end package;