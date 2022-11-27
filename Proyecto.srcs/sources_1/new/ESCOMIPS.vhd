library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;


use work.paqueteUnidadDeControl.all;
use work.paqueteUnidadMemoria.all;

entity ESCOMIPS is Port ( 
    RCLK : in std_logic;
    RCLR : in std_logic;
    MicroInstruccion : inout std_logic_vector(19 downto 0);
    PC : out std_logic_vector(15 downto 0);
    ReadData1 : out std_logic_vector(15 downto 0);
    ReadData2 : out std_logic_vector(15 downto 0);
    Instruccion : out std_logic_vector(24 downto 0);
    Resultado : out std_logic_vector(15 downto 0)
    );
end ESCOMIPS;

architecture Behavioral of ESCOMIPS is
signal micro : std_logic_vector(19 downto 0);
signal banderas : std_logic_vector(3 downto 0); 
signal funCode: std_logic_vector(3 downto 0);
signal opCode: std_logic_vector(4 downto 0);
begin

Control : UnidadDeControl port map(
    funCode => funCode,
    opCode => opCode, 
    RCLK => RCLK,
    RCLR => RCLR,
    Banderas => Banderas,
    Microinst => MicroInstruccion
);

Memoria : UnidadDeMemoria port map (
    clr => RCLR,
    clk  => RCLK,
    SDMP => MicroInstruccion(16),
    UP  => MicroInstruccion(19),
    WPC => MicroInstruccion(17),
    SR2 => MicroInstruccion(15),
    SWD => MicroInstruccion(14),
    SHE  => MicroInstruccion(12),
    DIR => MicroInstruccion(11),
    WR => MicroInstruccion(10),
    SEXT => MicroInstruccion(13),
    SOP1 => MicroInstruccion(9),
    SOP2 => MicroInstruccion(8),
    SDMD => MicroInstruccion(3),
    WD => MicroInstruccion(2),
    DW => MicroInstruccion(18),
    SR => MicroInstruccion(1),
    functionCode => funcode,
    operationCode => opCode,  
    aluop => MicroInstruccion(7 downto 4),
    PC_o => PC,
    readDataOut1 => readData1,
    readDataOut2 => readData2,
    instruccionOut => Instruccion,
    Resultado => Resultado,
    flags => banderas
);

end Behavioral;
