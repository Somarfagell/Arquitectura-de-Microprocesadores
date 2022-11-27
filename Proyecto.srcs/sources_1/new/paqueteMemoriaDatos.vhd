library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteMemoriaDatos is 
    component memoriaDatos is Port (  
            dir : in std_logic_vector(9 downto 0);
            clk, wd : in std_logic;
            dataOut : out std_logic_vector(15 downto 0);
            dataIn : in std_logic_vector(15 downto 0)   
    );
    end component;
end package;