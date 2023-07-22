## CI-DISK - Aaron Urrea
 - Course: COMP-362 Operating Systems
 - Professor: Hassine Letaief

# Introduction to Linux Kernel Modules and Character Device Drivers

This project focuses on implementing a disk simulator, which will later be transformed into a character-based device. Additionally, we will develop a driver for the device and install it in Linux as a kernel module. The entire project is designed to be implemented on Linux due to the utilization of Linux-specific techniques for both the drivers and kernel modules.

## Table of Contents
1. [Instructions](#instructions)
2. [Step 1: Implementation](#step-1-implementation)
3. [Step 2: Description](#step-2-description)

## Instructions
- This project must be implemented on Linux, as it involves Linux-specific methods for drivers and kernel modules.
- Incremental solutions must be submitted for each step. Submissions including functionality from later steps will be rejected.
- The provided `CMakeLists.txt` build configuration files can be used for steps 1 and 2. However, for step 3 (the kernel module), the provided `Makefile` must be used instead of `cmake`.

## Step 1: Implementation

### Description
Implement a disk simulator that enables reading and writing information using logical linear addresses.

### Code
The code for the disk simulator is available in the `disk.zip` archive. It provides the disk geometry's declaration, along with function prototypes that must be implemented. While data structures cannot be modified, you can enhance testing if necessary. Refer to the comments in the code for implementation details.

### Step 2: Description

### Description
In this task, you will develop a timer-based tester for the disk simulator implemented in the previous step.

### Code
Download the `timer.zip` archive to familiarize yourself with Linux timers. Examine and compile the code provided. Run the program and understand its functionality.

### Enhancement
Using the code from the timer project, enhance your test program for the disk simulator. The enhanced program should periodically call your disk simulator in response to a random timeout. Each timeout occurrence (timer expiry) should trigger the timeout handler to generate a random disk reference (logical block number), a random number of blocks to write or read (use `rand()%2` to toss a coin), and some random printable content. You can use the function provided in the previous project for generating content to write.

### Output
For each read or write action, your test program should print:
- The action type (read or write)
- The written or read content
- Logical block number
- Corresponding cylinder, head, and sector
- Time of the operation

