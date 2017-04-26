module run(clk);
input clk;

// IF/ID signals
reg [31:0] pc;
wire [31:0] pco;
wire [31:0] IF_instr, instro;
wire [31:0] pc4, pc4o;

//ID/EX signals
wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE;
wire [1:0] ALUOp;
wire [31:0] read_data_1, read_data_2;
wire [4:0] write_reg; wire [31:0] write_data;// WB SIGNAL
wire [4:0] i1620o, i1115o;
wire [31:0] rd1o, rd2o, extendedo;
wire RegDsto, ALUSrco, MemtoRego, RegWriteo, MemReado, MemWriteo, Brancho, BranchNEo;
wire [1:0] ALUOpo;
wire [31:0] extended;

//EX/MEM signals
wire [31:0] extendedx4, IN2,OUT;
wire [2:0] ALUOperation;
wire ZeroFlag;
wire [4:0] x, xo;
wire [31:0] pc4branchedo, ALUreso, rd2oo, i015o;
wire zeroo, MemtoRegoo, RegWriteoo, MemReadoo, MemWriteoo, Branchoo, BranchNEoo;

// MEM/WB signals
wire [31:0] branched, data_out;
wire [4:0] instroo;
wire [31:0] memrdo, ALUresoo;
wire MemtoRegooo;
reg PCSrc;


//IF/ID part
initial begin pc=8'h0; end
im instrfetched(clk, pc, IF_instr);


always @(posedge clk)
begin


assign pc4 = pc + 8'h4;
fetchdec fetched(clk, pc4, IF_instr, pc4o, instro);


// ID/EX part
control ctrl(instro[31:26], RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE, ALUOp);
rf rf(clk, instro[25:21], instro[20:16], write_reg, write_data, RegWrite, read_data_1, read_data_2);
assign extended = { 16'b0, instro[15:0] };
decexc decexc (clk, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE, ALUOp, pc4,
read_data_1, read_data_2, extended, instro[20:16], instro[15:11], RegDsto, ALUSrco, MemtoRego, RegWriteo,
MemReado, MemWriteo, Brancho, BranchNEo, ALUOpo,
pc4o, rd1o, rd2o, extendedo, i1620o, i1115o);

// EX/MEM part
assign extendedx4 = extendedo << 2;
assign extendedx4 = extendedx4 + pc4o;
mux m(ALUSrco, rd2o, extended, IN2);
aluctrl ac(ALUOpo, extendedo[5:0], ALUOperation);
ALU alu(OUT, ZeroFlag, rd1o, IN2, ALUOperation);
mux5 m2(RegDsto, i1620o, i1115o, x);
excmem excmem(clk, MemtoRego, RegWriteo, MemReado, MemWriteo, Brancho, BranchNEo, extendedx4, ZeroFlag,
OUT, rd2o, x, MemtoRegoo, RegWriteoo, MemReadoo, MemWriteoo, Branchoo, BranchNEoo,
pc4branchedo, zeroo, ALUreso, rd2oo, xo);

// MEM/WB part
assign branched = zeroo & pc4branchedo;
mem mem(clk, MemReadoo, MemWriteoo, ALUreso, rd2oo, data_out);
memwb memwb(clk, MemtoRegoo, data_out, ALUreso, xo, MemtoRegooo, memrdo, ALUresoo, instroo);
always @ (Branch, BranchNE)
begin
if((Branchoo & zeroo) || (!zeroo & BranchNE))
PCSrc = 1'b1;
else
PCSrc = 1'b0; 
end
mux m3(MEmtoRegooo, memrdo, ALUresoo, write_data);
assign write_reg = instroo;
mux m4(PCSrc, pc4, pc4branchedo, pco);
end

always @ (posedge clk)
pc <= pco;
endmodule