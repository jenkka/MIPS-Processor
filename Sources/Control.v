module Control
(
	input [5:0]OP,
	input [5:0]Instruction,
	
	output RegDst,
	output BranchEQ,
	output BranchNE,
	output MemRead,
	output MemtoReg,
	output MemWrite,
	output ALUSrc,
	output RegWrite,
	output Jump,
	output Jal,
	output Jr,
	output [2:0]ALUOp
);
localparam R_Type = 0;
localparam I_Type_ADDI =	6'h08;
localparam I_Type_ORI  = 	6'h0d;
localparam I_Type_ANDI = 	6'h0c;
localparam I_Type_LUI  = 	6'h0f;
localparam I_Type_LW	  = 	6'h23;
localparam I_Type_SW	  = 	6'h2b;
localparam I_Type_BEQ  =   6'h04;
localparam I_Type_BNE  =   6'h05;
localparam J_Type_J	  =	6'h02;
localparam J_Type_Jal  =	6'h03;


reg [10:0] ControlValues;

always @ (OP) begin
	case (OP)
		R_Type:			ControlValues= 11'b1_0010000_111;
		I_Type_ADDI:	ControlValues= 11'b0_1010000_100;
		I_Type_ORI:		ControlValues= 11'b0_1010000_101;
		I_Type_ANDI:	ControlValues= 11'b0_1010000_110;
		I_Type_LUI:		ControlValues= 11'b0_1010000_011;
		I_Type_LW:		ControlValues= 11'b0_1111000_010;
		I_Type_SW:		ControlValues= 11'b0_1100100_010;
		I_Type_BEQ:		ControlValues= 11'b0_0000001_001;
		I_Type_BNE:		ControlValues= 11'b0_0000010_001;
		J_Type_J:		ControlValues= 11'b0_0000000_000;
		J_Type_Jal:		ControlValues= 11'b0_0010000_000;

		default:
			ControlValues= 10'b0000000000; //MAY CHANGE
			
		endcase
end


//MAY CHANGE

assign RegDst 		= ControlValues[10];
assign ALUSrc 		= ControlValues[9];
assign MemtoReg 	= ControlValues[8];
assign RegWrite 	= ControlValues[7];
assign MemRead 	= ControlValues[6];
assign MemWrite 	= ControlValues[5];
assign BranchNE 	= ControlValues[4];
assign BranchEQ	= ControlValues[3];
assign ALUOp 		= ControlValues[2:0];
assign Jump = (OP == 6'h02 || OP == 6'h03) ? 1'b1 : 1'b0;
assign Jal 	= (OP == 6'h03) ? 1'b1 : 1'b0;
assign Jr 	= (Instruction == 6'h08 && OP == 0) ? 1'b1 : 1'b0;

endmodule
//control//
