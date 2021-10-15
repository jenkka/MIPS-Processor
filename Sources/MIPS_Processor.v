////////////////////////////////////////////////////////////////////
// PRACTICA 2: ARQUITECTURA COMPUTACIONAL									//
// JUAN CARLOS GONZALEZ GUERRA Y Francisco Guillermo López García //
////////////////////////////////////////////////////////////////////


//  /$$$$$$$$ /$$$$$$  /$$$$$$$        /$$      /$$  /$$$$$$  /$$$$$$$  /$$   /$$ /$$       /$$$$$$$$
// |__  $$__//$$__  $$| $$__  $$      | $$$    /$$$ /$$__  $$| $$__  $$| $$  | $$| $$      | $$_____/
//    | $$  | $$  \ $$| $$  \ $$      | $$$$  /$$$$| $$  \ $$| $$  \ $$| $$  | $$| $$      | $$      
//    | $$  | $$  | $$| $$$$$$$/      | $$ $$/$$ $$| $$  | $$| $$  | $$| $$  | $$| $$      | $$$$$   
//    | $$  | $$  | $$| $$____/       | $$  $$$| $$| $$  | $$| $$  | $$| $$  | $$| $$      | $$__/   
//    | $$  | $$  | $$| $$            | $$\  $ | $$| $$  | $$| $$  | $$| $$  | $$| $$      | $$      
//    | $$  |  $$$$$$/| $$            | $$ \/  | $$|  $$$$$$/| $$$$$$$/|  $$$$$$/| $$$$$$$$| $$$$$$$$
//    |__/   \______/ |__/            |__/     |__/ \______/ |_______/  \______/ |________/|________/

module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 512	// MORE SPACE = LESS CRASH
)
(
	input clk,
	input reset,
	input [7:0] PortIn,
	
	output [31:0] ALUResultOut,
	output [31:0] PortOut
);

assign  PortOut = 0;


// /$$      /$$ /$$$$$$ /$$$$$$$  /$$$$$$$$  /$$$$$$ 
//| $$  /$ | $$|_  $$_/| $$__  $$| $$_____/ /$$__  $$
//| $$ /$$$| $$  | $$  | $$  \ $$| $$      | $$  \__/
//| $$/$$ $$ $$  | $$  | $$$$$$$/| $$$$$   |  $$$$$$ 
//| $$$$_  $$$$  | $$  | $$__  $$| $$__/    \____  $$
//| $$$/ \  $$$  | $$  | $$  \ $$| $$       /$$  \ $$
//| $$/   \  $$ /$$$$$$| $$  | $$| $$$$$$$$|  $$$$$$/
//|__/     \__/|______/|__/  |__/|________/ \______/ 


wire [31:0] ReadData2OrInmmediate_wire;
wire [31:0] Shift_To_Adder_wire;
wire [31:0] Adder_To_MUX_wire;
wire [31:0] Jump_MUX_To_MUX_wire;
wire [31:0] MUX_To_JR_MUX;
wire [31:0] MUX_To_PC;				
wire [31:0] RamMuxToRegMux;

// Instruction Fetch wires
wire [31:0] PC_wire;
wire [31:0] PCPlus4FromIF_wire;
wire [31:0] instructionFromIF_wire;//

// Instruction Decode wires
wire [27:0] InstInID;
//wire [4:0] PreWriteRegisterFromID_wire;
//wire [4:0] WriteRegisterFromID_wire;

wire [31:0] NewPCFromID_wire;
wire [31:0] instructionFromID_wire;//

//wire [4:0]  InstructionToWRFromID_wire;
wire [31:0] readData1FromID_wire;
wire [31:0] readData2FromID_wire;
wire [31:0] inmmediateExtendFromID_wire;

wire BranchNEFromID_wire;
wire BranchEQFromID_wire;
wire RegDstFromID_wire;
wire ALUSrcFromID_wire;
wire RegWriteFromID_wire;
wire MemWriteFromID_wire;
wire MemReadFromID_wire;
wire JumpSelectorFromID_wire;
wire JR_FromID_wire;
wire MemtoRegFromID_wire;
wire JalFromID_wire;
wire [2:0] ALUOpFromID_wire;

