# LearningExercise11
# Counter to 39 — Verilog FPGA Design

## Assignment Overview
This project uses a digital counter in Verilog that counts from 0 up to 39 using counter modules developed in Vivado.

## Files
- counter_fsm.v — Main counter module
- counter__fsm_tb.v — Testbench for simulation

## How It Works
The counter has a terminal input so that it will go back to zero when it reaches a certain number. The testbench instantiates the main counter module twice. Once for the ones place, and once for the tens place. The tens place is set so that it will only count when the ones place reaches 9 and loops back to zero. 

