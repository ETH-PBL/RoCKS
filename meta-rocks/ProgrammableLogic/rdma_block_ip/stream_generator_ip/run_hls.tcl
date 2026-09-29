
open_project stream_generator_prj

open_solution "solution1"
set_part xck26-sfvc784-2LV-c

create_clock -period 10 -name default
set_clock_uncertainty 25% default

set_top stream_generator

add_files example.cpp -cflags "-I."


csynth_design

export_design -format ip_catalog -output "./ip_out" -display_name "Stream Generator" -vendor "xilinx.com" -version "1.0"

exit

