----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 09:42:14 PM
-- Design Name: 
-- Module Name: PUF_Array - Behavioral
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

---puf_width: The amount of PUFs to have in parallel 
---sel_width_ar:The select width for the mux and decoders in PUF -
---en_ar: Enables the RO 
---aclr_ar: Clears counters that counts oscillations 
---cnt_en_ar: enables the counters. 
---SelA: Select an RO 
---SelB: Select another RO for comparison to the first 
---res_ar: The result of the comparisons between 2 counters. 1 if RO A> RO B



entity PUF_Array is
generic (puf_width : integer := 8; sel_width_ar : integer := 8);
    Port ( en_ar : in STD_LOGIC;
           aclr_ar : in STD_LOGIC;
           cnt_en_ar : in STD_LOGIC;
           selA : in STD_LOGIC_VECTOR (sel_width_ar-1 downto 0);
           selB : in STD_LOGIC_VECTOR (sel_width_ar-1 downto 0);
           Res_ar : out STD_LOGIC_VECTOR (puf_width-1 downto 0));
end PUF_Array;

architecture Behavioral of PUF_Array is

component PUF_Bit is
generic(Sel_Size_p : INTEGER; row : INTEGER );
PORT( en : in STD_LOGIC;
selA : in STD_LOGIC_VECTOR (Sel_Size_p-1 downto 0); 
selB : in STD_LOGIC_VECTOR (Sel_Size_p-1 downto 0); 
aclr : in STD_LOGIC; 
cnt_en : in STD_LOGIC; 
Res : out STD_LOGIC); 
end component;

begin
 
 GEN_puf: 
 for I in 0 to puf_Width-1 
 generate pufX :PUF_Bit 
 GENERIC MAP(Sel_Size_p => sel_width_ar, row =>I) 
 PORT MAP( en => en_ar, 
         selA => selA, selB => selB, 
         aclr => aclr_ar, cnt_en => cnt_en_ar, 
         Res => Res_ar(I)); 
         end generate GEN_puf;

end Behavioral;
