module ID_EX
(
	input clk, 
	input reset,
	
	input [31:0]newPCIn,
	input [31:0]instructionIn,
	input [31:0]extendedIn,
	input [31:0]readData1In,
	input [31:0]readData2In,
	input [27:0]instIn,
	
	input NEIn,
	input EQIn,
	input regDstIn,
	input ALUSrcIn,
	input regWriteIn,
	input memWriteIn,
	input memReadIn,
	input jumpIn,
	input JRIn,
	input memToRegIn,
	input JALIn,
	input [2:0]ALUOpIn,
	
	output [31:0]instructionOut,
	output [31:0]newPCOut,
	output [31:0]readData1Out,
	output [31:0]readData2Out,
	output [31:0]extendedOut,
	output [27:0]instOut,
	
	output NEOut,
	output EQOut,
	output regDstOut,
	output ALUSrcOut,
	output regWriteOut,
	output memWriteOut,
	output memReadOut,
	output jumpOut,
	output JROut,
	output memToRegOut,
	output JALOut,
	output [2:0]ALUOpOut
);

reg [31:0]tmpnewPCIn;
reg [31:0]tmpinstructionFromID;
reg [31:0]tmpextendedIn;
reg [31:0]tmpreadData1In;
reg [31:0]tmpreadData2In;
reg [27:0]tmpinstIn;
reg tmpNEIn;
reg tmpEQIn;
reg tmpregDstIn;
reg tmpALUSrcIn;
reg tmpregWriteIn;
reg tmpmemWriteIn;
reg tmpmemReadIn;
reg tmpjumpIn;
reg tmpJRIn;
reg tmpmemToRegIn;
reg tmpJALIn;
reg [2:0]tmpALUOpIn;

assign instructionOut = tmpinstructionFromID;
assign newPCOut = tmpnewPCIn;
assign readData1Out = tmpreadData1In;
assign readData2Out = tmpreadData2In;
assign extendedOut = tmpextendedIn;
assign NEOut = tmpNEIn;
assign EQOut = tmpEQIn;

assign regDstOut = tmpregDstIn;
assign ALUSrcOut = tmpALUSrcIn;
assign regWriteOut = tmpregWriteIn;
assign memWriteOut = tmpmemWriteIn;
assign memReadOut = tmpmemReadIn;
assign jumpOut = tmpjumpIn;
assign JROut = tmpJRIn;
assign memToRegOut = tmpmemToRegIn;
assign JALOut = tmpJALIn;
assign ALUOpOut = tmpALUOpIn;
assign instOut = tmpinstIn;

always @ (negedge reset or posedge clk)
begin
	if(reset == 0)
	begin
		tmpnewPCIn <= 0;
		tmpinstructionFromID <= 0;
		tmpextendedIn <= 0;
		tmpreadData1In <= 0;
		tmpreadData2In <= 0;
		tmpNEIn <= 0;
		tmpEQIn <= 0;
		tmpregDstIn <= 0;
		tmpALUSrcIn <= 0;
		tmpregWriteIn <= 0;
		tmpmemWriteIn <= 0;
		tmpmemReadIn <= 0;
		tmpjumpIn <= 0;
		tmpJRIn <= 0;
		tmpmemToRegIn <= 0;
		tmpJALIn <= 0;
		tmpALUOpIn <= 0;
		tmpinstIn <= 0;
	end
	else
	begin
		tmpnewPCIn <= newPCIn;
		tmpinstructionFromID <= instructionIn;
		tmpextendedIn <= extendedIn;
		tmpreadData1In <= readData1In;
		tmpreadData2In <= readData2In;
		tmpNEIn <= NEIn;
		tmpEQIn <= EQIn;
		tmpregDstIn <= regDstIn;
		tmpALUSrcIn <= ALUSrcIn;
		tmpregWriteIn <= regWriteIn;
		tmpmemWriteIn <= memWriteIn;
		tmpmemReadIn <= memReadIn;
		tmpjumpIn <= jumpIn;
		tmpJRIn <= JRIn;
		tmpmemToRegIn <= memToRegIn;
		tmpJALIn <= JALIn;
		tmpALUOpIn <= ALUOpIn;
		tmpinstIn <= instIn;
	end
end

endmodule