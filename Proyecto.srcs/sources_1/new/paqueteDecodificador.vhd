library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteDecodificador is
    component Decodificador is Port ( 
           opCode : in STD_LOGIC_VECTOR (4 downto 0);
           TIPOR : out STD_LOGIC;
           BEQI : out STD_LOGIC;
           BNEQI : out STD_LOGIC;
           BLTI : out STD_LOGIC;
           BLETI : out STD_LOGIC;
           BGTI : out STD_LOGIC;
           BGETI : out STD_LOGIC);
   end component;
end package; 
