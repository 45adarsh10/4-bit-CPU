module CPU_tb;
    reg clk, reset;

    CPU uut (.clk(clk), .reset(reset));

    initial begin
        $dumpfile("cpu_tb.vcd");
        $dumpvars(0, CPU_tb);

        clk = 0;
        reset = 1;
        #15 reset = 0;  // Release reset after first clock edge
        
        // Monitor important signals
        $monitor("Time=%0t, PC=%b, Instr=%b, R1=%b, R2=%b, ALUResult=%b", 
                 $time, uut.pc, uut.instr, uut.ReadData1, uut.ReadData2, uut.ALUResult);
        
        #200 $finish;
    end

    always #5 clk = ~clk;
endmodule