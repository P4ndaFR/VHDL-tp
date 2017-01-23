vsim -t ns work.comparateur_aff
# vsim -t ns work.comparateur_aff
add wave sim:/comparateur_aff/*
force -deposit sim:/comparateur_aff/a 1000 0
force -deposit sim:/comparateur_aff/b 0001 0
run 100ns
force -deposit sim:/comparateur_aff/a 0101 0
force -deposit sim:/comparateur_aff/b 0101 0
run 100ns
force -deposit sim:/comparateur_aff/a 0011 0
force -deposit sim:/comparateur_aff/b 1001 0
run 100ns
