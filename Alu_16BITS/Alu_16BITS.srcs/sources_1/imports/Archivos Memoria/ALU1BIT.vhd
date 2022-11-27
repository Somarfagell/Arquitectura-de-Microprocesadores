
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU1BIT is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           aInvert : in STD_LOGIC;
           bInvert : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC;
           cout : out STD_LOGIC);
end ALU1BIT;

architecture Behavioral of ALU1BIT is
signal auxa,auxb,auxand,auxor,auxxor, auxsuma : std_logic;

begin

    auxa <= a when aInvert = '0' else not a;
    auxb <= b xor bInvert;
    
    auxand <= auxa and auxb;
    auxor <= auxa or auxb;
    auxxor <= auxa xor auxb;
    
    auxsuma <= auxa xor auxb xor cin;
    cout <= (auxa and cin) or (auxa and auxb) or (auxb and cin);
    
    res <=  auxand when op = "00" else
            auxor when op = "01" else
            auxxor when op = "10" else
            auxsuma;
            
end Behavioral;
