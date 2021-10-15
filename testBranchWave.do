onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/DUV/PCReg/reset
add wave -noupdate /MIPS_Processor_TB/DUV/PCReg/clk
add wave -noupdate /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/DUV/PCReg/NewPC
add wave -noupdate /MIPS_Processor_TB/DUV/PCReg/PCValue
add wave -noupdate /MIPS_Processor_TB/DUV/ROMProgramMemory/Instruction
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/WriteData
add wave -noupdate /MIPS_Processor_TB/DUV/Register_File/WriteRegister
add wave -noupdate /MIPS_Processor_TB/DUV/ROMProgramMemory/Address
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemRead
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/ReadData
add wave -noupdate /MIPS_Processor_TB/DUV/RAM/WriteData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 65
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {20 ps}
