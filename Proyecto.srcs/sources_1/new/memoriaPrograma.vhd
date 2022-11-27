library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoriaPrograma is
    Generic(
        p : integer := 10;
        d : integer := 25
    );
    Port ( PC : in STD_LOGIC_VECTOR (p-1 downto 0);
           Instruccion : out STD_LOGIC_VECTOR (d-1 downto 0));
end memoriaPrograma;

architecture Behavioral of memoriaPrograma is
type aux is array(0 to (2**p)-1) of std_logic_vector(d-1 downto 0);

constant LI : std_logic_vector (4 downto 0) := "00001";
constant LWI : std_logic_vector (4 downto 0) := "00010";
constant LW : std_logic_vector (4 downto 0) := "10111";
constant SWI : std_logic_vector (4 downto 0) := "00011";
constant SW : std_logic_vector (4 downto 0) := "00100";
--Aritmticas
constant ADDI : std_logic_vector (4 downto 0) := "00101";
constant SUBI : std_logic_vector (4 downto 0) := "00110";
--Identificador Aritmticas R
constant ADD : std_logic_vector (3 downto 0) := "0000";
constant SUB : std_logic_vector (3 downto 0) := "0001";
--Logicas
constant ANDI : std_logic_vector (4 downto 0) := "00111";
constant ORI : std_logic_vector (4 downto 0) := "01000";
constant XORI : std_logic_vector (4 downto 0) := "01001";
constant NANDI : std_logic_vector (4 downto 0) := "01010";
constant NORI : std_logic_vector (4 downto 0) := "01011";
constant XNORI : std_logic_vector (4 downto 0) := "01100";
--Identificador Logicas R
constant ANDD : std_logic_vector (3 downto 0) := "0010";
constant ORR : std_logic_vector (3 downto 0) := "0011";
constant XORR : std_logic_vector (3 downto 0) := "0100";
constant NANDD : std_logic_vector (3 downto 0) := "0101";
constant NORR : std_logic_vector (3 downto 0) := "0110";
constant XNORR : std_logic_vector (3 downto 0) := "0111";
constant NOTR : std_logic_vector (3 downto 0) := "1000";
--Identificador Corrimiento R
constant SLLR : std_logic_vector (3 downto 0) := "1001";
constant SRLR : std_logic_vector (3 downto 0) := "1010";
--Saltos Condicionales e Incondicionales
constant BEQI : std_logic_vector (4 downto 0) := "01101";
constant BNEI : std_logic_vector (4 downto 0) := "01110";
constant BLTI : std_logic_vector (4 downto 0) := "01111";
constant BLETI : std_logic_vector (4 downto 0) := "10000";
constant BGTI : std_logic_vector (4 downto 0) := "10001";
constant BGETI : std_logic_vector (4 downto 0) := "10010";
constant B : std_logic_vector (4 downto 0) := "10011";
--Manejo de Subrutinas
constant CALL : std_logic_vector (4 downto 0) := "10100";
constant RET : std_logic_vector (4 downto 0) := "10101";
--Otros
constant NOP : std_logic_vector (4 downto 0) := "10110";

constant R0 : std_logic_vector(3 downto 0) := "0000";
constant R1 : std_logic_vector(3 downto 0) := "0001";
constant R2 : std_logic_vector(3 downto 0) := "0010";
constant R3 : std_logic_vector(3 downto 0) := "0011";
constant R4 : std_logic_vector(3 downto 0) := "0100";
constant SU : std_logic_vector(3 downto 0) := "0000";
constant NO_op : std_logic_vector(4 downto 0) := "00000";
constant NO_fun : std_logic_vector(3 downto 0) := "0000";

-- NOP & SU & SU & SU & SU & SU, 
constant caja : aux := (
    LI & R0 & X"0012",
    LI & R1 & X"0003",
    BGETI & R1 & R0 & X"004",
    SWI & R2 & X"0000",
    NOP & SU & SU & SU & SU & SU,
    B & SU & X"0004",
    NO_OP & R0 & R0 & R1 & SU & SUB,
    ADDI & R2 & R2 & X"001",
    B & SU & X"0002",  
    others => (others => '0')
);
   
begin

Instruccion <= caja(conv_integer(PC));

end Behavioral;