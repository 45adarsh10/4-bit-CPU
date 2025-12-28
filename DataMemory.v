module DataMemory (
    input clk,
    input MemRead,
    input MemWrite,
    input [1:0] addr,
    input [3:0] WriteData,
    output reg [3:0] ReadData
);

reg [3:0] memory [3:0]; // 4x4-bit memory locations

// Initialize memory with known values
integer i;
initial begin
    for (i = 0; i < 4; i = i + 1)
        memory[i] = 4'b0;  // Initialize all to 0
    // Or preload specific values:
    memory[1] = 4'b0011;  // Mem[01] = 3
    memory[2] = 4'b0100;  // Mem[10] = 4
end

always @(posedge clk) begin
    if (MemWrite)
        memory[addr] <= WriteData;
end

always @(*) begin
    if (MemRead)
        ReadData = memory[addr];
    else
        ReadData = 4'b0000;
end

endmodule