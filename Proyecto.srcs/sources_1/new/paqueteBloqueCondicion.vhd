library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteBloqueCondicion is 
    component bloqueCondicion is Port (
           Q : in STD_LOGIC_VECTOR (3 downto 0);
           EQ : out STD_LOGIC;
           NE : out STD_LOGIC;
           LT : out STD_LOGIC;
           LE : out STD_LOGIC;
           GT : out STD_LOGIC;
           GE : out STD_LOGIC);
    end component;
end package;