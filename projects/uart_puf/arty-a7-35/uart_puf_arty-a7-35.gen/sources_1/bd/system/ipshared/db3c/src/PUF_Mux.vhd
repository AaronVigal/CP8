----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 12:16:56 PM
-- Design Name: 
-- Module Name: PUF_Mux - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PUF_Mux is
GENERIC (Sel_Size : INTEGER :=8);
    Port ( Sel : in STD_LOGIC_VECTOR (Sel_Size-1 downto 0);
           Data_in : in STD_LOGIC_VECTOR (2**Sel_Size-1 downto 0);
           Y_Out: OUT STD_LOGIC);
end PUF_Mux;

architecture Behavioral of PUF_Mux is

begin
Y_Out <= Data_in (conv_integer(Sel));
end Behavioral;
