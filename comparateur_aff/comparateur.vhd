---___      ___ ___  ___  ________  ___
--|\  \    /  /|\  \|\  \|\   ___ \|\  \
--\ \  \  /  / | \  \\\  \ \  \_|\ \ \  \
-- \ \  \/  / / \ \   __  \ \  \ \\ \ \  \
--  \ \    / /   \ \  \ \  \ \  \_\\ \ \  \____
--   \ \__/ /     \ \__\ \__\ \_______\ \_______\
--    \|__|/       \|__|\|__|\|_______|\|_______|
-------------------------------------------------
-- Fichier comparateur.vhd
-- Antoine Blondeau
-- comparaison de 2 nombres sur 4 bits
-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity comparateur is
port
(
  a,b : in std_logic_vector(3 downto 0);
  agtb, aeqb, altb : out std_logic
);
end comparateur;
architecture beh of comparateur is
begin
  altb <= '1' when a<b else '0';
  aeqb <= '1' when a=b else '0';
  agtb <= '1' when a>b else '0';
end beh;
