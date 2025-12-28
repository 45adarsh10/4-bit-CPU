module InstructionMemory (
    input [2:0] addr,         // 3-bit PC input
    output reg [7:0] instr    // 8-bit instruction output
);

    always @(*) begin
        case (addr)
            3'b000: instr = 8'b10010001; // LOAD R1, Mem[01]
            3'b001: instr = 8'b10011010; // LOAD R2, Mem[10]
            3'b010: instr = 8'b00011000; // ADD R1, R2
            3'b011: instr = 8'b01011000; // AND R1, R2
            3'b100: instr = 8'b11010011; // STORE R1, Mem[11]
            default: instr = 8'b00000000; // NOP
        endcase
    end

endmodule