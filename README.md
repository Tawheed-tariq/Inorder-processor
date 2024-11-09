# How to Install GHDL and run simulation in linux

**This installation in only for linux OS, for windows OS you can install `xilinix vivado`**

We will install `GHDL` which is an open-source tool that support VHDL coding and to simulate the output we will use `gtkwave`.

## Now first of all install some necessary packages:

```

sudo apt update

```

```

sudo apt install git make gnat zlib1g-dev

```
`gnat` is the Ada compiler, which GHDL requires since it is written in Ada.

## Clone the repository

Download the latest GHDL source code from its GitHub repository:
```

git clone https://github.com/ghdl/ghdl.git

```


```

cd ghdl

```

## Build and install GHDL
```

./configure --prefix=/usr/local

```


```

make

```


```

sudo make install

```
## Verify installation

```

ghdl --version

```

This should display the installed version of GHDL, confirming that it is ready for use.
## Install GTKWAVE

```

sudo apt install gtkwave

```

  

## Test GHDL

After installation, you can write your VHDL code in any text editor, save it with a `.vhd` extension, and then compile and simulate using GHDL commands. For example:

***Analyze the file***

```

ghdl -a file_name.vhd

```

also create a testbench to simulate your designed circuit, create another file with extention `.vhd` and name it like `file_name_tb.vhd`, and compile and simulate using GHDL commands:

***Analyze the file***

```

ghdl -a file_name_tb.vhd

```

***Compile the testbench***

```

ghdl -e file_name_tb

```

***Run the simulation***

```

ghdl -r file_name_tb --vcd=file_name_tb.vcd

```

The --vcd=and_gate_tb.vcd flag tells GHDL to output the simulation results in a .vcd (Value Change Dump) file, which can be viewed in a waveform viewer like GTKWave.

***View the waveform using gtkwave***

```

gtkwave file_name_tb.vcd

```