Project Title

# SPM-Control-System

Description:

SPM Control System is a file repo that contains the code for the control systems of the Accessible SPM project by Muhammad Armand bin Kushairi for his MEng Project. The MATLAB code computes the complex forward and inverse kinematic calculations for configuring motion of the SPM and communicates with the Arduino code to send computed data and coordinates to the control hardware. Code is adapted from plusAlpha designs with control algorithms originating from a research paper by Iliyas Tursynbek in 2021 at alaris.kz

List of technology used:
- C (Arduino)
- MATLAB
- MATLAB Support Package for Arduino Hardware


Installation instructions:

1) Install Arduino IDE
2) Install MATLAB
3) Install the "MATLAB Support Package for Arduino Hardware" add-on in MATLAB
4) Clone the repo

Usage instructions:

1) Launch both fkm.m and ikm_position_control.m
2) Launch SPMControl.ino
3) Ensure Arduino unit is connected to the computer
4) Ensure COM port and BaudRate of SPMControl.ino is the same as in fkm.m and ikm_position_control.m
5) Run SPMControl.ino
6) Optional: To conduct test run of SPM, comment out the code for direct control and uncomment code for experimental trial before running code.

   File structure of the project:


    ├── ...
    └── SPM-Control-System    # Main folder
        ├── fkm.m        # MATLAB file containing algorithm for computing forward kinematics of SPM
        ├── ikm_position_control.m       # MATLAB file containing algorithm for computing inverse kinematics of SPM
        ├── SPMControl          # Folder containing sql files for milestone 3
        │   └── SPMControl.ino       # Arduino C file containing main functions to control SPM. 
        ├── LICENSE                  # File containing license information  
        └── README.md                # File containing essential information and instructions



License information:
Copyright 2023 Armand Kushairi.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
