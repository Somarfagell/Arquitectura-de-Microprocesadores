library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Rapido is
--  Port ( );
end TB_Rapido;

architecture Behavioral of TB_Rapido is
component SumRapido is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);  
           cin : in STD_LOGIC;      
           cout : out STD_LOGIC);
end component;

signal a : STD_LOGIC_VECTOR (7 downto 0);
signal b : STD_LOGIC_VECTOR (7 downto 0);
signal s : STD_LOGIC_VECTOR (7 downto 0);
signal cin : STD_LOGIC;
signal cout : STD_LOGIC;

begin

sumador : SumRapido port map(
      a => a,
      b => b,
      s => s,     
      cin => cin, 
      cout => cout
);

process
begin
    a <= "00010111";   --23+87
    b <= "01010111";
    cin <= '0';
    wait for 20ms;
    a <= "00011010";   --26+95
    b <= "01011111";
    cin <= '0';
    wait for 20ms;
    a <= "00101001";   --41+98
    b <= "01100010";
    cin <= '0';
    wait for 20ms;
    a <= "10111010";   --186+36
    b <= "00100100";
    cin <= '0';
    wait for 20ms;
    a <= "00111111";   --63+98
    b <= "01100010";
    cin <= '0';
    wait for 20ms;
    a <= "00111100";   --60+15
    b <= "00001111";
    cin <= '0';
    wait for 20ms;
    a <= "01111000";   --120+48
    b <= "00110000";
    cin <= '0';
    wait for 20ms;
    a <= "00001011";   --11+8
    b <= "00001000";
    cin <= '0';
    wait for 20ms;
    a <= "00000001";   --1+4
    b <= "00000100";
    cin <= '0';
    wait for 20ms;
    wait;

end process;


end Behavioral;
