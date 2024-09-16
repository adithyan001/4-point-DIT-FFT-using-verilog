# Radix-2 4-Point Decimation in Time Fast Fourier Transform (DIT FFT) using Verilog HDL

## 1. Introduction
The Fast Fourier Transform (FFT) is a fundamental algorithm in digital signal processing, enabling efficient computation of the Discrete Fourier Transform (DFT). The FFT reduces the complexity of calculating the DFT from 𝑂(𝑁^2) to 𝑂(𝑁*log𝑁), making it highly suitable for applications involving large datasets or real-time signal processing.

### Block diagram for 4 Point DIT FFT

![Length-4-DIT-radix-2-FFT](https://github.com/user-attachments/assets/eb1bf79e-d5b1-4e99-8aa2-64761049393e)

## 2. Objective
The aim of this project is to implement a radix-2 4-point Decimation in Time (DIT) FFT in a pipelined architecture using Verilog HDL in Vivado.

## 3. Pipelining Strategy
* **Pipeline Stages** : The FFT computation is broken down into stages, with each butterfly operation taking place at different pipeline stages. The D flip-flops ensure intermediate results are properly propagated to the next stage.
* **Resource Utilization** : The pipeline approach reduces latency by allowing new data to enter the pipeline while previous data is still being processed, enhancing throughput without increasing clock frequency.

## 4. Implementation Details and Module Overview
* **HDL**  : Verilog
* **Tool** : Vivado Design Suite

### Inputs:
* clk and rst are the clock and active high reset signals for controlling the sequential elements (D flip-flops).
* in1, in1i, in2, in2i, in3, in3i, in4, in4i are the 32-bit signed real and imaginary input values representing the four complex points.

### Outputs:
* out1, out1i, out2, out2i, out3, out3i, out4, out4i are the 35-bit signed real and imaginary outputs representing the transformed values after the FFT.

### Pipeline Stages:
1. **Stage 1:** 
> * bfly_stage1 is used to perform the butterfly computation for the first stage.
> * The butterflies operate on inputs in1, in3 and in2, in4.
> * Outputs from this stage are denoted as da1, da1i, da2, da2i, etc., which are 33-bit signed intermediate results from the first butterfly stage.
> * These outputs are passed through a D flip-flop stage (dff1) to store the intermediate results before moving to the next pipeline stage.

2. **Stage 2:**
> * In this stage, the twiddle factors (wa1, wa1i, wa2, wa2i) are assigned:
> > * wa1 = 1 and wa1i = 0 correspond to no rotation (identity).
> > * wa2 = 0 and wa2i = -1 correspond to a rotation by -90 degrees (or multiplying by -j).
> * The second set of butterflies, bfly_stage2, computes the FFT with the twiddle factors applied.
> * The intermediate results are stored in signals db1, db1i, db2, db2i, etc., which are then passed through another D flip-flop stage (dff2).

3. **Final Output:**
> After the second stage of D flip-flops, the final FFT output is generated and assigned to out1, out1i, out2, out2i, out3, out3i, and out4, out4i.

### Explanation of Major Components:
* Butterfly Stages (bfly_stage1 and bfly_stage2): These modules implement the butterfly operations, which are the core computations in FFT algorithms. They take pairs of inputs (real and imaginary parts) and perform additions, subtractions, and twiddle factor multiplications.

* D Flip-Flop Stages (dff1 and dff2): These are sequential elements that store intermediate data between the pipeline stages, ensuring proper synchronization and allowing the pipelined architecture to process data in a sequential manner.

## 5. Simulation and Testing
A Verilog testbench was used to simulate the design with various input signals to verify its functionality. Initially, a reset signal was asserted and then de-asserted after one clock period. The testbench fed three different sets of inputs: {0,1,2,3}, {1,1,0,0}, and {1,0,-1,0}.

### Simulation Results:

1. **Observed Output in the TCL Console :**

![Output](https://github.com/user-attachments/assets/0d0bd4e3-8eb1-47f9-8568-8d61fca9b396)

2. **Output Waveform :**

![Waveform](https://github.com/user-attachments/assets/69089abd-1ea2-427c-bfe0-603dc69d7a51)

3. **Schematic :**

![RTL Schematics](https://github.com/user-attachments/assets/b33775ef-dd3c-4529-9fa2-8e9be0817ae7)

## Results and Conclusion
The Decimation in Time (DIT) FFT algorithm was successfully implemented in Verilog. Correct frequency domain results were obtained for each input test case. The pipelined implementation of the radix-2 4-point DIT FFT achieved faster computation, leveraging the parallelism introduced by the pipeline.