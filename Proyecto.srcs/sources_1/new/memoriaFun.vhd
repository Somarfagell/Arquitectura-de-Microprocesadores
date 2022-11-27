library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoriaFun is
    Port ( funCode : in STD_LOGIC_VECTOR (3 downto 0);
           funCodeOut : out STD_LOGIC_VECTOR (19 downto 0));
end memoriaFun;

architecture Behavioral of memoriaFun is
type mem is array(0 to 15) of std_logic_vector(19 downto 0);
constant op : mem := (
    "00000100010000110011",
    "00000100010001110011",
    "00000100010000000011",
    "00000100010000010011",
    "00000100010000100011",
    "00000100010011010011",
    "00000100010011000011",
    "00000100010001000011",
    "00000100010011010011",
    "00001101110000000010",
    "00001101010000000010",
    others => (others => '0')
);

begin
    funCodeOut <= op(conv_integer(funCode));

end Behavioral;
