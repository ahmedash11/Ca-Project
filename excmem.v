module excmem (clk, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE, pc4branched,zero,
ALUres, rd2, instr, MemtoRego, RegWriteo, MemReado, MemWriteo, Brancho, BranchNEo,
pc4branchedo, zeroo, ALUreso, rd2o, instro);

input zero,clk, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE;
input [31:0] pc4branched, ALUres, rd2, i015;
input [4:0] instr;
output reg [4:0] instro;
output reg [31:0] pc4branchedo, ALUreso, rd2o, i015o;
output reg zeroo, MemtoRego, RegWriteo, MemReado, MemWriteo, Brancho, BranchNEo;

always @ (posedge clk, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE, pc4branched,
ALUres, instr)
begin
MemtoRego <= MemtoReg;
RegWriteo <= RegWrite;
MemReado <= MemRead;
MemWriteo <= MemWrite;
Brancho <= Branch;
BranchNEo <= BranchNE;
pc4branchedo <= pc4branched;
ALUreso <= ALUres;
rd2o <= rd2;
zeroo <= zero;
instro <= instr;
end
endmodule