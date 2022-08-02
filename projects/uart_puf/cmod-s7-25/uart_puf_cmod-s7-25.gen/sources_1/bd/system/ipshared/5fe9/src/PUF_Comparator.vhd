----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 11:49:05 AM
-- Design Name: 
-- Module Name: PUF_Comparator - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PUF_Comparator is
    Port ( Counter_A : in STD_LOGIC_VECTOR (31 downto 0);
           Counter_B : in STD_LOGIC_VECTOR (31 downto 0);
           PUF_bit : out std_logic);
end PUF_Comparator;

architecture Behavioral of PUF_Comparator is

begin

PUF_bit <= '1' when ( Counter_A > Counter_B ) else '0';

end Behavioral;
