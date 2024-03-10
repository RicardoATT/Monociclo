transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/SignExtendPC {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/SignExtendPC/SignExtendPC.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/BJcontrol {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/BJcontrol/BJcontrol.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/DecodeALU {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/DecodeALU/DecodeALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/FullAdderN {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/FullAdderN/FullAdderN.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/FullAdder {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/FullAdder/FullAdder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/SignExtend {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/SignExtend/SignExtend.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/RegisterFile {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/RegisterFile/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/ALU {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/ALU/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/Decode {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/Decode/Decode.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/Monociclo {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/Monociclo/Monociclo.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/IMemory {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/IMemory/IMemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/Memory {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/Memory/Memory.v}

vlog -vlog01compat -work work +incdir+C:/Users/Ricardo\ Aldair\ TT/Documents/RATT_repos/Procesador_monociclo/Monociclo/simulation/modelsim {C:/Users/Ricardo Aldair TT/Documents/RATT_repos/Procesador_monociclo/Monociclo/simulation/modelsim/Monociclo.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Monociclo_vlg_tst

add wave *
view structure
view signals
run 100 ns
