#!/bin/bash

# Create work directory if it doesn't exist
mkdir -p work
cd work

# Clean up any existing files
rm -f *.cf *.vcd *.o

# Analysis (compilation) phase
echo "Compiling VHDL files..."
ghdl -a --workdir=. ../src/CustomALU_Pkg.vhd
ghdl -a --workdir=. ../src/ALU.vhd
ghdl -a --workdir=. ../src/InstrMem.vhd
ghdl -a --workdir=. ../src/DataMem.vhd
ghdl -a --workdir=. ../src/Processor.vhd
ghdl -a --workdir=. ../src/Top.vhd
ghdl -a --workdir=. ../tb/Processor_tb.vhd
ghdl -a --workdir=. ../tb/Top_tb.vhd

# Elaborate phase
echo "Elaborating testbenches..."
ghdl -e --workdir=. Processor_tb
ghdl -e --workdir=. Top_tb

# Run simulation and generate VCD file for Processor testbench
echo "Running Processor simulation..."
ghdl -r --workdir=. Processor_tb --vcd=processor_tb.vcd --stop-time=200ns

# Run simulation and generate VCD file for Top testbench
echo "Running Top simulation..."
ghdl -r --workdir=. Top_tb --vcd=top_tb.vcd --stop-time=500ns

echo "Simulation complete. VCD files generated."
echo "To view waveforms, run:"
echo "gtkwave work/processor_tb.vcd"
echo "gtkwave work/top_tb.vcd"

cd ..