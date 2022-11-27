library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteALU16BITS is 
    component ALU16BITS is Port ( 
        a : in STD_LOGIC_VECTOR (15 downto 0);
        b : in STD_LOGIC_VECTOR (15 downto 0);
        aluop : in STD_LOGIC_VECTOR (3 downto 0);
        res : inout STD_LOGIC_VECTOR (15 downto 0);
        Co,N,Z,OV : out STD_LOGIC);
    end component;
end package;