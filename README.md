# Pipelined Processor
Using SystemVerilog HDL, a simple RISC(reduced instruction set computer) architecture MIPS 5-stage pipelined processor has been designed. 
It is a five-stage MIPS with piplined micro-architecture, which is the most common organization for MIPS. It contains the following stages:
1. Fetch
2. Decode
3. Execute
4. Memory
5. Writeback

The pipeline should: fetch instructions to execute from the code memory and increment the program counter by 4; decode each
instruction; select arguments from the register file; compute results; do nothing in the memory stage; and store results back in the register file. 

The design contain a program counter, a separate data and code memories (Harvard architecture), a register file, an ALU, and any other components needed, along with the instruction
decode and control circuits and a hazard unit. At the end of the work, the processor correctly execute all of the **instructions listed below**:
1. lw
2. sw
3. addi
4. add
5. sub
6. and
7. or
8. slt
9. beq
10. j

## But, what is Pipelining or Parallelism?

The speed of a system is characterized by the latency and throughput of information moving through it. A token is a group of inputs that are processed to produce a group of outputs. The latency of a system is the time required for one token to pass through the system from start to end. The throughput is the number of tokens that can be produced per unit time.

The throughput can be improved by processing several tokens at the same time. This is called parallelism, and it comes in two forms: spatial and temporal. 

- With spatial parallelism, multiple copies of the hardware are provided so that multiple tasks can be done at the same time. 
- With temporal parallelism, a task is broken into stages, like an assembly line. Although each task must pass through all stages, a different task will be in each stage at any given time so multiple tasks can overlap.

Temporal parallelism is commonly called pipelining. Spatial parallelism is sometimes just called parallelism, but we will avoid that naming convention because it is ambiguous.

## Datapath Diagram
<p align="center">
<img src="https://github.com/AtomicAnindya/pipelinedprocessor/blob/main/DataPath.png" width ="1000" height="460">
</p>
N.B. Combinational circuit for calculating Jump Address(jumpAddr) has not been shown in the diagram.


## Simulation
<p align="center">
<img src="https://github.com/AtomicAnindya/pipelinedprocessor/blob/main/Sim%20Waveform.PNG" width ="1000" height="350">
</p>
N.B. In the waveform, all the values are in unsigned decimal format.<br>
<p>
The above simulation is done for the following piece of code. The corresponding machine code has been uploaded in the instruction memory through the memory file memfile.mem
</p>
<p align="center">
<img src="https://github.com/AtomicAnindya/pipelinedprocessor/blob/main/Test%20Program.PNG" width ="1000" height="350">
</p>

## Program to find Square Root
A piece of code has been written in MIPS assembly language to find the square root of a proper square number. The corresponding machine code has been uploaded on instruction memory through the memory file square_root.mem. See the image below for the code.


</p>
<p align="center">
<img src="https://github.com/AtomicAnindya/pipelinedprocessor/blob/main/Square_Root.PNG" width ="1000" height="350">
</p>

The code has been run using the designed processor. The input number is 16 and the result has been stored at the memory location 0x0000000c or 12<sub>dec</sub>. You can see the simulation result below.
</p>
<p align="center">
<img src="https://github.com/AtomicAnindya/pipelinedprocessor/blob/main/Square_root_sim.PNG" width ="1000" height="280">
</p>

 
##  Special Case
Conventionally PC (program counter) initially points at the address 0x00400000 but in the design, it is kept at the address 0x00000000.


## Future
In future versions, more instructions will be added.

## Reference 
1. David Harris and Sarah Harris. 2012. Digital Design and Computer Architecture, Second Edition (2nd. ed.). Morgan Kaufmann Publishers Inc., San Francisco, CA, USA.


