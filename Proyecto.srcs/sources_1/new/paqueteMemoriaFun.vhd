----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2021 23:47:37
-- Design Name: 
-- Module Name: paqueteMemoriaFun - Behavioral
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

package paqueteMemoriaFun is 
    component memoriaFun is Port ( 
        funCode : in STD_LOGIC_VECTOR (3 downto 0);
        funCodeOut : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
end package;


