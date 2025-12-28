module RegisterFile (
    input clk,
    input RegWrite,
    input [1:0] Rd, Rs,
    input [3:0] WriteData,
    output [3:0] ReadData1,
    output [3:0] ReadData2
);

reg [3:0] regfile [3:0];

// Initialize all registers to 0
integer i;
initial begin
    for (i = 0; i < 4; i = i + 1)
        regfile[i] = 4'b0000;
end

assign ReadData1 = regfile[Rd];
assign ReadData2 = regfile[Rs];

always @(posedge clk) begin
    if (RegWrite)
        regfile[Rd] <= WriteData;
end

endmodule