// Execute wires
wire [3:0] ALUOperation_wire;
wire ZeroEQ;
wire ZeroNE;
wire OR_C;

wire [27:0] InstInEX;
wire [31:0] NewPCFromEX_wire;
wire [31:0] readData1FromEX;
wire [31:0] readData2FromEX;
wire [31:0] instructionFromEX_wire;
wire [31:0] inmmediateExtendFromEX_wire;
wire [4:0] PreWriteRegisterFromEX_wire;
wire [4:0] WriteRegisterFromEX_wire;
wire [4:0] InstructionToWRFromEX_wire;

wire [31:0] adderResultFromEX;
wire [31:0] ALUResultFromEX;
wire zeroFromEX;

wire BranchNEFromEX_wire;
wire BranchEQFromEX_wire;
wire RegDstFromEX_wire;
wire ALUSrcFromEX_wire;
wire RegWriteFromEX_wire;
wire MemWriteFromEX_wire;
wire MemReadFromEX_wire;
wire JumpSelectorFromEX_wire;
wire JR_FromEX_wire;
wire MemtoRegFromEX_wire;
wire JalFromEX_wire;
wire [2:0] ALUOpFromEX_wire;

// Memory access wires
wire [27:0] InstInMEM;
wire [31:0] adderResultFromMEM;
wire [31:0] ALUResultFromMEM;
wire [31:0] NewPCFromMEM_wire;
wire zeroFromMEM;
wire [31:0] readData1FromMEM;
wire [31:0] readData2FromMEM;
wire [4:0] InstructionToWRFromMEM_wire;

wire [31:0] dataMemoryOutFromMEM;

wire BranchNEFromMEM_wire;
wire BranchEQFromMEM_wire;
wire RegDstFromMEM_wire;
wire ALUSrcFromMEM_wire;
wire RegWriteFromMEM_wire;
wire MemWriteFromMEM_wire;
wire MemReadFromMEM_wire;
wire JumpSelectorFromMEM_wire;
wire JR_FromMEM_wire;
wire MemtoRegFromMEM_wire;
wire JalFromMEM_wire;
wire [2:0] ALUOpFromMEM_wire;

// Write back wires
wire [31:0] dataMemoryOutFromWB;
wire [31:0] ALUResultFromWB;
wire [4:0] InstructionToWRFromWB_wire;
wire [31:0] writebackMuxOut;
wire [31:0] NewPCFromWB_wire;

wire BranchNEFromWB_wire;
wire BranchEQFromWB_wire;
wire RegDstFromWB_wire;
wire ALUSrcFromWB_wire;
wire RegWriteFromWB_wire;
wire MemWriteFromWB_wire;
wire MemReadFromWB_wire;
wire JumpSelectorFromWB_wire;
wire JR_FromWB_wire;
wire MemtoRegFromWB_wire;
wire JalFromWB_wire;
wire [2:0] ALUOpFromWB_wire;

//Forward unit wires 

wire [1:0]ForwardA;
wire [1:0]ForwardB;
 //MUX 3 to 1 output
 
wire [31:0]MUX_to_ALU_A;
wire [31:0]MUX_to_ALU_B;

