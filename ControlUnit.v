module ControlUnit (
    input [1:0] opcode,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg [1:0] ALUOp
);

    always @(*) begin
        case (opcode)
            2'b00: begin // ADD
                RegWrite = 1; MemRead = 0; MemWrite = 0; MemToReg = 0; ALUOp = 2'b00;
            end
            2'b01: begin // AND
                RegWrite = 1; MemRead = 0; MemWrite = 0; MemToReg = 0; ALUOp = 2'b01;
            end
            2'b10: begin // LOAD
                RegWrite = 1; MemRead = 1; MemWrite = 0; MemToReg = 1; ALUOp = 2'b00;
            end
            2'b11: begin // STORE
                RegWrite = 0; MemRead = 0; MemWrite = 1; MemToReg = 0; ALUOp = 2'b00;
            end
            default: begin
                RegWrite = 0; MemRead = 0; MemWrite = 0; MemToReg = 0; ALUOp = 2'b00;
            end
        endcase
    end

endmodule