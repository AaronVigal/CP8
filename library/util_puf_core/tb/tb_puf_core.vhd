--------------------------------------------------------------------------------
-- @file    tb_puf_core.vhd
-- @date    2022.04.21
-- @author  Jay Convertino
-- @brief   PUF core
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--for the log2
use IEEE.math_real.all;

entity tb_puf_core is
end tb_puf_core;

architecture arch_tb of tb_puf_core is
  constant CLK_FREQ   : real := 100000000.0;
  constant CLK_PERIOD : time := 1 sec / CLK_FREQ;
  constant RST_PERIOD : time := 100 ns;
  constant c_IN_BITS  : integer := 128;
  constant c_PUF_WIDTH: integer := 8;
  constant c_RO_SEL   : integer := 8;
  
  signal tb_clk     : std_logic := '0';
  signal tb_rst     : std_logic := '1';
  
  signal tb_w       : std_logic := '0';
  signal tb_selA    : std_logic_vector(c_PUF_WIDTH-1 downto 0);
  signal tb_selB    : std_logic_vector(c_PUF_WIDTH-1 downto 0);
  signal tb_res_ar  : std_logic_vector(c_PUF_WIDTH-1 downto 0);
  signal tb_valid   : std_logic;
  
  signal counter    : unsigned(c_PUF_WIDTH-1 downto 0) := (others => '0');
begin

  PUF1 : entity work.PUF_Main
  generic map ( 
                delay_clk     => 125000,
                ro_PUF_width  => c_PUF_WIDTH, 
                RO_sel        => c_RO_SEL
              )
  port map    ( 
                clock         => tb_clk,
                w             => tb_w,
                reset         => tb_rst,
                selA          => tb_selA,
                selB          => tb_selB,
                res_ar        => tb_res_ar,
                valid         => tb_valid
           );
  
  tb_clk   <= not tb_clk after CLK_PERIOD/2;
  tb_rst   <= '0' after RST_PERIOD;
  
  stim_process : process(tb_clk)
  begin
    if(rising_edge(tb_clk)) then
      tb_w <= '1';
      
      tb_selA <= std_logic_vector(counter);
      tb_selB <= not(std_logic_vector(counter));
    
      if(tb_valid = '1') then
        tb_w <= '0';
        counter <= counter + 1;
      end if;
    end if;
  end process;
end arch_tb;
