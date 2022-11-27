library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteUnidadDeControl is 
    component UnidadDeControl is Port ( 
        funCode : in std_logic_vector (3 downto 0);
        opCode : in std_logic_vector (4 downto 0);
        RCLK: in std_logic;
        RCLR: in std_logic;
        Banderas: in std_logic_vector (3 downto 0);
        Microinst : inout std_logic_vector (19 downto 0));
    end component;
end package;

