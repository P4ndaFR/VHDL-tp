vsim -t ns work.comparateur
# vsim work.comparateur
# Loading std.standard
# Loading ieee.std_logic_1164(body)
# Loading work.comparateur(beh)
add wave sim:/comparateur/*
force -deposit sim:/comparateur/a 0101 0
force -deposit sim:/comparateur/b 0010 0
run 100 ns
force -deposit sim:/comparateur/b 0101 0
run 100 ns
force -deposit sim:/comparateur/b 1000 0
run 100 ns
