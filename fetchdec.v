module fetchdec(clk, pc4, instr, pc4o, instro);
input clk;
input [31:0] pc4;
input [31:0] instr;
output reg [31:0] pc4o;
output reg [31:0] instro;

always @ (posedge clk, pc4, instr)
begin
instro <= instr;
pc4o <= pc4;
end
endmodule