module ALU (OUT, ZeroFlag, In1, In2, ctrl);

 input [31:0] In1, In2;
 input [2:0] ctrl;
 output reg [31:0] OUT;
 output reg ZeroFlag;

 always @ (In1, In2, ctrl)
 begin
 if (In1 == In2)
 ZeroFlag = 1;
 else
 ZeroFlag = 0;
 end
 always @ (In1, In2, ctrl)
 begin
 case (ctrl)
3'b000 : OUT = In1 & In2; // AND
3'b001 : OUT = In1 | In2; // OR
3'b010 : OUT = In1 + In2; // ADD
3'b011 : OUT = In1 - In2; // SUBTRACT
3'b100 : if (In1 < In2) OUT = 32'd1; else OUT = 32'd0; //SLT      
3'b101 : OUT = In1 << In2;
3'b110 : OUT = In1 >> In2;
default : OUT = 32'hxxxxxxxx;
 endcase
 end
endmodule