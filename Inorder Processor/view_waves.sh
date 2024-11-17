#!/bin/bash

# View processor testbench waveform
echo "Opening Processor testbench waveform..."
gtkwave -A work/processor_tb.vcd processor_wave.gtkw &

# Wait a bit before opening the second window
sleep 1

# View top testbench waveform
echo "Opening Top testbench waveform..."
gtkwave -A work/top_tb.vcd top_wave.gtkw &