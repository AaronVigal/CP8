----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2020 12:43:14 PM
-- Design Name: 
-- Module Name: PUF_Bit - Behavioral
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
---Sel_size_p: The width of the selector for mux and decoder 
---row:used by upper level entity to assign this PUF a row number -------to allow for easier attribution of location to each RO on FPGA 
---en: Enables the RO 
---SelA: Select an RO -
--SelB: Select another RO for comparison to the first 
---aclr: Clears counter that counts oscillations 
---cnt_en: enables the counter. 
---Res: The result of the comparisons between 2 counters. 1 if RO A> RO B


entity PUF_Bit is
GENERIC (Sel_Size_p : INTEGER :=8; row : INTEGER :=1);
    Port ( en : in STD_LOGIC;
           selA : in STD_LOGIC_VECTOR (Sel_Size_p-1 downto 0);
           selB : in STD_LOGIC_VECTOR (Sel_Size_p-1 downto 0);
           aclr : in STD_LOGIC;
           cnt_en : in STD_LOGIC;
           Res : out STD_LOGIC);
end PUF_Bit;

architecture Behavioral of PUF_Bit is

component PUF_Counter is 
port ( Clk : in STD_LOGIC; CE : in STD_LOGIC; 
CLR : in STD_LOGIC; Q_Out : out STD_LOGIC_VECTOR(31 downto 0) ); 
end component;

component PUF_Mux is 
generic (Sel_Size : INTEGER :=8);
Port (Sel : in STD_LOGIC_Vector(Sel_Size-1 downto 0); 
Data_in : in STD_LOGIC_Vector(2**Sel_Size-1 downto 0);
 Y_out: out STD_LOGIC); 
end component;

component PUF_Decoder is 
generic (Sel_Width : integer := 8); 
port( E: in std_logic; 
inA, inB: in std_logic_vector(Sel_Width-1 downto 0); 
 Output: out std_logic_vector(2**Sel_Width-1 downto 0)); 
end component;

component RO_Array is 
generic (RO_Width : integer := 64; ro_row: integer :=1 ); 
port( En: in std_logic_vector(RO_Width-1 downto 0); 
 Os: out std_logic_vector(RO_Width-1 downto 0)); 
end component;

component PUF_Comparator is 
port( Counter_A, Counter_B : in std_logic_vector(31 downto 0); 
PUF_bit : out std_logic ); 
end component;

signal decout : std_logic_vector(2**Sel_size_p-1 downto 0); 
signal RO_out : std_logic_vector(2**Sel_size_p-1 downto 0); 
signal cntA, cntB : std_logic_vector(31 downto 0); 
signal muxa,muxb : std_logic;

begin

 Dec: PUF_Decoder
      GENERIC MAP(Sel_Width => Sel_size_p)
      PORT MAP (E => en, 
           inA=>selA, inB=>selB, 
           Output=>decout);
           
 Ro_Ar: RO_Array GENERIC MAP(RO_Width => 2**Sel_size_p, ro_row=>row) 
        PORT MAP(En=>decout, Os=>RO_out);
           
           
 Mux_a: PUF_Mux 
        GENERIC MAP(sel_size => Sel_size_p) 
        PORT MAP(sel=>selA, Data_in=>RO_out, Y_Out=>muxa);

 Mux_b: PUF_Mux 
        GENERIC MAP(sel_size => Sel_size_p) 
        PORT MAP(sel=>selB, Data_in=>RO_out, Y_Out=>muxb);
           
 CountA: PUF_Counter 
        PORT MAP( Clk=>muxa, CE=>cnt_en, CLR=>aclr, Q_Out=>cntA);
        
 CountB: PUF_Counter 
         PORT MAP( Clk=>muxb, CE=>cnt_en, CLR=>aclr, Q_Out=>cntB);          
  
  Comp: PUF_Comparator 
        PORT MAP( Counter_A=>cntA, Counter_B=>cntB, PUF_bit=>Res);
                      
end Behavioral;
