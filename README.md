# MIPS Processor

A 5-stage pipelined MIPS processor implemented in Verilog HDL. Built as a college project for a Computer Architecture course (March 2020).

## Overview

This project implements a classic 32-bit MIPS CPU with a 5-stage pipeline (IF, ID, EX, MEM, WB), pipeline registers between each stage, and a forwarding unit to resolve data hazards.

## Features

- 5-stage pipeline: Instruction Fetch, Instruction Decode, Execute, Memory Access, Write Back
- Pipeline registers (`IF_ID`, `ID_EX`, `EX_MEM`, `MEM_WB`)
- Forwarding unit for data hazard resolution
- Branch and jump support (`BEQ`, `BNE`, `J`, `JAL`, `JR`)
- Separate instruction (ROM) and data (RAM) memories — Harvard architecture

### Supported Instructions

- **R-type**: `ADD`, `SUB`, `AND`, `OR`, `NOR`, `SLL`, `SRL`, `JR`
- **I-type**: `ADDI`, `ANDI`, `ORI`, `LUI`, `LW`, `SW`, `BEQ`, `BNE`
- **J-type**: `J`, `JAL`

## Project Structure

```
Sources/
├── MIPS_Processor.v     # Top-level module wiring the pipeline together
├── Control.v            # Main control unit (decodes opcodes)
├── ALU.v                # Arithmetic logic unit
├── ALUControl.v         # ALU operation decoder
├── RegisterFile.v       # 32 x 32-bit register file
├── ProgramMemory.v      # Instruction memory (ROM)
├── DataMemory.v         # Data memory (RAM)
├── PC_Register.v        # Program counter
├── IF_ID.v              # Pipeline registers
├── ID_EX.v
├── EX_MEM.v
├── MEM_WB.v
├── forward_Unit.v       # Hazard forwarding logic
├── SignExtend.v         # Sign extension
├── ShiftLeft2.v         # Shift-left-by-2 for branch/jump targets
├── Adder32bits.v        # Generic 32-bit adder
├── Multiplexer2to1.v    # 2-to-1 mux
├── MUX_3To1.v           # 3-to-1 mux (for forwarding)
├── ANDGate.v / OR_Gate.v
├── MIPS_Processor_TB.v  # Testbench
└── TestProgram.asm      # Sample MIPS assembly program
```

## Tools

- **Quartus Prime 19.1.0 Lite Edition** — synthesis and FPGA project files (`.qpf` / `.qsf`)
- **ModelSim** — simulation (`.mpf` projects, `.do` wave scripts)

## Simulation

Open `MIPS_Processor.mpf` in ModelSim, compile the sources under `Sources/`, and run the `MIPS_Processor_TB` testbench. Wave configurations are provided in `wave.do`, `registers.do`, and `testBranchWave.do`.

The instruction memory is preloaded from `text.dat`, which contains the machine-code translation of `Sources/TestProgram.asm`.

## Authors

- Juan Carlos González Guerra
- Francisco Guillermo López García
