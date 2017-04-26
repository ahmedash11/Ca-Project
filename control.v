module control(opcode, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE, ALUOp);
input [5:0] opcode;
output reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, BranchNE;
output reg [2:0] ALUOp;

parameter R_FORMAT = 6'd0;
parameter LW = 6'd35;
parameter SW = 6'd43;
parameter BEQ = 6'd4;
parameter BNE = 6'd5;
parameter ADDI = 6'd8;
parameter ANDI = 6'd12;
parameter ORI = 6'd13;

always @(opcode)
    begin
        case (opcode)
          R_FORMAT : 
          begin
              RegDst=1'b1; ALUSrc=1'b0; MemtoReg=1'b0; RegWrite=1'b1; MemRead=1'b0; 
              MemWrite=1'b0; Branch=1'b0; BranchNE=1'b0; ALUOp = 2'b10;
          end
          LW :
          begin
              RegDst=1'b0; ALUSrc=1'b1; MemtoReg=1'b1; RegWrite=1'b1; MemRead=1'b1; 
              MemWrite=1'b0; Branch=1'b0; BranchNE=1'b0; ALUOp = 2'b00;
          end
          SW :
          begin
              RegDst=1'bx; ALUSrc=1'b1; MemtoReg=1'bx; RegWrite=1'b0; MemRead=1'b0; 
              MemWrite=1'b1; Branch=1'b0; BranchNE=1'b0; ALUOp = 2'b00;
          end
          BEQ :
          begin
              RegDst=1'bx; ALUSrc=1'b0; MemtoReg=1'bx; RegWrite=1'b0; MemRead=1'b0; 
              MemWrite=1'b0; Branch=1'b1; BranchNE=1'b0; ALUOp = 2'b01;
          end
          BNE :
          begin
              RegDst=1'bx; ALUSrc=1'b0; MemtoReg=1'bx; RegWrite=1'b0; MemRead=1'b0;
              MemWrite=1'b0; Branch=1'b0; BranchNE=1'b1; ALUOp = 2'b01;
          end
          ADDI :
          begin
              RegDst=1'b0; ALUSrc=1'b1; MemtoReg=1'b0; RegWrite=1'b1; MemRead=1'b0;
              MemWrite=1'b0; Branch=1'b0; BranchNE=1'b0; ALUOp = 2'b00;

          ANDI :
          begin
           RegDst=1'b0; ALUSrc=1'b1; MemtoReg=1'b0; RegWrite=1'b1; MemRead=1'b0;
              MemWrite=1'b0; Branch=1'b0; BranchNE=1'b0; ALUOp = 2'b00;
          ORI :
          begin
           RegDst=1'b0; ALUSrc=1'b1; MemtoReg=1'b0; RegWrite=1'b1; MemRead=1'b0;
              MemWrite=1'b0; Branch=1'b0; BranchNE=1'b0; ALUOp = 2'b00;
          end

        endcase
    end

endmodule