//  /$$      /$$  /$$$$$$   /$$$$$$  /$$$$$$  /$$$$$$        /$$$$$$$$  /$$$$$$  /$$   /$$ /$$$$$$$$ //
// | $$$    /$$$ /$$__  $$ /$$__  $$|_  $$_/ /$$__  $$      |_____ $$  /$$__  $$| $$$ | $$| $$_____/ //
// | $$$$  /$$$$| $$  \ $$| $$  \__/  | $$  | $$  \__/           /$$/ | $$  \ $$| $$$$| $$| $$       //
// | $$ $$/$$ $$| $$$$$$$$| $$ /$$$$  | $$  | $$                /$$/  | $$  | $$| $$ $$ $$| $$$$$    //
// | $$  $$$| $$| $$__  $$| $$|_  $$  | $$  | $$               /$$/   | $$  | $$| $$  $$$$| $$__/    //
// | $$\  $ | $$| $$  | $$| $$  \ $$  | $$  | $$    $$        /$$/    | $$  | $$| $$\  $$$| $$       //
// | $$ \/  | $$| $$  | $$|  $$$$$$/ /$$$$$$|  $$$$$$/       /$$$$$$$$|  $$$$$$/| $$ \  $$| $$$$$$$$ //
// |__/     |__/|__/  |__/ \______/ |______/ \______/       |________/ \______/ |__/  \__/|________/ //


///////////////////////
// INSTRUCTION FETCH //
///////////////////////


PC_Register	PCReg
(
	.clk(clk),
	.reset(reset),
	.NewPC(MUX_To_PC), ///Auqi va la salida del mux de jr
	
	.PCValue(PC_wire) //Address
);

ProgramMemory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROMProgramMemory
(
	.Address(PC_wire),
	.Instruction(instructionFromIF_wire)
);

Adder32bits	PC_Puls_4
(
	.Data0(PC_wire),
	.Data1(4),
	
	.Result(PCPlus4FromIF_wire)
);

IF_ID InstructionFetchOut
(
	.clk(clk),
	.reset(reset),
	.instructionFromIF(instructionFromIF_wire),
	.PCFromIF(PCPlus4FromIF_wire),
	
	.instructionToID(instructionFromID_wire),
	.PCToID(NewPCFromID_wire)
);


////////////////////////
// INSTRUCTION DECODE //
////////////////////////

Control ControlUnit
(
	.Instruction(instructionFromID_wire[5:0]),
	.OP(instructionFromID_wire[31:26]),
	
	.ALUSrc(ALUSrcFromID_wire),
	.RegDst(RegDstFromID_wire),
	.BranchNE(BranchNEFromID_wire),
	.BranchEQ(BranchEQFromID_wire),
	.ALUOp(ALUOpFromID_wire),
	.RegWrite(RegWriteFromID_wire),
	.MemWrite(MemWriteFromID_wire),
	.MemRead(MemReadFromID_wire),
	.MemtoReg(MemtoRegFromID_wire),
	.Jump(JumpSelectorFromID_wire),
	.Jal(JalFromID_wire),
	.Jr(JR_FromID_wire)
);


RegisterFile	Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(RegWriteFromWB_wire),
	.WriteRegister(InstructionToWRFromWB_wire),
	.WriteData(writebackMuxOut),
	.ReadRegister1(instructionFromID_wire[25:21]),
	.ReadRegister2(instructionFromID_wire[20:16]),
	
	.ReadData1(readData1FromID_wire),
	.ReadData2(readData2FromID_wire)

);

SignExtend	SignExtendForConstants
(   
	.DataInput(instructionFromID_wire[15:0]),
	.SignExtendOutput(inmmediateExtendFromID_wire)
);

