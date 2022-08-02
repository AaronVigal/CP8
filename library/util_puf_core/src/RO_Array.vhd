----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 09:29:48 AM
-- Design Name: 
-- Module Name: RO_Array - Behavioral
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

entity RO_Array is
    generic (RO_Width : integer := 256; ro_row : integer :=1);
    Port ( en : in STD_LOGIC_VECTOR (RO_Width-1 downto 0);
           Os : out STD_LOGIC_VECTOR (RO_Width-1 downto 0));
end RO_Array;

architecture Behavioral of RO_Array is
component five_stage_ro 
port(E: in std_logic; Os : out std_logic); 
end component; 
attribute LOC : string;

begin
GEN_RO: 
for I in 0 to RO_Width-1 generate
--sets the location
attribute LOC of ROX : label is "SLICE_X"&INTEGER'image(ro_row * 4)&"Y"& INTEGER'image(I+9);
begin 
ROX : five_stage_ro port map(en(I), Os(I)); 
end generate GEN_RO;

end Behavioral;
