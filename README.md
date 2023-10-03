# 🤖 MIPS32
32 Bit Single Cycle MIPS Processor

## 📚 Documentation
Project documentation can be found [here](https://github.com/ebylmz/MIPS32/blob/main/mips32_doc.pdf).

## 🧪 Testbench & Simulation
Testbench files are provided in the `src/testbench` folder. Before starting the simulation, replace the `mips32` and `core` files with the ones in the `testbench` folder. This step is necessary to display debugging parameters via waves.

Ensure that the instruction memory, data memory, and register file are initialized using the Verilog `readmem`. To ensure correct execution, verify the path for source files.

Sample testbench instructions in the `instr.mem` file:

```assembly
  li $1, 1
  li $2, 0xF
  add $1, $1, $1
  slt $3, $1, $2
  bne $3, $0, -3
  sw $2, 5($0)
  lw $4, 0($1)
  lw $5, 0($2)
  or $1, $4, $5 
  mult $6, $7
  mfhi $4 
  mflo $5 
  ori $3, $3, 0 
  j 0x4
```
