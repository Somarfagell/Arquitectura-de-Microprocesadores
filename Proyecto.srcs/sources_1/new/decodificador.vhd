library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decodificador is
    Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
           TIPOR : out STD_LOGIC;
           BEQI : out STD_LOGIC;
           BNEQI : out STD_LOGIC;
           BLTI : out STD_LOGIC;
           BLETI : out STD_LOGIC;
           BGTI : out STD_LOGIC;
           BGETI : out STD_LOGIC);
end Decodificador;

architecture Behavioral of Decodificador is
begin
    process(opCode)
    begin   
       if(opCode = "00000") then 
            TIPOR <= '1';
            BEQI <= '0';
            BNEQI <= '0';
            BLTI <= '0';
            BLETI <= '0';
            BGTI <= '0';
            BGETI <= '0';
       elsif(opCode = "01101") then 
            BEQI <= '1';
            TIPOR <= '0';            
            BNEQI <= '0';
            BLTI <= '0';
            BLETI <= '0';
            BGTI <= '0';
            BGETI <= '0';
       elsif(opCode = "01110") then 
            BNEQI <= '1'; 
            TIPOR <= '0';
            BEQI <= '0';            
            BLTI <= '0';
            BLETI <= '0';
            BGTI <= '0';
            BGETI <= '0';
       elsif(opCode = "01111") then
            BLTI <= '1';
            TIPOR <= '0';
            BEQI <= '0';
            BNEQI <= '0';            
            BLETI <= '0';
            BGTI <= '0';
            BGETI <= '0';
       elsif(opCode = "10000") then
            BLETI <= '1';
            TIPOR <= '0';
            BEQI <= '0';
            BNEQI <= '0';
            BLTI <= '0';            
            BGTI <= '0';
            BGETI <= '0';
       elsif(opCode = "10001") then
            BGTI <= '1';
            TIPOR <= '0';
            BEQI <= '0';
            BNEQI <= '0';
            BLTI <= '0';
            BLETI <= '0';            
            BGETI <= '0';
       elsif(opCode = "10010") then
            BGETI <= '1';
            TIPOR <= '0';
            BEQI <= '0';
            BNEQI <= '0';
            BLTI <= '0';
            BLETI <= '0';
            BGTI <= '0';            
       else 
            TIPOR <= '0';
            BEQI <= '0';
            BNEQI <= '0';
            BLTI <= '0';
            BLETI <= '0';
            BGTI <= '0';
            BGETI <= '0';
       end if;          
    end process;


end Behavioral;

