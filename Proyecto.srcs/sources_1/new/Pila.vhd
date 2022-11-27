library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;



entity Pila is port(
    clk,clr,wpc,up,dw : in std_logic;
    PC_in : in std_logic_vector(15 downto 0);
    PC_out : out std_logic_vector(15 downto 0)
    );  
end Pila;

architecture Behavioral of Pila is
type PC is array (0 to 7) of std_logic_vector(15 downto 0);
signal Pila : PC;
begin


process(clk,clr,Pila,wpc,up,dw)
variable sPointer : integer range 0 to 7;
begin
    if(clr = '1') then 
        Pila <= (others => (others => '0')); --En caso de hacer cosas raras cambiar a señal
        sPointer := 0; 
    elsif(rising_edge(clk)) then 
        if(wpc = '0' and up = '0' and dw = '0') then
            Pila(sPointer) <= Pila(sPointer) + 1;
        elsif(wpc = '1' and up = '0' and dw = '0') then
            Pila(sPointer) <= PC_in;
        elsif(wpc = '1' and up = '1' and dw = '0') then
            Pila(sPointer) <= Pila(sPointer)+1;
            sPointer := sPointer+1;
            Pila(conv_integer(sPointer)) <= PC_in; --Nota para mi mismo: Las señales se actualizan despues de reloj
        elsif(wpc = '0' and up = '0' and dw = '1') then
            sPointer := sPointer-1;
            Pila(sPointer) <= Pila(sPointer)+1;
        end if;
    end if;
   
    PC_out <= Pila(sPointer);
end process;


    

end Behavioral;