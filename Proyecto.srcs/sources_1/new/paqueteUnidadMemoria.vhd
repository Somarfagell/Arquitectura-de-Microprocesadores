
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteUnidadMemoria is 
    component unidadDeMemoria is port(
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
    end component;
end package;
