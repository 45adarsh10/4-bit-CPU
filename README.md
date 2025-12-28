# 4-bit-CPU
This repository contains the design and simulation of a simple single-cycle CPU implemented using Verilog HDL.
The processor uses an 8-bit instruction format with a 4-bit datapath and demonstrates the fundamental stages of CPU operation: instruction fetch, decode, execute, memory access, and write-back.
The project is intended for educational purposes and helps in understanding basic CPU architecture and digital design concepts.


# CPU Features
Instruction Width: 8 bits
Datapath Width: 4 bits
Architecture: Single-cycle processor
Registers: 4 general-purpose registers (4-bit each)

# Instruction Set:
ADD – Arithmetic addition
AND – Logical AND
LOAD – Load data from memory to register
STORE – Store register data to memory


# Instruction Format
Each instruction is 8 bits wide:
 [7:6] - Opcode ( Operation type )
 [5:4] - Rd ( Destination register )
 [3:2] - Rs ( Source register )
 [1:0] - Addr ( Memory address )


# Module Description
ProgramCounter.v - Generates instruction addresses
InstructionMemory.v - Stores program instructions (ROM)
ControlUnit.v - Decodes opcode and generates control signals
RegisterFile.v - Stores and provides register operands
ALU.v - Performs arithmetic and logical operations
DataMemory.v - Handles LOAD and STORE operations
CPU.v - Top-level integration of all modules
CPU_tb.v - Testbench for full CPU simulation


# CPU Operation Flow
1) Program Counter fetches the next instruction
2) Instruction Memory outputs instruction
3) Control Unit decodes opcode
4) Register File provides operands
5) ALU executes operation
6) Data Memory accessed if required
7)Result written back to register file
Each instruction completes in one clock cycle.

# Simulation & Verification
The design is simulated using:
Icarus Verilog – Compilation and simulation
GTKWave – Waveform visualization

# How to Run
iverilog -o cpu_tb.out CPU_tb.v CPU.v ProgramCounter.v InstructionMemory.v RegisterFile.v ALU.v DataMemory.v ControlUnit.v
vvp cpu_tb.out
gtkwave cpu_tb.vcd
