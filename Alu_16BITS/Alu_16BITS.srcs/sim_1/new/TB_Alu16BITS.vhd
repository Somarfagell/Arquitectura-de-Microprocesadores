
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Alu16BITS is
--  Port ( );
end TB_Alu16BITS;

architecture Behavioral of TB_Alu16BITS is
    component ALU16BITS is port(
        a : in STD_LOGIC_VECTOR (15 downto 0);
        b : in STD_LOGIC_VECTOR (15 downto 0);
        aluop : in STD_LOGIC_VECTOR (3 downto 0);
        res : inout STD_LOGIC_VECTOR (15 downto 0);
        Co,N,Z,OV : out STD_LOGIC
    );
    end component;  
signal a : STD_LOGIC_VECTOR (15 downto 0);
signal b : STD_LOGIC_VECTOR (15 downto 0);
signal aluop : STD_LOGIC_VECTOR (3 downto 0);
signal res : STD_LOGIC_VECTOR (15 downto 0);
signal Co,N,Z,OV : STD_LOGIC;    
    
begin


ALU : AlU16BITS port map(
    a => a,
    b => b,
    aluop => aluop,
    res => res,
    Co => Co,
    N => N,
    Z => Z,
    OV => OV
);


process
begin
    wait for 10ns;
    a <= x"1000";
    b <= x"0001";
    aluop <= "0111";
    wait; 
end process;




end Behavioral;
