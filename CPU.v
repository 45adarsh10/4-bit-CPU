module CPU (
    input clk,
    input reset
);
   
    //  Wires and signals
    
    wire [2:0] pc;                  // Program counter
    wire [7:0] instr;               // Current instruction
    wire [1:0] opcode;              // Top 2 bits = operation type
    wire [1:0] Rd, Rs;              // Register addresses
    wire [1:0] MemAddr;             // Memory address (for LOAD/STORE)
    wire [3:0] WriteData;           // Data to write into register
    wire [3:0] ReadData1, ReadData2;
    wire [3:0] ALUResult;
    wire [3:0] MemData;
    wire RegWrite, MemRead, MemWrite, MemToReg;
    wire [1:0] ALUOp;

    
    // Program Counter
    
    ProgramCounter PC (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

   
    //  Instruction Memory
    
    InstructionMemory IM (
        .addr(pc),
        .instr(instr)
    );

    // Split the instruction fields:
    assign opcode  = instr[7:6];
    assign Rd      = instr[5:4];
    assign Rs      = instr[3:2];
    assign MemAddr = instr[1:0];

   
    //  Control Unit
   
    ControlUnit CU (
        .opcode(opcode),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUOp(ALUOp)
    );

    
    //  Register File
   
    RegisterFile RF (
        .clk(clk),
        .RegWrite(RegWrite),
        .Rd(Rd),
        .Rs(Rs),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

  
    //  ALU
   
    ALU alu (
        .A(ReadData1),
        .B(ReadData2),
        .ALUOp(ALUOp),
        .Result(ALUResult)
    );

    
    //  Data Memory
    
    DataMemory DM (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .addr(MemAddr),
        .WriteData(ReadData1), // STORE uses R1 as source
        .ReadData(MemData)
    );

  
    //  Write-back MUX
   
    assign WriteData = (MemToReg) ? MemData : ALUResult;

endmodule
