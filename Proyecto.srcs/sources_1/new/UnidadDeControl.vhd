library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.paqueteDecodificador.all;
use work.paqueteBloqueBanderas.all;
use work.paqueteBloqueCondicion.all;
use work.paqueteBloqueNivel.all;
use work.paqueteMemoriaFun.all;
use work.paqueteMemoriaOP.all;
use work.paqueteUnidadControl.all;

entity UnidadDeControl is Port ( 
    funCode : in std_logic_vector (3 downto 0);
    opCode : in std_logic_vector (4 downto 0);
    RCLK: in std_logic;
    RCLR: in std_logic;
    Banderas: in std_logic_vector (3 downto 0);
    Microinst : inout std_logic_vector (19 downto 0));
end UnidadDeControl;

architecture Behavioral of UnidadDeControl is
signal funCodeOut, opCodeOut : std_logic_vector(19 downto 0);
signal OpCodeInAux : std_logic_vector(4 downto 0);
signal TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI,EQ,NE,LT,LF,LE,GT,GE,NA,SDOPC,SM: std_logic;
signal Q : STD_LOGIC_VECTOR (3 downto 0);

begin

DecodificadorInst : Decodificador port map (
    opCode => opCode,
    TIPOR => TIPOR,
    BEQI => BEQI,
    BNEQI => BNEQI,
    BLTI => BLTI,
    BLETI => BLETI,
    BGTI => BGTI,
    BGETI => BGETI
);

BloqBanderas : BloqueBanderas port map(
    clk => RCLK,
    clr => RCLR,
    LF => MicroInst(0),
    Q => Q,
    D => Banderas
);

Condicion : BloqueCondicion port map (
    Q => Q,
    EQ => EQ,
    NE => NE,
    LT => LT, 
    LE => LE,
    GT => GT,
    GE => GE
);

Nivel : BloqueNivel port map(
    clr => RCLR, 
    clk => RCLK,
    NA => NA
);

memFuncion : memoriaFun port map(
    funCode => FunCode,
    funCodeOut => funCodeOut
);

memOperacion : memoriaOP port map(
    opCode => OpCodeInAux,
    opCodeOut => opCodeOut
);

CU : UnidadControl port map(
   clk => RCLK,
   SDOPC => SDOPC,
   SM => SM,
   NA => NA,
   clr => RCLR,
   EQ => EQ,
   NE => NE,
   LT => LT,
   LE => LE,
   GT => GT,
   GE => GE,
   TIPOR => TIPOR,
   BEQI => BEQI,
   BNEQI => BNEQI,
   BLTI => BLTI,
   BLETI => BLETI,
   BGTI => BGTI,
   BGETI => BGETI 
);

process(SDOPC,SM,opCode,opCodeOut,funCodeOut)
begin

    if(SDOPC = '1') then 
        OpCodeInAux <= opCode;
    else 
        OpCodeInAux <= "00000";
    end if;
    

    if(SM = '1') then 
        MicroInst <= opCodeOut;
    else 
        MicroInst <= funCodeOut;
    end if;
    
end process;


end Behavioral;