ShiftLeft2	SHIFT_L2
(
	.DataInput(instructionFromID_wire[25:0]),
	.DataOutput(InstInID)
	//.DataOutput(Jump_Address_MUX_wire) //Este va para el mux de jump

);

	
//	.ALUResultIn(ALUResultFromEX),
//
//	.dataForWRIn(InstructionToWRFromEX_wire),
ID_EX InstructionDecodeOut
(
	.clk(clk),
	.reset(reset),
	.instructionIn(instructionFromID_wire),
	.newPCIn(NewPCFromID_wire),
	.readData1In(readData1FromID_wire),
	.readData2In(readData2FromID_wire),
	.extendedIn(inmmediateExtendFromID_wire),
	.instIn(InstInID),

	
	.NEIn(BranchNEFromID_wire),
	.EQIn(BranchEQFromID_wire),
	.regDstIn(RegDstFromID_wire),
	.ALUSrcIn(ALUSrcFromID_wire),
	.regWriteIn(RegWriteFromID_wire),
	.memWriteIn(MemWriteFromID_wire),
	.memReadIn(MemReadFromID_wire),
	.jumpIn(JumpSelectorFromID_wire),
	.JRIn(JR_FromID_wire),
	.memToRegIn(MemtoRegFromID_wire),
	.JALIn(JalFromID_wire),
	.ALUOpIn(ALUOpFromID_wire),
	
	.instOut(InstInEX),
	.instructionOut(instructionFromEX_wire),
	.newPCOut(NewPCFromEX_wire),
	.readData1Out(readData1FromEX),
	.readData2Out(readData2FromEX),
	.extendedOut(inmmediateExtendFromEX_wire),
	
	.NEOut(BranchNEFromEX_wire),
	.EQOut(BranchEQFromEX_wire),
	.regDstOut(RegDstFromEX_wire),
	.ALUSrcOut(ALUSrcFromEX_wire),
	.regWriteOut(RegWriteFromEX_wire),
	.memWriteOut(MemWriteFromEX_wire),
	.memReadOut(MemReadFromEX_wire),
	.jumpOut(JumpSelectorFromEX_wire),
	.JROut(JR_FromEX_wire),
	.memToRegOut(MemtoRegFromEX_wire),
	.JALOut(JalFromEX_wire),
	.ALUOpOut(ALUOpFromEX_wire)
);


///////////////////////
// 	  EXECUTE		//
///////////////////////

MUX3to1 MUXa(
	.ID_EXtoMUX(readData1FromEX), 
	.EX_MEMtoMUX(ALUResultFromMEM), 
	.MEM_WBtoMUX(writebackMuxOut), 
	.selector(ForwardA), 
	
	.MUX_outPut(MUX_to_ALU_A)
	
);

MUX3to1 MUXb(
	.ID_EXtoMUX(readData2FromEX), 
	.EX_MEMtoMUX(ALUResultFromMEM), 
	.MEM_WBtoMUX(writebackMuxOut),
	.selector(ForwardB),
	
	.MUX_outPut(MUX_to_ALU_B)
		
);

Multiplexer2to1
#(
	.NBits(5)
)
MUX_IntoWriteRegister
(
	.Selector(RegDstFromEX_wire),
	.MUX_Data0(instructionFromEX_wire[20:16]),
	.MUX_Data1(instructionFromEX_wire[15:11]),
	
	.MUX_Output(PreWriteRegisterFromEX_wire)

);

Multiplexer2to1
#(
	.NBits(5)
)
MUX_PreWriteRegister
(
	.Selector(JalFromEX_wire),
	.MUX_Data0(PreWriteRegisterFromEX_wire),
	.MUX_Data1(5'b11111),
	
	.MUX_Output(InstructionToWRFromEX_wire)

);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.Selector(ALUSrcFromEX_wire),
	.MUX_Data0(MUX_to_ALU_B),///fvsefwesf
	.MUX_Data1(inmmediateExtendFromEX_wire),
	
	.MUX_Output(ReadData2OrInmmediate_wire) 
);


ALUControl	ArithmeticLogicUnitControl
(
	.ALUOp(ALUOpFromEX_wire),
	.ALUFunction(instructionFromEX_wire[5:0]),
	.ALUOperation(ALUOperation_wire)
);


ALU	Arithmetic_Logic_Unit 
(
	.ALUOperation(ALUOperation_wire),
	.A(MUX_to_ALU_A),
	.B(ReadData2OrInmmediate_wire),
	.Shamt(instructionFromEX_wire[10:6]),
	
	.Zero(zeroFromEX),
	.ALUResult(ALUResultFromEX)
);

//assign ALUResultOut = ALUResultFromEX;


ShiftLeft2	SHIFT_L2_Sing_Extend
(
	.DataInput(inmmediateExtendFromEX_wire),
	.DataOutput(Shift_To_Adder_wire) //Este va par el adder 2

);

