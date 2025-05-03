# Notes before commit
- I'm going insane
- python file is made to generate input_degrees.txt
- commands to build and simulate project:
    - iverilog -o .\build\cordic_top_sim .\modules\angle_normalizer.v .\modules\cordic.v .\modules\cordic_top.v .\modules\result_converter.v .\testbench\cordic_top_tb.v
    - vvp .\build\angle_normalizer_sim 
    - gtkwave .\vcd\cordic_top_tb.vcd
- current problem is that control system didn't predict that continous "start" state is not a good idea and communication between components has to be fixed
- cordic module doesn't know when to stop iterations, ebcause it's always ready