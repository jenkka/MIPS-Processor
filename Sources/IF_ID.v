module IF_ID
(
	input clk, 
	input reset,
	
	input [31:0] instructionFromIF,
	input [31:0] PCFromIF,
	output [31:0] instructionToID,
	output [31:0] PCToID
);

reg [31:0] tmpInstruction;
reg [31:0] tmpPC;

assign instructionToID = tmpInstruction;
assign PCToID = tmpPC;

always @ (negedge reset or posedge clk)
begin
	if(reset == 0)
	begin
		tmpInstruction <= 0;
		tmpPC <= 0;
	end
	else
	begin
		tmpInstruction <= instructionFromIF;
		tmpPC <= PCFromIF; 
	end
end

endmodule
