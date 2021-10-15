onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate /MIPS_Processor_TB/PortIn
add wave -noupdate /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/PortOut
add wave -noupdate -divider {A Tower}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[0]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[4]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[8]}
add wave -noupdate -divider {B Tower}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[32]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[36]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[40]}
add wave -noupdate -divider {C Tower}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[64]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[68]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[72]}
add wave -noupdate -divider things
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/InstructionExecuteOut/memWriteOut
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/InstructionExecuteOut/ALUResultOut
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/InstructionExecuteOut/readData2Out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {42 ps}
