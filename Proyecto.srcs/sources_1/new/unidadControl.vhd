library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    Port ( clk : in STD_LOGIC;
           SDOPC : out STD_LOGIC;
           SM : out STD_LOGIC;
           NA : in STD_LOGIC;
           clr : in STD_LOGIC;
           EQ : in STD_LOGIC;
           NE : in STD_LOGIC;
           LT : in STD_LOGIC;
           LE : in STD_LOGIC;
           GT : in STD_LOGIC;
           GE : in STD_LOGIC;
           TIPOR : in STD_LOGIC;
           BEQI : in STD_LOGIC;
           BNEQI : in STD_LOGIC;
           BLTI : in STD_LOGIC;
           BLETI : in STD_LOGIC;
           BGTI : in STD_LOGIC;
           BGETI : in STD_LOGIC);
end unidadControl;

architecture Behavioral of unidadControl is
type estados is (e0);
signal edo_act, edo_sig: estados;
begin

process(clk, clr)
begin
    if(clr = '1') then 
        edo_act <= e0;
    elsif (rising_edge (clk)) then
        edo_act <= edo_sig;
    end if;
end process;

process(edo_act,EQ,NE,LT,LE,GT,GE,TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI,NA)
begin
     case edo_act is
        when e0 =>
            edo_sig <= e0;     
            if(TIPOR = '1') then
                SDOPC <= '0';
                SM <= '0';                                                                                                                                                           
            elsif (BEQI = '1') then
                if(NA = '1') then
                    SDOPC <= '0';
                    SM <= '1';
                elsif (EQ = '1' and NA = '0') then
                    SDOPC <= '1';
                    SM <= '1';                    
                elsif (EQ = '0' and NA = '0') then
                    SDOPC <= '0';
                    SM <= '1';                      
                end if;    
            elsif (BNEQI = '1') then
                if(NA = '1') then
                    SDOPC <= '0';
                    SM <= '1';
                elsif (NE = '1' and NA = '0') then
                    SDOPC <= '1';
                    SM <= '1';                    
                elsif (NE = '0' and NA = '0') then
                    SDOPC <= '0';
                    SM <= '1';                      
                end if;    
            elsif (BLTI = '1') then 
                if(NA = '1') then
                    SDOPC <= '0';
                    SM <= '1';
                elsif (LT = '1' and NA = '0') then
                    SDOPC <= '1';
                    SM <= '1';                    
                elsif (LT = '0' and NA = '0') then
                    SDOPC <= '0';
                    SM <= '1';                      
                end if;     
            elsif (BLETI = '1') then 
                if(NA = '1') then
                    SDOPC <= '0';
                    SM <= '1';
                elsif (LE = '1' and NA = '0') then
                    SDOPC <= '1';
                    SM <= '1';                    
                elsif (LE = '0' and NA = '0') then
                    SDOPC <= '0';
                    SM <= '1';                      
                end if;    
            elsif (BGTI = '1') then
                if(NA = '1') then
                    SDOPC <= '0';
                    SM <= '1';                      
                elsif (GT = '1') then
                    SDOPC <= '1';
                    SM <= '1';                    
                else
                    SDOPC <= '0';
                    SM <= '1';                    
                end if; 
            elsif (BGETI = '1') then
                if(NA = '1') then
                    SDOPC <= '0';
                    SM <= '1';
                elsif (GE = '1' and NA = '0') then
                    SDOPC <= '1';
                    SM <= '1';                    
                elsif (GE = '0' and NA = '0') then
                    SDOPC <= '0';
                    SM <= '1';                      
                end if;    
            else 
                    SDOPC <= '1';
                    SM <= '1';
                    
            end if;        
        end case;
        end process;
                                                
end Behavioral;
