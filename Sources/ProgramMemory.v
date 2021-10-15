module ProgramMemory
#
(
	parameter MEMORY_DEPTH=32,
	parameter DATA_WIDTH=32
)
(
	input [(DATA_WIDTH-1):0] Address,
	output reg [(DATA_WIDTH-1):0] Instruction
);
wire [(DATA_WIDTH-1):0] RealAddress;
wire [(DATA_WIDTH-1):0] newAddress = Address - 32'h0040_0000;	//ORIGINAL

assign RealAddress = {2'b0,newAddress[(DATA_WIDTH-1):2]};

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[MEMORY_DEPTH-1:0];

	initial
	begin
		$readmemh("text.dat", rom);
	end

	always @ (RealAddress)
	begin
		Instruction = rom[RealAddress];
	end

endmodule
//programmemory//