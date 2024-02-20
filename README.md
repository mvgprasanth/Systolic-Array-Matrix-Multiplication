# Systolic-Array-Matrix-Multiplication
Implementation of weight stationary systolic array which has a size of 4x4(scalable) to 256X256.

The MMU (Matrix Multiplication Unit) module is the top-level module that represents a systolic array for
matrix multiplication. It takes several inputs, processes them systolically through multiple MAC (Multiply-Accumulate)
units arranged in a 2D array, and produces an output accumulator result.
The MAC (Multiply-Accumulate) module represents a single multiply-accumulate unit. It takes inputs,
multiplies data with weight, accumulates the results, and produces output data and accumulation. Overall,
the MMU module orchestrates the interaction between multiple MAC modules, arranging them in a
systolic array fashion to perform matrix multiplication. The MAC module represents a single multiplyaccumulate operation, with control for weight loading and accumulator reset. The design as a whole is intended for matrix multiplication operations in a systolic array configuration. Careful data and weight flow management ensures system correctness, confirmed through rigorous testing and verification procedures. Moving forward, DC synthesis using the ASAP7 PDK delivered comprehensive reports on area, timing, power, synthesis, and potential violations. Post synthesis gate level simulation results were also verified. This analysis unveils deeper insights into the design's performance and behavior. The detailed explination can be verified in the results.pdf. 

