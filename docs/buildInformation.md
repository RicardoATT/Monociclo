# Build information
Once the Quartus IDE is installed and the ModelSim simulator is configured, the next step is compile the project.

1. Open Quartus and select the *Open Project* option in the *File* tab.

<p align="center">
  <img src="/assets/images/build1.png" alt="Building project - step 1" title="Building project - step 1">
</p>

2. Select the path where the project was saved and choose the directory of the black box. Select the *.qpf* file and open it.

<p align="center">
  <img src="/assets/images/build2.png" alt="Building project - step 2" title="Building project - step 2">
</p>

3. Click *Start compilation* button (red box) and wait until the compilation has finished. Note that all tasks has been completed without errors.

<p align="center">
  <img src="/assets/images/build7.png" alt="Building project - step 3" title="Building project - step 3">
</p>

## Extra: customization of data and instruction memory

If you want to modify the instruction memory, you have two options:

1. Modify the *Instr_Memo* file in the displayed path.

<p align="center">
  <img src="/assets/images/build3.png" alt="Building project - step 4" title="Building project - step 4">
</p>

2. Add your own instruction memory (*.hex* file) and change the path from the Quartus IDE.

<p align="center">
  <img src="/assets/images/build4.png" alt="Building project - step 5" title="Building project - step 5">
</p>

If you want to modify the data memory, you have two options:

1. Modify the *Data_Mem* file in the displayed path.

<p align="center">
  <img src="/assets/images/build5.png" alt="Building project - step 6" title="Building project - step 6">
</p>

2. Add your own data memory (*.hex* file) and change the path from the Quartus IDE.

<p align="center">
  <img src="/assets/images/build6.png" alt="Building project - step 7" title="Building project - step 7">
</p>

