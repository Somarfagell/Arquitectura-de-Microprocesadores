----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2021 20:56:52
-- Design Name: 
-- Module Name: paqueteRegistro - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteRegistro is 
    component Registro is Port(
        writeReg, readReg1, readReg2, shamt : in STD_LOGIC_VECTOR (3 downto 0);
        writeData : in STD_LOGIC_VECTOR (15 downto 0);
        clk, clr, wr, she, dir : in STD_LOGIC;
        readData1, readData2 : out STD_LOGIC_VECTOR (15 downto 0)
        );
   end component;
end package;