---___      ___ ___  ___  ________  ___
--|\  \    /  /|\  \|\  \|\   ___ \|\  \
--\ \  \  /  / | \  \\\  \ \  \_|\ \ \  \
-- \ \  \/  / / \ \   __  \ \  \ \\ \ \  \
--  \ \    / /   \ \  \ \  \ \  \_\\ \ \  \____
--   \ \__/ /     \ \__\ \__\ \_______\ \_______\
--    \|__|/       \|__|\|__|\|_______|\|_______|
-------------------------------------------------
-- Fichier fsm_isen.vhd
-- Antoine Blondeau
-- Machine d'état pour le défilement
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity fsm_isen is
  port
    (
      sensG, sensD,rst,clk2Hz: in std_logic;
      aff3,aff2,aff1,aff0: out std_logic_vector(6 downto 0)
    );
end fsm_isen;
architecture beh of fsm_isen is


  type etat is(ISEn,SEnI,EnIS,nISE);
  signal EP : etat;
  constant I: std_logic_vector(6 downto 0):="1001111";
  constant S: std_logic_vector(6 downto 0):="0010010";
  constant E: std_logic_vector(6 downto 0):="0000110";
  constant n: std_logic_vector(6 downto 0):="0101011";
  constant black: std_logic_vector(6 downto 0):="1111111";

  begin
    P1: process(clk2Hz,rst) --Process séquentiel de la Machine de Moore
    begin
      if rst = '0' then EP <= ISEn;
      elsif rising_edge(clk2Hz) then
        case EP is
          when ISEn => if sensG='1' then EP <= SEnI;
                        elsif sensD='1' then EP <= nISE;
                        else EP <= ISEn;
                       end if;
          when SEnI => if sensG='1' then EP <= EnIS;
                        elsif sensD='1' then EP <= ISEn;
                        else EP <= SEnI;
                       end if;
          when EnIS => if sensG='1' then EP <= nISE;
                        elsif sensD='1' then EP <= SEnI;
                        else EP <= EnIS;
                       end if;
          when nISE => if sensG='1' then EP <= ISEn;
                        elsif sensD='1' then EP <= EnIS;
                        else EP <= nISE;
                       end if;
          when others => EP <= ISEn;
        end case;
      end if;
    end process P1;
    P2: process(EP)
    begin
      case EP is
        when ISEn => aff3 <= I;
                     aff2 <= S;
                     aff1 <= E;
                     aff0 <= n;
        when SEnI => aff3 <= S;
                     aff2 <= E;
                     aff1 <= n;
                     aff0 <= I;
        when EnIS => aff3 <= E;
                     aff2 <= n;
                     aff1 <= I;
                     aff0 <= S;
        when nISE => aff3 <= n;
                     aff2 <= I;
                     aff1 <= S;
                     aff0 <= E;
        when others => aff3 <= I;
                       aff2 <= S;
                       aff1 <= E;
                       aff0 <= n;
      end case;
    end process P2;

end beh;
