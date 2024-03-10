# Software installation

This section shows the installation of the necessary tools to run and simulate the project. The tools installation was done on Windows 10, however, the software is compatible with Windows 11 and Debian-based systems.

## Quartus
Quartus is an Integrated Development Environment (IDE) that provides tools and resources to design, simulate, implement, and develop programmable logic devices. The programming languages it supports are hardware-oriented such as VHDL, Verilog and SystemVerilog. The software also integrates the ModelSim tool, which is a hardware simulator used in the design and verification of digital circuits. This project was developed in Quartus using the Verilog language.

>[!NOTE]
>
>The project runs only using Quartus 20.1.1 or higher.

1. [Download Quartus 20.1.1](https://www.intel.com/content/www/us/en/software-kit/660907/intel-quartus-prime-lite-edition-design-software-version-20-1-1-for-windows.html).

<p align="center">
  <img src="/assets/images/quartusInstallation1.png" alt="Quartus installation - step 1" title="Quartus installation - step 1">
</p>

2. Extract the *.zip* file into a temporary directory.

<p align="center">
  <img src="/assets/images/quartusInstallation2.png" alt="Quartus installation - step 2" title="Quartus installation - step 2">
</p>

3. Run *setup.bat*.

<p align="center">
  <img src="/assets/images/quartusInstallation3.png" alt="Quartus installation - step 3" title="Quartus installation - step 3">
</p>

4. With the installer open, click *Next*.

<p align="center">
  <img src="/assets/images/quartusInstallation4.png" alt="Quartus installation - step 4" title="Quartus installation - step 4">
</p>

5. Accept the license agreements and click *Next*.

<p align="center">
  <img src="/assets/images/quartusInstallation5.png" alt="Quartus installation - step 5" title="Quartus installation - step 5">
</p>

6. Select an installation directory (you can leave it as the default) and click *Next*.

<p align="center">
  <img src="/assets/images/quartusInstallation6.png" alt="Quartus installation - step 6" title="Quartus installation - step 6">
</p>

7. Note that all the boxes are selected except the last one and click *Next* (if you only want to simulate the project using ModelSim, you can uncheck the *Devices* box).

<p align="center">
  <img src="/assets/images/quartusInstallation7.png" alt="Quartus installation - step 7" title="Quartus installation - step 7">
</p>

8. Click *Next* and wait until the installation is finished.

<p align="center">
  <img src="/assets/images/quartusInstallation8.png" alt="Quartus installation - step 8" title="Quartus installation - step 8">
</p>

9. Because this project was only implemented with the ModelSim simulation tool, uncheck the *Launch USB Blaster II driver installation* box. and click *Finish*

<p align="center">
  <img src="/assets/images/quartusInstallation9.png" alt="Quartus installation - step 9" title="Quartus installation - step 9">
</p>

10. Quartus tool has been installed. However, it is required to configure the ModelSim tool.

<p align="center">
  <img src="/assets/images/quartusInstallation10.png" alt="Quartus installation - step 10" title="Quartus installation - step 10">
</p>

## ModelSim

1. With the Quartus tool open, click the *Tools* tab and then *Options*.

<p align="center">
  <img src="/assets/images/modelsimConfiguration1.png" alt="ModelSim Configuration - step 1" title="ModelSim Configuration - step 1">
</p>

2. Click on the *EDA Tools Options* section and select the directory shown in the image in the *ModelSim-Altera* section. Finally click *OK*.

<p align="center">
  <img src="/assets/images/modelsimConfiguration2.png" alt="ModelSim Configuration - step 2" title="ModelSim Configuration - step 2">
</p>

Finally, the tool has been installed and configured correctly.

## Additional

If you have knowledge of RISC-V and want to create an algorithm to test on the processor, it is suggested to install [Java 8](https://www.java.com/es/download/ie_manual.jsp) to use the [rars tool](https://github.com/TheThirdOne/rars/releases/tag/v1.6) (A RISC-V Assembler and Runtime Simulator). For more information about this tool, [click here](https://github.com/TheThirdOne/rars)

1. [Download Java 8](https://www.java.com/es/download/ie_manual.jsp).

<p align="center">
  <img src="/assets/images/javaInstallation1.png" alt="Java installation - step 1" title="Java installation - step 1">
</p>

2. Run the *.exe* file as admin.

<p align="center">
  <img src="/assets/images/javaInstallation2.png" alt="Java installation - step 2" title="Java installation - step 2">
</p>

3. Click *Install* and wait until the installation is finished.

<p align="center">
  <img src="/assets/images/javaInstallation3.png" alt="Java installation - step 3" title="Java installation - step 3">
</p>

4. Click *Close*.

<p align="center">
  <img src="/assets/images/javaInstallation4.png" alt="Java installation - step 4" title="Java installation - step 4">
</p>

5. [Download rars tool](https://github.com/TheThirdOne/rars/releases/tag/v1.6).

<p align="center">
  <img src="/assets/images/rarsInstallation1.png" alt="rars installation - step 1" title="rars installation - step 1">
</p>

6. Run the *.jar* file.

<p align="center">
  <img src="/assets/images/rarsInstallation2.png" alt="rars installation - step 2" title="rars installation - step 2">
</p>

7. Now, you can use the tool to create assembly language programs for the RISC-V Instruction Set Architecture and simulate their operation.

<p align="center">
  <img src="/assets/images/rarsInstallation3.png" alt="rars installation - step 2" title="rars installation - step 3">
</p>

>[!NOTE]
>
>The rars tool runs only using Java 8 version
