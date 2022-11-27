----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2021 20:52:44
-- Design Name: 
-- Module Name: paqueteALU1BIT - Behavioral
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

package paqueteALU1BIT is 
    component ALU1BIT is Port ( 
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           aInvert : in STD_LOGIC;
           bInvert : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC;
           cout : out STD_LOGIC);
    end component;
end package;