Adder32bits	Add_Shift_2
(
	.Data0(NewPCFromEX_wire),
	.Data1(Shift_To_Adder_wire),
	
	.Result(adderResultFromEX)
);

EX_MEM InstructionExecuteOut
(
	.clk(clk),
	.reset(reset),
	.adderIn(adderResultFromEX),
	.zeroIn(zeroFromEX),
	.ALUResultIn(ALUResultFromEX),
	.readData1In(MUX_to_ALU_A),
	.readData2In(MUX_to_ALU_B),
	.dataForWRIn(InstructionToWRFromEX_wire),
	.instIn(InstInEX),
	
	.newPCIn(NewPCFromEX_wire),
	.newPCOut(NewPCFromMEM_wire),

	.NEIn(BranchNEFromEX_wire),
	.EQIn(BranchEQFromEX_wire),
	.regDstIn(RegDstFromEX_wire),
	.ALUSrcIn(ALUSrcFromEX_wire),
	.regWriteIn(RegWriteFromEX_wire),
	.memWriteIn(MemWriteFromEX_wire),
	.memReadIn(MemReadFromEX_wire),
	.jumpIn(JumpSelectorFromEX_wire),
	.JRIn(JR_FromEX_wire),
	.memToRegIn(MemtoRegFromEX_wire),
	.JALIn(JalFromEX_wire),
	.ALUOpIn(ALUOpFromEX_wire),
	
	.adderOut(adderResultFromMEM),
	.zeroOut(zeroFromMEM),
	.ALUResultOut(ALUResultFromMEM),
	.readData1Out(readData1FromMEM),
	.readData2Out(readData2FromMEM),
	.dataForWROut(InstructionToWRFromMEM_wire),
	.instOut(InstInMEM),
	
	.NEOut(BranchNEFromMEM_wire),
	.EQOut(BranchEQFromMEM_wire),
	.regDstOut(RegDstFromMEM_wire),
	.ALUSrcOut(ALUSrcFromMEM_wire),
	.regWriteOut(RegWriteFromMEM_wire),
	.memWriteOut(MemWriteFromMEM_wire),
	.memReadOut(MemReadFromMEM_wire),
	.jumpOut(JumpSelectorFromMEM_wire),
	.JROut(JR_FromMEM_wire),
	.memToRegOut(MemtoRegFromMEM_wire),
	.JALOut(JalFromMEM_wire),
	.ALUOpOut(ALUOpFromMEM_wire)
);

///////////////////////
//   MEMORY ACCESS	//
///////////////////////

ANDGate AND_EQ
(
	.A(zeroFromMEM),
	.B(BranchEQFromMEM_wire),
	.C(ZeroEQ)
);


ANDGate AND_NE
(
	.A(~zeroFromMEM),
	.B(BranchNEFromMEM_wire),
	.C(ZeroNE)
);

OR_Gate ORGate
(
	.inEQ(ZeroEQ),
	.inNE(ZeroNE),
	.orGateOut(OR_C)
);


Multiplexer2to1
#(
	.NBits(32)
)
Jump_MUX_1
(
	.Selector(OR_C), //Alu Zero
	.MUX_Data0(PCPlus4FromIF_wire),
	.MUX_Data1(adderResultFromMEM),
	
	.MUX_Output(Jump_MUX_To_MUX_wire) // 
);

Multiplexer2to1
#(
	.NBits(32)
)
Jump_MUX_2
(
	.Selector(JumpSelectorFromMEM_wire), //Jump enable de control, tenemos que declararlo en Contro;
	.MUX_Data0(Jump_MUX_To_MUX_wire), 
	.MUX_Data1({NewPCFromMEM_wire[31:28], InstInMEM}),	//Inst ?
	
	.MUX_Output(MUX_To_JR_MUX)
);

