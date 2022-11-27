library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bloqueNivel is
    Port ( clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           NA : out STD_LOGIC);
end bloqueNivel;

architecture Behavioral of bloqueNivel is
signal PCLK, NCLK : std_logic := '0';
begin
    alto : process(clk,clr)     
    begin
        if(clr = '1') then
            PCLK <= '0';
        elsif(rising_edge(clk)) then
            PCLK <= not PCLK;
        end if;           
    end process;
    
    bajo : process(clk,clr) 
    begin
        if(clr = '1') then
            NCLK <= '0';
        elsif(falling_edge(clk)) then
            NCLK <= not NCLK;
        end if;           
    end process;
    
    NA <= NCLK xor PCLK;
end Behavioral;
