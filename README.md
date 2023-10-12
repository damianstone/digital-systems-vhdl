# Running VHDL Code with GHDL and GTKWave

This guide explains how to compile and simulate VHDL code using GHDL and view the results with GTKWave on a Unix-like system (Linux/macOS). The example code used here is for a simple 4-to-1 multiplexer, but the process is similar for other VHDL code.

## Prerequisites

- [GHDL](http://ghdl.free.fr/) (VHDL compiler and simulator)
- [GTKWave](http://gtkwave.sourceforge.net/) (VCD waveform viewer)

## Instructions

1. **Install GHDL and GTKWave**:

   Ensure you have GHDL and GTKWave installed on your system. You can install them using package managers such as Homebrew (on macOS), apt-get (on Ubuntu), or dnf (on Fedora).

   ```bash
   # Install GHDL
   brew install ghdl  # macOS
   sudo apt-get install ghdl  # Ubuntu
   sudo dnf install ghdl  # Fedora

   # Install GTKWave
   brew install gtkwave  # macOS
   sudo apt-get install gtkwave  # Ubuntu
   sudo dnf install gtkwave  # Fedora


## Run code

### Compile VHDL code
```bash
ghdl -a your_file.vhdl
```

### Elaborate the desing 
```bash
ghdl -e entity_name
```

#### Run the simulator 
```bash
ghdl -r entity_name --vcd=waveform.vcd
```

#### View the Results with GTKWave
```bash
gtkwave waveform.vcd
```