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


# Let us create and gate simulation

Create a folder named `and_gate` and create two files named `and_gate.vhd` and `and_gate_tb.vhd` inside of the folder

### Content of `and_gate.vhd`

in this file we will design the circuit
```vhdl
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

  

-- Entity declaration for AND gate

entity and_gate is

Port ( a : in STD_LOGIC;

b : in STD_LOGIC;

y : out STD_LOGIC);

end and_gate;

  

-- Architecture for AND gate

architecture Behavioral of and_gate is

begin

y <= a and b;
end Behavioral;
```

### Content of `and_gate_tb.vhd`


in this file we will test out circuit by giving sample inputs
```vhdl
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

  

-- Entity declaration for testbench (no ports needed)

entity and_gate_tb is

end and_gate_tb;

  

-- Architecture for testbench

architecture Behavioral of and_gate_tb is

  

-- Signal declarations for testbench

signal a : STD_LOGIC := '0';

signal b : STD_LOGIC := '0';

signal y : STD_LOGIC;

  

-- Instantiate the AND gate

component and_gate

Port ( a : in STD_LOGIC;

b : in STD_LOGIC;

y : out STD_LOGIC);

end component;

  

begin

-- Instantiate the and_gate

uut: and_gate Port map (a => a, b => b, y => y);

  

-- Test process

process

begin

-- Test case 1: a = 0, b = 0

a <= '0';

b <= '0';

wait for 1 fs;

-- Test case 2: a = 0, b = 1

a <= '0';

b <= '1';

wait for 1 fs;

  

-- Test case 3: a = 1, b = 0

a <= '1';

b <= '0';

wait for 1 fs;

  

-- Test case 4: a = 1, b = 1

a <= '1';

b <= '1';

wait for 1 fs;

  

-- End simulation

wait;

end process;

end Behavioral;
```

### Compile the files using GHDL
```
ghdl -a and_gate.vhd
```

```
ghdl -a and_gate_tb.vhd
```

```
ghdl -e and_gate_tb
```

```
ghdl -r and_gate_tb --vcd=and_gate_tb.vcd
```

after this a new file named `and_gate_tb.vcd ` will be created in the same folder 
now we will simulate the waveform using `gtkwave`

```
gtkwave and_gate_tb.vcd
```

and you will probably get a waveform like this

![[Pasted image 20241109222152.png]]