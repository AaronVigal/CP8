----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 12:06:04 PM
-- Design Name: 
-- Module Name: PUF_Counter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PUF_Counter is
    Port ( Clk : in STD_LOGIC;
           CE : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q_Out : out STD_LOGIC_VECTOR (31 downto 0));
end PUF_Counter;

architecture Behavioral of PUF_Counter is
signal COUNT : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin
process(Clk, CLR) 
begin 
if (CLR='1') then COUNT <= (others => '0'); 
elsif (Clk'event and Clk = '1') then if (CE='1') then 
COUNT <= COUNT+1; 
end if; 
end if; 
end process; 
Q_Out <= COUNT;

end Behavioral;
