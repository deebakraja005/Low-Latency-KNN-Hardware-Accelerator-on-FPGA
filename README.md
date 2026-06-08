# Low-Latency KNN Hardware Accelerator on FPGA

## Overview

This project implements a **Low-Latency K-Nearest Neighbors (KNN) Hardware Accelerator** on FPGA using Verilog HDL. The design is optimized to perform fast distance calculations and nearest-neighbor classification directly in hardware, reducing inference latency compared to software-based implementations.

The accelerator demonstrates how machine learning algorithms can be mapped onto FPGA architectures to achieve high-speed, parallel processing suitable for real-time embedded and edge AI applications.

---

## Features

- FPGA-based implementation of the K-Nearest Neighbors (KNN) algorithm
- Low-latency distance computation
- Parallel hardware architecture
- Synthesizable Verilog design
- Modular and scalable implementation
- Testbench included for functional verification
- FPGA constraint file provided for deployment

---

## Project Architecture

The system consists of the following modules:

### 1. Dataset ROM (`dataset_rom.v`)
- Stores the training dataset inside FPGA memory.
- Provides feature vectors to the distance computation unit.
- Can be modified to accommodate different datasets.

### 2. Distance Unit (`distance_unit.v`)
- Calculates the distance between input samples and stored training samples.
- Designed for high-speed arithmetic operations.
- Supports parallel distance evaluation.

### 3. KNN Controller (`knn_controller.v`)
- Controls data flow between modules.
- Manages distance calculations and nearest-neighbor selection.
- Generates classification outputs.

### 4. Top-Level Module (`knn_top.v`)
- Integrates all submodules.
- Serves as the main FPGA entry point.
- Handles system-level communication and control.

### 5. Testbench (`tb_knn.v`)
- Provides simulation environment.
- Applies test vectors and verifies functionality.
- Useful for behavioral verification before synthesis.

### 6. Constraints File (`knn_constraints.xdc`)
- FPGA pin assignments and timing constraints.
- Used during implementation and bitstream generation.

---

## Project Structure
Low-Latency-KNN-Hardware-Accelerator-on-FPGA/
│
├── dataset_rom.v
├── distance_unit.v
├── knn_controller.v
├── knn_top.v
├── tb_knn.v
├── knn_constraints.xdc
└── README.md


---

## Design Flow

1. Input feature vector is provided to the accelerator.
2. Training samples are fetched from Dataset ROM.
3. Distance Unit computes distances between the input vector and stored samples.
4. KNN Controller identifies the nearest neighbors.
5. Classification result is generated.
6. Output can be used by external FPGA logic or embedded systems.

---
## FPGA Implementation
## Vivado Workflow
  1. Create a new Vivado project.
  2. Add all Verilog source files.
  3. Add the constraint file:
               knn_constraints.xdc
  4. Run:
         Synthesis
         Implementation
         Bitstream Generation
  5. Program the target FPGA device.

## Applications
    Edge AI systems
    Real-time classification
    Pattern recognition
    Embedded machine learning
    Sensor data analytics
    Smart IoT devices
    Hardware acceleration research

## Performance Goals

    The accelerator is designed with the following objectives:

      Low inference latency
      Reduced software overhead
      Efficient FPGA resource utilization
      High throughput through parallel processing
      Scalable architecture for larger datasets

    Actual performance depends on:

      FPGA device used
      Dataset size
      Number of features
      Clock frequency
      K value selected

## Future Improvements
    Support for configurable K values
    Larger datasets using BRAM
    Pipelined distance computation
    Fixed-point optimization
    AXI interface integration
    DMA-based data transfer
    Hardware/software co-design using embedded processors
    Support for multiple distance metrics

## Requirements
  Hardware
    Xilinx FPGA (Artix-7, Kintex-7, Zynq, or compatible devices)
  Software
    Vivado Design Suite
    ModelSim / QuestaSim (optional)
    Verilog HDL compatible simulator

## Educational Value

  This project demonstrates:

    FPGA-based machine learning acceleration
    Verilog HDL design methodologies
    Hardware implementation of KNN classification
    Memory and controller design
    Digital system verification using testbenches

It can serve as a reference for students, researchers, and FPGA developers interested in hardware acceleration of machine learning algorithms.

## Author : Deebak Raja

Electronics and Communication Engineering (ECE)

Project: Low-Latency KNN Hardware Accelerator on FPGA
