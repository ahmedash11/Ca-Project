module memwb (clk, MemtoReg, memrd, ALUres, instr, MemtoRego, memrdo, ALUreso, instro);
input clk, MemtoReg;
input [31:0] memrd, ALUres;
input [4:0] instr;
output reg [4:0] instro;
output reg [31:0] memrdo, ALUreso;
output reg MemtoRego;

always @ (posedge clk, MemtoReg, memrd, ALUres, instr)
begin
MemtoRego <= MemtoReg;
memrdo <= memrd;
ALUreso <= ALUres;
instro <= instr;
end
endmodule