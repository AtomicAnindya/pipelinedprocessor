# Pipelined Processor
Using SystemVerilog HDL, a simple RISC(reduced instruction set computer) architecture MIPS 5-stage pipelined processor has been designed. 
## Functionalities 
The processor is able to perform the following instructions:<br>
- lw
- sw
- addi
- add
- sub
- and
- or
- slt
- beq

 
##  Exceptions
Conventionally PC (program counter) initially points at the address 0x00400000 but in the design, it is kept at the address 0x00000000.
Therefore the machine code for the line "j end" differs slightly from the code that would be generated by a MIPS simulator.<br>

## Future
In future versions, more instructions will be added.

## Performance 
The lw instruction takes the longest time that is 5 clock cycles. Overall CPI index is expected to be better than that as all other instructions takes less clock cycles than that.
