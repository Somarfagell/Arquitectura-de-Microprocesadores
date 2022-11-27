library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ESCOMIPS is
--  Port ( );
end TB_ESCOMIPS;

architecture Behavioral of TB_ESCOMIPS is
    component ESCOMIPS is Port ( 
        RCLK : in std_logic;
        RCLR : in std_logic;
        MicroInstruccion : inout std_logic_vector(19 downto 0);
        PC : out std_logic_vector(15 downto 0);
        ReadData1 : out std_logic_vector(15 downto 0);
        ReadData2 : out std_logic_vector(15 downto 0);
        Instruccion : out std_logic_vector(24 downto 0);
        Resultado : out std_logic_vector(15 downto 0)
        );
    end component;
    
signal RCLK : std_logic;
signal RCLR : std_logic;
signal MicroInstruccion : std_logic_vector(19 downto 0);
signal PC : std_logic_vector(15 downto 0);
signal ReadData1 : std_logic_vector(15 downto 0);
signal ReadData2 : std_logic_vector(15 downto 0);
signal Instruccion : std_logic_vector(24 downto 0);
signal Resultado : std_logic_vector(15 downto 0);
begin

CLK_PROCESS : process
begin
    RCLK <= '1';
    wait for 10ns;
    RCLK <= '0';
    wait for 10ns;
end process;


ESCOM : ESCOMIPS port map(
    RCLK => RCLK,
    RCLR => RCLR,
    MicroInstruccion => MicroInstruccion, 
    PC => PC,
    ReadData1 => ReadData1,
    ReadData2 => ReadData2,
    Instruccion => Instruccion,
    Resultado => Resultado
);

process
begin
    
    
    RCLR <=  '1';
    wait for 20ns;
    RCLR <= '0';

    wait;
end process;


end Behavioral;
