---___      ___ ___  ___  ________  ___
--|\  \    /  /|\  \|\  \|\   ___ \|\  \
--\ \  \  /  / | \  \\\  \ \  \_|\ \ \  \
-- \ \  \/  / / \ \   __  \ \  \ \\ \ \  \
--  \ \    / /   \ \  \ \  \ \  \_\\ \ \  \____
--   \ \__/ /     \ \__\ \__\ \_______\ \_______\
--    \|__|/       \|__|\|__|\|_______|\|_______|
-------------------------------------------------
-- Fichier comparateur_aff.vhd
-- Antoine Blondeau
-- Top-level
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity comparateur_aff is
  port
  (
    A: in std_logic_vector( 3 downto 0 );
    B: in std_logic_vector( 3 downto 0 );
    HEX2: out std_logic_vector( 6 downto 0 );
    HEX1: out std_logic_vector( 6 downto 0 );
    HEX0: out std_logic_vector( 6 downto 0 );
    LEDR2: out std_logic;
    LEDR1: out std_logic;
    LEDR0: out std_logic
  );
end comparateur_aff;

architecture struct of comparateur_aff is

  signal s_agtb, s_aeqb,s_altb: std_logic;


  component comparateur is
    port
    (
      A,B : in std_logic_vector(3 downto 0);
      agtb, aeqb, altb : out std_logic
    );
  end component;
  component trans_hexa_7seg is
    port
    (
      code_e: in std_logic_vector( 3 downto 0 );
      code_s: out std_logic_vector( 6 downto 0 )
    );
  end component;

  begin
    COMP1: comparateur port map
    (
      A=>A, -- A du Top-level => A du composant
      B=>B,
      agtb=>s_agtb,
      aeqb=>s_aeqb,
      altb=>s_altb
    );
    TRANS1: trans_hexa_7seg port map
    (
      code_e => A,
      code_s => HEX2
    );
    TRANS2: trans_hexa_7seg port map
    (
      code_e => B,
      code_s => HEX0
    );
    LEDR2 <= s_agtb;
    LEDR1 <= s_aeqb;
    LEDR0 <= s_altb;

    HEX1 <= "1111110" when s_agtb='1'
      else  "0110111" when s_aeqb='1'
      else  "1110111" when s_altb='1';

end struct;
