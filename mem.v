module mem(clk, mem_read, mem_write, address, data_in, data_out);
input  clk, mem_read, mem_write;
input  [31:0] address, data_in;
output reg [31:0] data_out;

reg [31:0] memarray [0:31];

always @(posedge clk or mem_read or mem_write or address or data_in)
begin
if (mem_read)
data_out <= memarray[address];
if (mem_write)
memarray[address] <= data_in; 
end

endmodule