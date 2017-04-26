module aluctrl(ALUOp, Funct, ALUOperation);
    input [2:0] ALUOp;
    input [5:0] Funct;
    output reg [2:0] ALUOperation;

    // symbolic constants for instruction function code
    parameter F_add = 6'b100000;
    parameter F_sub = 6'b100010;
    parameter F_and = 6'b100100;
    parameter F_or  = 6'b100101;
    parameter F_slt = 6'b101010;
    parameter F_sll = 6'b000000;
    parameter F_slr = 6'b000010;

    // symbolic constants for ALU Operations
    parameter ALU_add = 3'b010;
    parameter ALU_sub = 3'b011;
    parameter ALU_and = 3'b000;
    parameter ALU_or  = 3'b001;
    parameter ALU_slt = 3'b100;
    parameter ALU_sll = 3'b101;
    parameter ALU_slr = 3'b110;

    always @(ALUOp or Funct)
    begin
        case (ALUOp) 
            3'b000 : ALUOperation = ALU_add;
            3'b001 : ALUOperation = ALU_sub;
            3'b010 : case (Funct) 
                        F_add : ALUOperation = ALU_add;
                        F_sub : ALUOperation = ALU_sub;
                        F_and : ALUOperation = ALU_and;
                        F_or  : ALUOperation = ALU_or;
                        F_slt : ALUOperation = ALU_slt;
                        F_sll : ALUOperation = ALU_sll;
                        F_slr : ALUOperation = ALU_slr;
            3'b011 : ALUOperation           
                        default ALUOperation = 3'bxxx;
                    endcase
            default ALUOperation = 3'bxxx;
        endcase
    end
endmodule