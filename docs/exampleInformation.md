# Bubble sort simulation

>[!NOTE]
>
>If you want to run another set of instructions, perform the same simulation setup steps.

By default, the project has implemented the bubble sort algorithm with RISC-V instruction in a *.hex* file. To run the simulation, follow these steps:

1. Click on *Assignments* -> *Settings*.

<p align="center">
  <img src="/assets/images/simulationSetup1.png" alt="Simulation setup - step 1" title="Simulation setup - step 1">
</p>

2. Click on *EDA Tools Settings* -> *Simulation*.

<p align="center">
  <img src="/assets/images/simulationSetup2.png" alt="Simulation setup - step 2" title="Simulation setup - step 2">
</p>

3. Click on *Tool name* -> *ModelSim-Altera*. Check all the marked boxes seen in the image. In the *Design Instance Name* section write *i1*. Then, click on the *Test benches* button.

<p align="center">
  <img src="/assets/images/simulationSetup3.png" alt="Simulation setup - step 3" title="Simulation setup - step 3">
</p>

4. In the new window, click the *New* button.

<p align="center">
  <img src="/assets/images/simulationSetup4.png" alt="Simulation setup - step 4" title="Simulation setup - step 4">
</p>

5. Write the names and check the boxes seen in the image. In the *End simulation at* section write *100* and select the *ps* option. Then, click on the button marked in black.

<p align="center">
  <img src="/assets/images/simulationSetup5.png" alt="Simulation setup - step 5" title="Simulation setup - step 5">
</p>

6. Choose the following path within the project. Select the *.vt* file and open it.

<p align="center">
  <img src="/assets/images/simulationSetup6.png" alt="Simulation setup - step 6" title="Simulation setup - step 6">
</p>

7. Click *Add* and then *OK*.

<p align="center">
  <img src="/assets/images/simulationSetup7.png" alt="Simulation setup - step 7" title="Simulation setup - step 7">
</p>

8. Click *OK*.

<p align="center">
  <img src="/assets/images/simulationSetup8.png" alt="Simulation setup - step 8" title="Simulation setup - step 8">
</p>

9. Once the *.vt* file is added, click the black box.

<p align="center">
  <img src="/assets/images/simulationSetup9.png" alt="Simulation setup - step 9" title="Simulation setup - step 9">
</p>

10. Choose the following path within the project. Select the *.do* file and open it.

<p align="center">
  <img src="/assets/images/simulationSetup10.png" alt="Simulation setup - step 10" title="Simulation setup - step 10">
</p>

11. The window should look like this. Click *OK*.

<p align="center">
  <img src="/assets/images/simulationSetup11.png" alt="Simulation setup - step 11" title="Simulation setup - step 11">
</p>

12. Click *Start compilation* button (red box) and wait until the compilation has finished. Note that all tasks has been completed without errors.

<p align="center">
  <img src="/assets/images/simulationSetup12.png" alt="Simulation setup - step 12" title="Simulation setup - step 12">
</p>

13. Click *Tools* -> *Run Simulation Tool* -> *RTL Simulation*.

<p align="center">
  <img src="/assets/images/simulationSetup13.png" alt="Simulation setup - step 13" title="Simulation setup - step 13">
</p>

14. Wait until the simulator finishes loading. Select or expand the *Wave* window.

<p align="center">
  <img src="/assets/images/simulationSetup14.png" alt="Simulation setup - step 14" title="Simulation setup - step 14">
</p>

15. Now you can visualize the operation of each instruction in each stage of the single-cycle processor.
    - If you want to restart the simulation, click on the red button.
    - To advance one clock cycle, click the black button.
    - To perform a continuous simulation click on the blue button.
    - To stop the continuous simulation click the yellow button.
    - Use the buttons in the green box to adjust the simulation view.

<p align="center">
  <img src="/assets/images/simulationSetup15.png" alt="Simulation setup - step 15" title="Simulation setup - step 15">
</p>
