module decexc (clk, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE, ALUOp, pc4,
rd1, rd2, i015, i1620, i1115, RegDsto, ALUSrco, MemtoRego, RegWriteo, MemReado, MemWriteo, Brancho, BranchNEo, ALUOpo,
pc4o, rd1o, rd2o, i015o, i1620o, i1115o);

input clk, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE;
input [1:0] ALUOp;
input [31:0] pc4;
input [31:0] rd1, rd2, i015;
input [4:0] i1620, i1115;
output reg [4:0] i1620o, i1115o;
output reg [31:0] pc4o;
output reg [31:0] rd1o, rd2o, i015o;
output reg RegDsto, ALUSrco, MemtoRego, RegWriteo, MemReado, MemWriteo, Brancho, BranchNEo;
output reg [1:0] ALUOpo;

always @ (posedge clk, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE, ALUOp, pc4,
rd1, rd2, i015, i1620, i1115)
begin
RegDsto <= RegDst;
ALUSrco <= ALUSrc;
MemtoRego <= MemtoReg;
RegWriteo <= RegWrite;
MemReado <= MemRead;
MemWriteo <= MemWrite;
Brancho <= Branch;
BranchNEo <= BranchNE;
ALUOpo <= ALUOp;
pc4o <= pc4;
rd1o <= rd1;
rd2o <= rd2;
i015o <= i015;
i1620o <= i1620;
i1115o <= i1115;
end
endmodule