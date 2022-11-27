library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.paqueteALU1bit.all;


entity ALU16BITS is Port ( 
    a : in STD_LOGIC_VECTOR (15 downto 0);
    b : in STD_LOGIC_VECTOR (15 downto 0);
    aluop : in STD_LOGIC_VECTOR (3 downto 0);
    res : inout STD_LOGIC_VECTOR (15 downto 0);
    Co,N,Z,OV : out STD_LOGIC); 
end ALU16BITS;

architecture Behavioral of ALU16BITS is
signal c : std_logic_vector(16 downto 0);

begin
c(0) <= aluop(2);

    ciclo: for i in 0 to 15 generate
       elemento: ALU1BIT port map 
                 ( 
                   A => a(i),
                   B => b(i),
                   CIN => c(i),
                   aInvert => aluop(3),
                   bInvert => aluop(2),
                   op => aluop(1 downto 0),
                   res => res(i),
                   cout => c(i+1)
                );           
    end generate;
    
    
    Co <= c(16) when aluop = "0011" or aluop = "0111" else '0';
    Z <= '1' when res = "0000000000000000" else '0';
    OV <= c(16) xor c(15);
    N <= res(15);
       


end Behavioral;