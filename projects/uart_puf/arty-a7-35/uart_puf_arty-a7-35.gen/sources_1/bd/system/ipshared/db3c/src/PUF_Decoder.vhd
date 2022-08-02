----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 11:24:52 AM
-- Design Name: 
-- Module Name: PUF_Decoder - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

------Decoder is used to activate specific RO for PUF

entity PUF_Decoder is
generic (Sel_Width : integer := 8);
    Port ( E : in STD_LOGIC;
           inA : in STD_LOGIC_VECTOR (Sel_Width-1 downto 0);
           inB : in STD_LOGIC_VECTOR (Sel_Width-1 downto 0);
           Output: out STD_LOGIC_VECTOR (2**Sel_Width-1 downto 0));
end PUF_Decoder;

architecture Behavioral of PUF_Decoder is

begin
process(inA, inB, E)
 begin 
 ---Set output bits to 0 to deavtivate all RO 
 Output <= (others => '0'); -- default 
 ---activate RO corrspoending to inA 
 Output(to_integer(unsigned(inA))) <= E; 
 ---activate RO corresponding to inB 
 output(to_integer(unsigned(inB))) <= E; 
 end process;

end Behavioral;
