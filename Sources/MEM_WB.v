module MEM_WB
(
	input clk, 
	input reset,
	
	input [31:0]dataMemoryIn,
	input [31:0]ALUResultIn,
	input [4:0]dataForWRIn,
		
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
	
	output [31:0]dataMemoryOut,
	output [31:0]ALUResultOut,
	output [4:0]dataForWROut,
		
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

reg [31:0]tmpdataMemoryIn;
reg [31:0]tmpALUResultIn;
reg [4:0]tmpdataForWRIn;

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

assign dataMemoryOut = tmpdataMemoryIn;
assign ALUResultOut = tmpALUResultIn;
assign dataForWROut = tmpdataForWRIn;

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

always @ (negedge reset or posedge clk)
begin
	if(reset == 0)
	begin
		tmpdataMemoryIn <= 0;
		tmpALUResultIn <= 0;
		tmpdataForWRIn <= 0;
		
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
	end
	else
	begin
		tmpdataMemoryIn <= dataMemoryIn;
		tmpALUResultIn <= ALUResultIn;
		tmpdataForWRIn <= dataForWRIn;
		
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
	end
end

endmodule
