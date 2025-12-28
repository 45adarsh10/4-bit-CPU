module ProgramCounter (
    input clk,
    input reset,
    output reg [2:0] pc  // 3-bit since Instruction Memory = 8 instructions
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 3'b000;
    else
        pc <= pc + 1;
end

endmodule