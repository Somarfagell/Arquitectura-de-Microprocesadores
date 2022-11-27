library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity Registro is
    Port(
        writeReg, readReg1, readReg2, shamt : in STD_LOGIC_VECTOR (3 downto 0);
        writeData : in STD_LOGIC_VECTOR (15 downto 0);
        clk, clr, wr, she, dir : in STD_LOGIC;
        readData1, readData2 : out STD_LOGIC_VECTOR (15 downto 0));
end Registro;

architecture Behavioral of Registro is
type palabra is array (0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
signal banco : palabra;

begin

process (clk,clr)
variable aux,res : std_logic_vector(15 downto 0);
variable pot : integer;
begin
    if(clr = '1') then 
        banco <= (others => (others => '0'));
    elsif (rising_edge(clk)) then 
        if(wr = '1' and she = '0') then --carga
            banco(conv_integer(writeReg)) <= writeData;
        elsif(wr = '1' and she = '1' and dir = '0') then --corrimiento derecha
           aux := banco(conv_integer(readReg1));
           res := banco(conv_integer(readReg1));
           for i in 0 to 3 loop
           pot := 2**i;
                for j in 0 to 16-pot-1 loop
                    if(shamt(i)='1') then
                        res(j) := aux(j+pot);
                    end if;  
                end loop;
                for j in 16-pot to 15 loop
                    if(shamt(i)='1') then
                        res(j) := '0';
                    end if;  
                end loop;  
                aux := res;
           end loop;
           banco(conv_integer(writeReg)) <= res;
           
     elsif(wr = '1' and she = '1' and dir = '1') then --corrimiento izquierda
           aux := banco(conv_integer(readReg1));
           res := banco(conv_integer(readReg1));
           for i in 0 to 3 loop
           pot := 2**i;
                for j in 0 to pot-1 loop
                    if(shamt(i)='1') then
                        res(j) := '0';
                    end if;  
                end loop;
                
                for j in pot to 15 loop
                    if(shamt(i)='1') then
                        res(j) := aux(j-pot);
                    end if;  
                end loop;  
                aux := res;
           end loop;
           banco(conv_integer(writeReg)) <= res;
        end if;
    end if;
    end process;
    
readData1 <= banco(conv_integer(readReg1));
readData2 <= banco(conv_integer(readReg2));
   
end Behavioral;