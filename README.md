# The unicycle processor

![RTL View](assets/images/unicycleRTL.PNG)
![WaveForm Vier](assets/images/unicycleWave.PNG)

## Abstract
In a unicycle processor, each instruction is executed in a single clock cycle, which means that all stages of the instruction cycle, such as instruction fetch, decoding, execution, and storing results, are completed in one clock cycle. All states are updated upon completion of the execution of an instruction. The implementation was carried out using the Quartus environment, which is a software tool produced by Altera for the analysis and synthesis of designs made in Hardware Description Languages (HDL or Hardware Description Language), which for this project Verilog was used. To simulate internal signals, the ModelSim simulator was used, which is free and distributed by Altera. Finally, the Instruction Set Architecture (ISA) used was RISC-V, because it is available under an open source license, which allows anyone to implement and manufacture RISC-V-based hardware without intellectual property restrictions, encouraging innovation and collaboration in hardware development.

### Quartus
