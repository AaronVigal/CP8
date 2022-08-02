----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2020 09:44:59 AM
-- Design Name: 
-- Module Name: util_puf_core - Behavioral
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

---delay_clk: The amount of clock cycles to allow enable to be on. 
---ro_PUF_width:The amount of PUFs to have in parallel 
---RO_sel: The width of the selector for PUF mux and decoder 
---clock:Clock for the state machine 
---w:Allows the state machine to leave the start state on high. 
---reset: resets the state machine back to start state 
---selA: Select an RO 
---selB: Select another RO for comparison to the first 
---res_ar: The result of each PUF.

entity util_puf_core is
generic ( delay_clk : integer := 125000; ro_PUF_width : integer := 8; RO_sel : integer := 8);
    Port ( clock : in STD_LOGIC;
           w : in STD_LOGIC;
           reset : in STD_LOGIC;
           selA, selB : in STD_LOGIC_VECTOR (ro_PUF_width-1 downto 0);
           res_ar : out STD_LOGIC_VECTOR (ro_PUF_width-1 downto 0);
           valid : out STD_LOGIC);
end util_puf_core;

architecture Behavioral of util_puf_core is

component ila_0 IS
PORT (
clk : IN STD_LOGIC;


probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END component;


component PUF_Machine is 
generic (delay : integer := 125000); 
port ( clock, w, reset : in std_logic; 
      en,a_clr,cnt_en_ar,valid : out std_logic); 
end component;

component PUF_Array is 
generic (puf_width : integer := 8; sel_width_ar : integer := 8);
port( en_ar, aclr_ar, cnt_en_ar: in std_logic; 
      selA : IN STD_LOGIC_VECTOR(sel_width_ar - 1 DOWNTO 0); 
      selB : IN STD_LOGIC_VECTOR(sel_width_ar - 1 DOWNTO 0); 
      Res_ar: out STD_LOGIC_VECTOR(puf_width - 1 DOWNTO 0)); 
end component; 

signal m_en, m_clr, m_cnt_en : std_logic;
begin
        
state_mac :PUF_Machine generic map (delay => delay_clk) 
           port map (clock => clock, w => w, reset => reset, 
           en=>m_en, a_clr=>m_clr, cnt_en_ar=>m_cnt_en, valid=>valid );
           
puf_ar :PUF_Array generic map (puf_width => ro_PUF_width, sel_width_ar=>RO_sel)
        port map(en_ar=>m_en, aclr_ar=>m_clr, cnt_en_ar=>m_cnt_en, selA=>selA, selB=>selB, Res_ar=>res_ar );
        
end Behavioral;
