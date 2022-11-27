
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumRapido is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end SumRapido;

architecture Behavioral of SumRapido is

begin
    Process (a,b,cin)
    variable P,G: std_logic_vector(7 downto 0);
    variable c : std_logic_vector(8 downto 0);
    variable aux1 : std_logic;
    begin
        c(0) := cin;
        for i in 0 to 7 loop
            P(i) := a(i) xor b(i);
            G(i) := a(i) and b(i);
            s(i) <= P(i) xor C(i);
            
            c(i+1) := c(0);
            for x in 0 to i loop
                c(i+1) := c(i+1) and P(x);
            end loop;
            
            
            for k in 0 to i-1 loop
                aux1 := G(k); 
                for m in k+1 to i loop
                    aux1 := aux1 and P(m);
                end loop;
                c(i+1) := c(i+1) or aux1;
            end loop;
            
            c(i+1) := c(i+1) or G(i);
            
        end loop;
        
        cout <= c(8);
    
    end process;

end Behavioral;
