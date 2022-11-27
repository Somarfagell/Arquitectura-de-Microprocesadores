library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteUnidadControl is 
    component UnidadControl is Port ( clk : in STD_LOGIC;
           SDOPC : out STD_LOGIC;
           SM : out STD_LOGIC;
           NA : in STD_LOGIC;
           clr : in STD_LOGIC;
           EQ : in STD_LOGIC;
           NE : in STD_LOGIC;
           LT : in STD_LOGIC;
           LE : in STD_LOGIC;
           GT : in STD_LOGIC;
           GE : in STD_LOGIC;
           TIPOR : in STD_LOGIC;
           BEQI : in STD_LOGIC;
           BNEQI : in STD_LOGIC;
           BLTI : in STD_LOGIC;
           BLETI : in STD_LOGIC;
           BGTI : in STD_LOGIC;
           BGETI : in STD_LOGIC);
     end component;
end package;