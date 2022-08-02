library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity five_stage_ro is
    Port ( E : in STD_LOGIC;
           Os : out STD_LOGIC);
end five_stage_ro;

architecture Behavioral of five_stage_ro is
  signal r_ring_oscillator : std_logic_vector(3 downto 0) := (others => '0');

  attribute dont_touch : string;
  attribute dont_touch of r_ring_oscillator : signal is "true";
begin

  process (E)
  begin
    for index in r_ring_oscillator'low to r_ring_oscillator'high-1 loop
      r_ring_oscillator(index) <= not(r_ring_oscillator(index+1));
    end loop;
    
    r_ring_oscillator(r_ring_oscillator'high) <= not(r_ring_oscillator(r_ring_oscillator'low)) nand E;
    
    Os <= not(r_ring_oscillator(r_ring_oscillator'low));
    
  end process;

end Behavioral;
