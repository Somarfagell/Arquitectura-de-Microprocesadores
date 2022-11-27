library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bloqueBanderas is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           LF : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0));
end bloqueBanderas;

architecture Behavioral of bloqueBanderas is

begin
    process(clk,clr,LF,D)
    begin
        if(clr = '1') then
            Q <= "0000";
        elsif(falling_edge(clk)) then
            if(LF = '1') then
                Q <= D;
            end if;
        end if;
    end process;

end Behavioral;
