
-- Copyright (C) 2002 Morgan Kaufmann Publishers, Inc

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

entity tb_counter is

end entity tb_counter;


----------------------------------------------------------------


architecture test_behavior of tb_counter is

  signal clk, reset : bit := '0';
  signal count : natural;

begin

  dut : entity work.counter(behavior)
    port map ( clk => clk, reset => reset, count => count );

  stimulus : process is
  begin

    for cycle_count in 1 to 5 loop
      wait for 20 ns;
      clk <= '1', '0' after 10 ns;
    end loop;

    reset <= '1' after 15 ns;
    for cycle_count in 1 to 5 loop
      wait for 20 ns;
      clk <= '1', '0' after 10 ns;
    end loop;

    reset <= '0' after 15 ns;
    for cycle_count in 1 to 30 loop
      wait for 20 ns;
      clk <= '1', '0' after 10 ns;
    end loop;

    wait;
  end process stimulus;

end architecture test_behavior;
