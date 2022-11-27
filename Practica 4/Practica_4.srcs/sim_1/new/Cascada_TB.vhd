----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2021 09:38:07
-- Design Name: 
-- Module Name: Cascada_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Cascada_TB is
--  Port ( );
end Cascada_TB;

architecture Behavioral of Cascada_TB is

component SumadorCascada is
     Port (a,b : in STD_LOGIC_VECTOR (3 downto 0);  
           sel : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);           
end component;

signal a : STD_LOGIC_VECTOR (3 downto 0);
signal b : STD_LOGIC_VECTOR (3 downto 0);
signal sel : STD_LOGIC;
signal s : STD_LOGIC_VECTOR (3 downto 0);
signal cout : STD_LOGIC;

begin
unidad1 : SumadorCascada
    Port Map(
        a => a,
        b => b,
        sel => sel,
        s => s,
        cout => cout        
    );
    
process
begin
    a <= "0110";   --6+7
    b <= "0111";
    sel <= '0';
    wait for 20ms;
    a <= "0110";   --6+9
    b <= "1001";
    sel <= '0';
    wait for 20ms;
    a <= "0100";   --4+9
    b <= "1001";
    sel <= '0';
    wait for 20ms;
    a <= "1111";   --15-1
    b <= "0001";
    sel <= '1';
    wait for 20ms;
    a <= "0011";   --3+10
    b <= "1010";
    sel <= '0';
    wait for 20ms;
    a <= "1100";   --12-5
    b <= "0101";
    sel <= '1';
    wait for 20ms;
    a <= "1110";   --14-8
    b <= "1000";
    sel <= '1';
    wait for 20ms;
    a <= "1010";   --10-6
    b <= "0110";
    sel <= '1';
    wait for 20ms;
    a <= "1001";   --9-4
    b <= "0100";
    sel <= '1';
    wait;
	
end process;

end Behavioral;
