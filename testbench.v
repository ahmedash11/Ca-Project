module testbench;
 reg clk;
 reg [31:0] memory;
 reg [31:0] registerFiles;
 
 // wire [31:0] read_data_1, read_data_2;

 run main(clk, memory, registerFiles)

 initial begin
 clk = 0;
 forever begin
 #5 clk = ~clk;
 end
 end

 initial
 begin
 $monitor(registerFiles);
 #5 read_reg_1 <= 2'b0;
 #5 write_reg <= 2'b01; regWrite <= 1; write_data<=32'd55;
 #15 regWrite = 0;
 #5 read_reg_2 <= 2'b1;
 #5 $finish;
 end
endmodule