library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity memoriaDatos is
    generic (
        p : integer := 10;
        d : integer := 16
    );
    
    Port (  dir : in std_logic_vector(p-1 downto 0);
            clk, wd : in std_logic;
            dataOut : out std_logic_vector(d-1 downto 0);
            dataIn : in std_logic_vector(d-1 downto 0)   
    );
end memoriaDatos;

architecture Behavioral of memoriaDatos is
type aux is array (0 to ((2**p)-1)) of std_logic_vector(d-1 downto 0);
signal caja : aux;

begin

process(clk,wd,dir,dataIn) 
begin
    if(rising_edge(clk)) then
        if(wd = '1') then
            caja(conv_integer(dir)) <= dataIn;
        end if;
    end if;
end process;

   dataOut <= caja(conv_integer(dir));
    
end Behavioral;
