module Forward_unit (
   input [4:0]ID_EX_RegRt_IN,
   input [4:0]ID_EX_RegRs_IN,
   input [4:0]EX_MEM_RegRd_IN,
   input [4:0]MEM_WB_RegRd_IN,
	input EX_MEM_regWrite_IN,
	input MEM_WB_regWrite_IN,
   output [1:0]forwardA,
	output [1:0]forwardB
  );
  
  
  reg [1:0]tempFWa;
  reg [1:0]tempFWb;

  assign forwardA = tempFWa;
  assign forwardB = tempFWb;
  
  always @ ( * ) begin

    // Hazards for ForwardA
    if (EX_MEM_regWrite_IN && EX_MEM_RegRd_IN == ID_EX_RegRs_IN)  tempFWa <= 2'b10;
    else if (MEM_WB_regWrite_IN && MEM_WB_RegRd_IN == ID_EX_RegRs_IN && (EX_MEM_RegRd_IN != ID_EX_RegRs_IN ||EX_MEM_regWrite_IN == 2'd0)) tempFWa <= 2'b01;
	 else tempFWa <= 2'b00;	
    // Hazards for ForwardB
    if (EX_MEM_regWrite_IN && EX_MEM_RegRd_IN == ID_EX_RegRt_IN)  tempFWb <= 2'b10;
    else if (MEM_WB_regWrite_IN && MEM_WB_RegRd_IN == ID_EX_RegRt_IN && (EX_MEM_RegRd_IN != ID_EX_RegRt_IN ||EX_MEM_regWrite_IN == 2'd0)) tempFWb <= 2'b01;
	 else tempFWb <= 2'b00;	
  end
endmodule // forwarding
