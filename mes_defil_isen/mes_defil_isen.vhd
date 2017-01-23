---___      ___ ___  ___  ________  ___
--|\  \    /  /|\  \|\  \|\   ___ \|\  \
--\ \  \  /  / | \  \\\  \ \  \_|\ \ \  \
-- \ \  \/  / / \ \   __  \ \  \ \\ \ \  \
--  \ \    / /   \ \  \ \  \ \  \_\\ \ \  \____
--   \ \__/ /     \ \__\ \__\ \_______\ \_______\
--    \|__|/       \|__|\|__|\|_______|\|_______|
-------------------------------------------------
-- Fichier mes_defil_isen.vhd
-- Antoine Blondeau
-- top-level message défilant
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mes_defil_isen is
  port
  (
    sensG, sensD,rst,CLOCK_50: in std_logic;
    HEX2,HEX3,HEX1,HEX0: out std_logic_vector(6 downto 0)
  );
end mes_defil_isen;
architecture struct of mes_defil_isen is
  signal s_clk2Hz: std_logic;
  component div_freq2Hz is
    port
    (
      CLOCK_50: in std_logic;
      RST: in std_logic;
      clk2Hz: out std_logic
    );
    end component;
  component fsm_isen
  port
  (
    sensG, sensD,rst,clk2Hz: in std_logic;
    aff3,aff2,aff1,aff0: out std_logic_vector(6 downto 0)
  );
  end component;
begin
  DIV: div_freq2Hz port map
  (
    CLOCK_50 => CLOCK_50;
    rst => RST;
    clk2Hz => s_clk2Hz
  )
  FSM: fsm_isen port map
  (
    sensG => sensG;
    sensD => sensD;
    rst => RST;
    s_clk2Hz => clk2Hz
  )
end struct;
