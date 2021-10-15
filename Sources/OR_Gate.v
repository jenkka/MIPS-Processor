module OR_Gate
(
	input inEQ,
	input inNE,
	
	output reg orGateOut
);


always @ (*)
	orGateOut = inEQ | inNE;

//assign orGateOut = inEQ | inNE;

endmodule