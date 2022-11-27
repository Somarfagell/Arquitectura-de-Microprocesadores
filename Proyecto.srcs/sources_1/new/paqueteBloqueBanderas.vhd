library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteBloqueBanderas is  
    component bloqueBanderas is Port ( 
           clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           LF : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
end package;