Multiplexer2to1
#(
	.NBits(32)
)
JumpReg_MUX
(
	.Selector(JR_FromMEM_wire), //JR enable en Alu control
	.MUX_Data0(MUX_To_JR_MUX), //Read Data 1
	.MUX_Data1(readData1FromMEM), //Mux Jump 2
	
	.MUX_Output(MUX_To_PC) //PC new_PC
);

DataMemory
#(
.DATA_WIDTH(32),
.MEMORY_DEPTH(256)
)
RAM
(
.clk(clk),
.WriteData(readData2FromMEM),
.Address(ALUResultFromMEM), // TO DO FROM RAM DECODER
.MemWrite(MemWriteFromMEM_wire),
.MemRead(MemReadFromMEM_wire),

.ReadData(dataMemoryOutFromMEM)
);

MEM_WB MemoryWriteOut
(
	.clk(clk),
	.reset(reset),
	.dataMemoryIn(dataMemoryOutFromMEM),
	.ALUResultIn(ALUResultFromMEM),
	.dataForWRIn(InstructionToWRFromMEM_wire),
	
	.NEIn(BranchNEFromMEM_wire),
	.EQIn(BranchEQFromMEM_wire),
	.regDstIn(RegDstFromMEM_wire),
	.ALUSrcIn(ALUSrcFromMEM_wire),
	.regWriteIn(RegWriteFromMEM_wire),
	.memWriteIn(MemWriteFromMEM_wire),
	.memReadIn(MemReadFromMEM_wire),
	.jumpIn(JumpSelectorFromMEM_wire),
	.JRIn(JR_FromMEM_wire),
	.memToRegIn(MemtoRegFromMEM_wire),
	.JALIn(JalFromMEM_wire),
	.ALUOpIn(ALUOpFromMEM_wire),
	
	.dataMemoryOut(dataMemoryOutFromWB),
	.ALUResultOut(ALUResultFromWB),
	.dataForWROut(InstructionToWRFromWB_wire),
	
	.NEOut(BranchNEFromWB_wire),
	.EQOut(BranchEQFromWB_wire),
	.regDstOut(RegDstFromWB_wire),
	.ALUSrcOut(ALUSrcFromWB_wire),
	.regWriteOut(RegWriteFromWB_wire),
	.memWriteOut(MemWriteFromWB_wire),
	.memReadOut(MemReadFromWB_wire),
	.jumpOut(JumpSelectorFromWB_wire),
	.JROut(JR_FromWB_wire),
	.memToRegOut(MemtoRegFromWB_wire),
	.JALOut(JalFromWB_wire),
	.ALUOpOut(ALUOpFromWB_wire)
);


///////////////////////
// 	 WRITE BACK		//
///////////////////////



Multiplexer2to1
#(
	.NBits(32)
)
MUX_RAM_ALU
(
	.Selector(MemtoRegFromWB_wire),
	.MUX_Data0(ALUResultFromWB),
	.MUX_Data1(dataMemoryOutFromWB),
	
	.MUX_Output(RamMuxToRegMux)

);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_IntoWriteData
(
	.Selector(JalFromWB_wire),
	.MUX_Data0(RamMuxToRegMux),
	.MUX_Data1(NewPCFromEX_wire),
	
	.MUX_Output(writebackMuxOut)

);

assign ALUResultOut = ALUResultFromMEM;


///////////////////////
//   Forward Unit		//
///////////////////////
Forward_unit FORWAD_UNIT (
   .ID_EX_RegRt_IN(instructionFromEX_wire[20:16]),
   .ID_EX_RegRs_IN(instructionFromEX_wire[25:21]),
	
   .EX_MEM_RegRd_IN(InstructionToWRFromMEM_wire),
	.EX_MEM_regWrite_IN(RegWriteFromMEM_wire),
	
   .MEM_WB_RegRd_IN(InstructionToWRFromWB_wire),
	.MEM_WB_regWrite_IN(RegWriteFromWB_wire),
	
   .forwardA(ForwardA),
	.forwardB(ForwardB)
 );

endmodule
