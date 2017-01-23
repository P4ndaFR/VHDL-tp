vsim -t ns work.trans_hexa_7seg
# vsim -t ns work.trans_hexa_7seg
# Loading std.standard
# Loading ieee.std_logic_1164(body)
# Loading work.trans_hexa_7seg(beh)
add wave sim:/trans_hexa_7seg/*
force -deposit sim:/trans_hexa_7seg/code_e 0000 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 0001 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 0010 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 0011 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 0100 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 0101 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 0110 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 0111 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 1000 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 1001 0
run 100ns
force -deposit sim:/trans_hexa_7seg/code_e 1010 0
run 100ns
