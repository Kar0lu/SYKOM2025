# Usage
- Vivado project structure should be portable (untested), so just open `Vivado.xpr` file from `Vivado` directory (if it's not portable create new project and add ZYNQ7000 PS and axil.v to block design).
- Vitis is NOT portable, so you have to create new platform project using `design_1_wrapper.xsa` from `Vivado` directory, then add C sources from `Vitis_C_src` (worning do not copy whole files just their content as Vitis has problem with files not created from it's GUI).
- Build, run and (hopefully) enjoy.