module DataMemory 
#(	
	parameter DATA_WIDTH = 8,
	parameter MEMORY_DEPTH = 1024

)
(
	input [DATA_WIDTH-1:0] WriteData,
	input [DATA_WIDTH-1:0]  Address,
	input MemWrite, MemRead, clk,
	output  [DATA_WIDTH-1:0]  ReadData
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[MEMORY_DEPTH-1:0];
	wire [DATA_WIDTH-1:0] ReadDataAux;

	wire [(DATA_WIDTH-1):0] NewAddress;
	assign NewAddress = Address - 32'h1001_0000;

	always @ (posedge clk)
	begin
		// Write
		if (MemWrite)
			ram[NewAddress] <= WriteData;
	end
	assign ReadDataAux = ram[NewAddress];
  	assign ReadData = {DATA_WIDTH{MemRead}} & ReadDataAux;

endmodule
//datamemory//