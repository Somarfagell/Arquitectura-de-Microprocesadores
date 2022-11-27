library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.paqueteALU16BITS.all;
use work.paquetePila.all;
use work.paqueteRegistro.all;
use work.paqueteMemoriaDatos.all;
use work.paqueteMemoriaPrograma.all;

entity unidadDeMemoria is port(
    clr : in std_logic;
    clk : in std_logic; 
    SDMP : in std_logic;
    UP : in std_logic; 
    WPC : in std_logic;
    SR2 : in std_logic;
    SWD : in std_logic;
    SHE : in std_logic; 
    DIR : in std_logic;
    WR : in std_logic;
    SEXT : in std_logic;
    SOP1 : in std_logic;
    SOP2 : in std_logic; 
    SDMD : in std_logic;
    WD : in std_logic;
    DW : in std_logic;
    SR : in std_logic;
    functionCode : out std_logic_vector(3 downto 0);
    operationCode : out std_logic_vector(4 downto 0);
    aluop : in STD_LOGIC_VECTOR (3 downto 0);
    PC_o : out std_logic_vector(15 downto 0);
    readDataOut1 : out std_logic_vector(15 downto 0);
    readDataOut2 : out std_logic_vector(15 downto 0);
    instruccionOut : out std_logic_vector(24 downto 0);
    Resultado : out std_logic_vector(15 downto 0);
    
    flags : out std_logic_vector(3 downto 0)
    
);
end unidadDeMemoria;

architecture Behavioral of unidadDeMemoria is
signal a : STD_LOGIC_VECTOR (15 downto 0);
signal b : STD_LOGIC_VECTOR (15 downto 0);
signal res : STD_LOGIC_VECTOR (15 downto 0);
signal Co,N,Z,OV : STD_LOGIC; 
signal PC : STD_LOGIC_VECTOR (9 downto 0);
signal Instruccion : STD_LOGIC_VECTOR (24 downto 0);
signal dirDatos : std_logic_vector(9 downto 0);
signal dataOut : std_logic_vector(15 downto 0);
signal dataIn : std_logic_vector(15 downto 0);
signal writeReg, readReg1, readReg2, shamt : STD_LOGIC_VECTOR (3 downto 0);
signal writeData : STD_LOGIC_VECTOR (15 downto 0);
signal readData1, readData2 : STD_LOGIC_VECTOR (15 downto 0);
signal PC_in : std_logic_vector(15 downto 0);
signal PC_out : std_logic_vector(15 downto 0);
signal sextOut : STD_LOGIC_VECTOR (15 downto 0);
signal srOut,extSigno,extDir, sdmdOut : STD_LOGIC_VECTOR (15 downto 0);

begin


memProg : memoriaPrograma port map(
    PC => PC,
    Instruccion => Instruccion
);

memDat : memoriaDatos port map (
    dir => dirDatos,
    clk => clk,
    wd => WD,
    dataOut => dataOut,
    dataIn => dataIn
);


ALU : ALU16BITS port map(
    a => A,
    b => B, 
    aluop => aluop,
    res => res,
    Co => Co,
    N => N,
    Z => Z,
    OV => OV
);


reg : Registro port map(
    writeReg => writeReg, 
    readReg1 => readReg1,
    readReg2 => readReg2,
    shamt => shamt,
    writeData => writeData,
    clk => clk,
    clr => clr,
    wr => WR,
    she => SHE,
    dir => DIR,
    readData1 => readData1,
    readData2 => readData2
);

stack : Pila port map(
    clk => clk,
    clr => clr,
    wpc => WPC,
    up => UP,
    dw => DW,
    PC_in => PC_in, 
    PC_out => PC_out
);

extDir <= "0000"&Instruccion(11 downto 0);
extSigno <= Instruccion(11)&Instruccion(11)&Instruccion(11)&Instruccion(11)&Instruccion(11 downto 0);

shamt <= Instruccion(7 downto 4);
writereg <= Instruccion(19 downto 16);
readReg1 <= Instruccion(15 downto 12);
dataIn <= readData2;
functionCode <= Instruccion(3 downto 0);
operationCode <= Instruccion(24 downto 20);
--Salidas de escomips
readDataOut1 <= readData1;
readDataOut2 <= readData2;
PC_o <= PC_out;
PC <= PC_out(9 downto 0);
Resultado <= res;
instruccionOut <= Instruccion;
flags <= OV & Z & N & Co;   

process(clk,clr,SDMP,PC_in,SWD,writeData,SR2,readReg2,SOP1,A,SOP2,B,SDMD,dirDatos,SR,srOut,SEXT,sextOut,readData1,PC_out,readData2,res,dataOut,extSIgno,extDir)
    begin        
        
        
        if(SDMP = '0') then 
            PC_in <= Instruccion(15 downto 0);
        elsif(SDMP = '1') then 
            PC_in <= srOut;
        end if;        
     
        if(SWD = '0') then 
            writeData <= Instruccion(15 downto 0);
        elsif(SWD = '1') then 
            writeData <= srOut;
        end if;        
           
        if(SR2 = '0') then 
            readReg2 <= Instruccion(11 downto 8);
        elsif(SR2 = '1') then 
            readReg2 <= Instruccion(19 downto 16);
        end if;
    
        if(SOP1 = '0') then 
            A <= readData1;
        elsif(SOP1 = '1') then 
            A <= PC_out;
        end if;
    
          
        if(SOP2 = '1') then 
            B <= sextOut;
        elsif(SOP2 = '0') then 
            B <= readData2;
        end if;        
          
        if(SDMD = '0') then 
            dirDatos <= res(9 downto 0);
        elsif(SDMD = '1') then 
            dirDatos <= Instruccion(9 downto 0);
        end if;       
           
        if(SR = '0') then 
            srOut <= dataOut;
        elsif(SR = '1') then 
            srOut <= res;
        end if;        
           
        if(SEXT = '0') then 
            sextOut <= extSigno;
        elsif(SEXT = '1') then 
            sextOut <= extDir;
        end if;   
                        
    end process;
    


end Behavioral;
