module MUX3to1 (
		input [31:0]ID_EXtoMUX, 
		input [31:0]EX_MEMtoMUX, 
		input [31:0]MEM_WBtoMUX,	 
		input [1:0]selector, 
		output reg [31:0]MUX_outPut
);

always @ (selector, ID_EXtoMUX, EX_MEMtoMUX, MEM_WBtoMUX)
begin
	case (selector)
		2'b00: MUX_outPut = ID_EXtoMUX;
		2'b01: MUX_outPut = MEM_WBtoMUX;
		2'b10: MUX_outPut = EX_MEMtoMUX;
		
		default:
			MUX_outPut = ID_EXtoMUX;
	endcase
end

//assign MUX_outPut = selector == 2'b10 ? ID_EXtoMUX : selector == 2'b01 ? MEM_WBtoMUX: EX_MEMtoMUX; 


endmodule
