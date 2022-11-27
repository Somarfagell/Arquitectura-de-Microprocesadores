library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bloqueCondicion is
    Port ( Q : in STD_LOGIC_VECTOR (3 downto 0);
           EQ : out STD_LOGIC;
           NE : out STD_LOGIC;
           LT : out STD_LOGIC;
           LE : out STD_LOGIC;
           GT : out STD_LOGIC;
           GE : out STD_LOGIC);
end bloqueCondicion;

architecture Behavioral of bloqueCondicion is
begin
    
    EQ <= Q(2);
    NE <= not(Q(2));
    LT <= not (Q(0));
    LE <= Q(2) or not(Q(0));
    GT <= not(Q(2)) and Q(0);
    GE <= Q(0);

end Behavioral;
