module ALU (
    input [3:0] A, B,     // operands
    input [1:0] ALUOp,    // 00=ADD, 01=AND
    output reg [3:0] Result
);

always @(*) begin
    case (ALUOp)
        2'b00: Result = A + B;   // ADD
        2'b01: Result = A & B;   // AND
        default: Result = 4'b0000;
    endcase
end

endmodule