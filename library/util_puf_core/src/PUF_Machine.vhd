----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2020 08:50:10 AM
-- Design Name: 
-- Module Name: PUF_Machine - Behavioral
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

---delay: The amount of clock cycles to leave the RO enabled for. -
--clock: a clock for this state machine 
---w: Allows the state machine to leave the start state when high 
---reset:resets the state machine to the start state 
---en:output that enable RO ---
--a_clr:output that clears PUF counters 
---cnt_en_ar:output that enables PUF counters to increment

entity PUF_Machine is
generic (delay : integer := 100);
    Port ( clock : in STD_LOGIC;
           w : in STD_LOGIC;
           reset : in STD_LOGIC;
           en : out STD_LOGIC;
           a_clr : out STD_LOGIC;
           cnt_en_ar : out STD_LOGIC;
           valid : out STD_LOGIC);
end PUF_Machine;

architecture Behavioral of PUF_Machine is

TYPE State_type IS (start, clear, enable, disable); 
SIGNAL current_state, next_state : State_type :=start; 
SIGNAL counter : integer range 0 to delay-1 := 0; 
SIGNAL cnt_reset, cnt_en : std_logic;

begin

PROCESS (w, current_state, counter) -- state table 
begin
case current_state IS 
    WHEN start => --wait here for w input of 1 
      if (w = '0') then
        next_state <= start;
        valid <= '0';
      elsif(w = '1') then
        next_state <= clear; 
      end if;
    
    WHEN clear => --clear the counters in the RO PUF 
      next_state <= enable;
      valid <= '0';
    WHEN enable => --This is a delay state to allow PUF to count 
      if (counter = delay-1) then
        next_state <= disable;
        valid <= '1';
      else
        next_state <= enable;
        valid <= '0';
      end if;
    
    WHEN disable => --disable PUF and wait for w input to be 0 
      if (w = '1') then
        next_state <= disable;
        valid <= '1';
      elsif(w = '0') then
        next_state <= start;
        valid <= '0';
      end if;
end case; 
end process; -- state table

Process (clock, reset) -- state flip-flops 
begin 
if (reset='1') then 
current_state<=start; 
elsif (rising_edge(clock)) then 
current_state<=next_state; 
end if; 
end process;

Process (clock, cnt_reset, cnt_en, counter) -- state flip-flops 
begin
if (cnt_reset='1') then 
counter <= 0; 
elsif (rising_edge(clock) and cnt_en = '1' and counter /= delay-1) then 
counter <= counter + 1; 
end if; 
end process;

Process (current_state) -- assign output values 
begin 
case current_state IS 
   WHEN start => 
        en<='0'; 
        a_clr<='0'; 
        cnt_en_ar<='0'; 
        cnt_reset<='1'; 
        cnt_en<='0';
         
   WHEN clear => --set clear up 
        en<='0'; 
        a_clr<='1';
        cnt_en_ar<='0'; 
        cnt_reset<='1'; 
        cnt_en<='0';
        
   WHEN enable => --set enable up; reset clear down 
         en<='1'; 
         a_clr<='0'; 
         cnt_en_ar<='1'; 
         cnt_reset<='0'; 
         cnt_en<='1';
         
   WHEN disable => --disable en 
        en<='0'; 
        a_clr<='0'; 
        cnt_en_ar<='0'; 
        cnt_reset<='0'; 
        cnt_en<='0';
        
end case; 
end Process;
  
end Behavioral;
