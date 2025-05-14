# CORDIC
## Running testbench
- `iverilog -o ./build/cordic_top_sim ./modules/angle_normalizer.v ./modules/cordic.v ./modules/result_converter.v ./modules/cordic_top.v ./testbench/cordic_top_tb.v`
- `vvp ./build/cordic_top_sim`
- `gtkwave ./vcd/cordic_top_tb.vcd`

## Flags
- `-DDEBUG` - displays additional informations on console
- `-DBUILD` - builds module for production

# Running AXI testbench
- `iverilog -g2005-sv -o ./build/axi_cordic_sim ./modules/AXI/axil.sv ./modules/angle_normalizer.v ./modules/cordic.v ./modules/result_converter.v ./modules/cordic_top.v ./testbench/axil_tb.sv`
- `vvp ./build/axi_cordic_sim`
- `gtkwave ./vcd/axil_tb.vcd`

# Dictionary
- _float - 32-bit value in IEEE754 notation
- _fixed - value in Q notation with 9 integer and WIDTH-9 fractional bits
- sim_ - value from C simulation

# TODO
- make module pass the main test
- make sure "done" signal from result_converter actually resets angle_normalizer and cordic
- implement conversion to float in angle_normalizer and result_converter as in C simulation
- make gtkwave saved views