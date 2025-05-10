# Usefull commands
    - iverilog -o .\build\cordic_top_sim .\modules\angle_normalizer.v .\modules\cordic.v .\modules\result_converter.v .\modules\cordic_top.v .\testbench\cordic_top_tb.v
    - vvp .\build\cordic_top_sim
    - gtkwave .\vcd\cordic_top_tb.vcd

# TODO
- make sure "done" signal from result_converter actually resets angle_normalizer and cordic
- make testbench check if sytem behave as mentioned in messenger conv

- implement conversion to ieee754 in result_converter
- adjust testbench to work with data taken from low_level C simulation

- extend model to work with 32bit and 64bit values
- make gtkwave saved views