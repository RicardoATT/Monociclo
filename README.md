# The single-cycle processor

![RTL View](assets/images/unicycleRTL.PNG)
![WaveForm View](assets/images/unicycleWave.PNG)

## Abstract
In a single-cycle processor, each instruction is executed in a single clock cycle, which means that all stages of the instruction cycle, such as instruction fetch, decoding, execution, and storing results, are completed in one clock cycle. All states are updated upon completion of the execution of an instruction. The implementation was carried out using the Quartus environment, which is a software tool produced by Altera for the analysis and synthesis of designs made in Hardware Description Languages (HDL or Hardware Description Language), which for this project Verilog was used. To simulate internal signals, the ModelSim simulator was used, which is free and distributed by Altera. Finally, the Instruction Set Architecture (ISA) used was RISC-V, because it is available under an open source license, which allows anyone to implement and manufacture RISC-V-based hardware without intellectual property restrictions, encouraging innovation and collaboration in hardware development. 

This project is part of the courses offered by the [Largarto Initiative](https://lagarto.ipn.mx/) of the National Polytechnic Institute (IPN).

## Used tools
- Quartus 20.1.1.
- rars 1.6.

## Programming languages
- Verilog.
- Assembly.

## Features
### What does the project contain?
- **ALU:** It's the Arithmetic Logic Unit, which is responsible for performing all the logical and mathematical operations of the processor. Also sets a flag in case a branch occurs.
- **BJControl:** It's the unit that controls the program counter in case a branch exists.
- **Decode:** It's the most complex unit of the processor. Controls how the stages after the register file stage should behave.
- **DecodeALU:** It's the unit that determines which operation the ALU should perform based on the type of instruction it detects.
- **FullAdder:** It's a 1-bit adder with carry in and carry out.
- **FullAdderN:** It's an unit that instance the full adder N times to generate adders greater than 1 bit.
- **IMemory:** It's a memory that stores hexadecimal instructions and outputs them according to the program counter.
- **Memory:** It's a simple data memory that interacts with the register file.
- **Monociclo:** It's the top-level entity that instantiates all the modules to form the unicycle processor.
- **RegisterFile:** It's the unit that uses the registers to perform operations in the ALU.
- **SignExtend:** It's an unit that extends the data size for some instructions, preserving the sign of the data.
- **SignExtendPC:** It's an unit that extends the size of the program counter value.

### How to install the tools?
See the [software installation](docs/softwareInstallation.md)

### How to build and run the project?
See the [build information](docs/buildInformation.md)

### How to simulate bubble sort in the project?
See the [example information](docs/exampleInformation.md)

### How to use and develop instructions in rars?
See the [rars information](docs/rarsInformation.md)
