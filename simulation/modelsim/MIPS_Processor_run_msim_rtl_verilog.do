transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/SignExtend.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/ShiftLeft2.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/Register.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/PC_Register.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/OR_Gate.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/MUXRegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/Multiplexer2to1.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/MIPS_Processor.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/DecoderRegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/DataMemory.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/Control.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/ANDGate.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/ALUControl.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/ALU.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/Adder32bits.v}
vlog -vlog01compat -work work +incdir+C:/MIPSProjects/MIPSProcessor/Sources {C:/MIPSProjects/MIPSProcessor/Sources/ProgramMemory.v}

