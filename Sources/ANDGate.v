module ANDGate
(
	input A,
	input B,
	output reg C
);

always@(*)
	C = A & B;

endmodule
//andgate//