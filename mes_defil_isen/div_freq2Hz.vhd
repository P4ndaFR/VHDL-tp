---___      ___ ___  ___  ________  ___
--|\  \    /  /|\  \|\  \|\   ___ \|\  \
--\ \  \  /  / | \  \\\  \ \  \_|\ \ \  \
-- \ \  \/  / / \ \   __  \ \  \ \\ \ \  \
--  \ \    / /   \ \  \ \  \ \  \_\\ \ \  \____
--   \ \__/ /     \ \__\ \__\ \_______\ \_______\
--    \|__|/       \|__|\|__|\|_______|\|_______|
-------------------------------------------------
-- Fichier div_freq2Hz.vhd
-- Antoine Blondeau
-- Diviseur de fréquence de 50Mhz -> 2Hz
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity div_freq2Hz is
  port
  (
    CLOCK_50: in std_logic;
    RST: in std_logic;
    clk2Hz: out std_logic
  );
end div_freq2Hz;
architecture beh of div_freq2Hz is

  constant MAX: natural range 0 to 12499999:=12499999; -- Valeur à diviser / 2
  signal s_cpt: natural range 0 to MAX;
  signal s_clkout: std_logic;

begin --beh

  PDIV : process (CLOCK_50, RST)
  begin -- process PDIV1
    if RST = '0' then s_cpt <= 0; -- reset asynchrone
                      s_clkout <='0';
    elsif rising_edge(CLOCK_50) then --rising clock edge
      if s_cpt = MAX then
                        s_cpt  <= 0;
                        s_clkout <= not s_clkout;
                     else
                        s_cpt <= s_cpt + 1;
                        s_clkout <= s_clkout;
      end if;
    end if;
  end process PDIV;

    clk2Hz <= s_clkout; --mis à jour des signaux au end process

end beh;
