module ALU 
(
	input [3:0] ALUOperation,
	input [31:0] A,
	input [31:0] B,
	input [4:0] Shamt,  //TO DO IN TOP
	output reg Zero,
	output reg [31:0]ALUResult
);

localparam AND = 4'b0000;
localparam OR  = 4'b0001;
localparam NOR = 4'b0010;
localparam ADD = 4'b0011;
localparam SUB = 4'b0100;
localparam LUI = 4'b0101;
localparam SLL = 4'b0110;
localparam SRL = 4'b0111;
   
   always @ (A or B or ALUOperation or Shamt)
     begin
		case (ALUOperation)

			AND: 	ALUResult = A & B;
			OR: 	ALUResult = A | B;
			NOR: 	ALUResult = ~(A | B);
			ADD:	ALUResult = A + B;
			SLL: 	ALUResult = B << Shamt;
			SRL: 	ALUResult = B >> Shamt;
			//ORI: 	ALUResult = A | B;
			LUI: 	ALUResult = {B[15:0], 16'b0};
			SUB: 	ALUResult = A - B;

			default:
					ALUResult= 0;
			
		endcase // case(control)
		Zero = (ALUResult==0) ? 1'b1 : 1'b0;
     end // always @ (A or B or control)
endmodule 
// alu//