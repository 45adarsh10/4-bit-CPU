# 4-bit-CPU
This repository contains the design and simulation of a simple single-cycle CPU implemented using Verilog HDL.
The processor uses an 8-bit instruction format with a 4-bit datapath and demonstrates the fundamental stages of CPU operation: instruction fetch, decode, execute, memory access, and write-back.
The project is intended for educational purposes and helps in understanding basic CPU architecture and digital design concepts.


# CPU Features
Instruction Width: 8 bits <br>
Datapath Width: 4 bits<br>
Architecture: Single-cycle processor<br>
Registers: 4 general-purpose registers (4-bit each)<br>

# Instruction Set:
ADD – Arithmetic addition<br>
AND – Logical AND<br>
LOAD – Load data from memory to register<br>
STORE – Store register data to memory<br>


# Instruction Format
Each instruction is 8 bits wide:<br>
 [7:6] - Opcode ( Operation type )<br>
 [5:4] - Rd ( Destination register )<br>
 [3:2] - Rs ( Source register )<br>
 [1:0] - Addr ( Memory address )<br>


# Module Description
ProgramCounter.v - Generates instruction addresses<br>
InstructionMemory.v - Stores program instructions (ROM)<br>
ControlUnit.v - Decodes opcode and generates control signals<br>
RegisterFile.v - Stores and provides register operands<br>
ALU.v - Performs arithmetic and logical operations<br>
DataMemory.v - Handles LOAD and STORE operations<br>
CPU.v - Top-level integration of all modules<br>
CPU_tb.v - Testbench for full CPU simulation<br>


# CPU Operation Flow
1) Program Counter fetches the next instruction<br>
2) Instruction Memory outputs instruction<br>
3) Control Unit decodes opcode<br>
4) Register File provides operands<br>
5) ALU executes operation<br>
6) Data Memory accessed if required<br>
7)Result written back to register file<br>
Each instruction completes in one clock cycle.<br>

# Simulation & Verification
The design is simulated using:<br>
Icarus Verilog – Compilation and simulation<br>
GTKWave – Waveform visualization<br>

# How to Run
iverilog -o cpu_tb.out CPU_tb.v CPU.v ProgramCounter.v InstructionMemory.v RegisterFile.v ALU.v DataMemory.v ControlUnit.v <br>
vvp cpu_tb.out <br>
gtkwave cpu_tb.vcd
