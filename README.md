# Asynchronous-FIFO-Design

Note: The design is the implementation of http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf

## Architecture
![image](https://github.com/guavarav/Asynchronous-FIFO-Design/assets/142054506/6a4c3b57-0ae8-4d9a-ad4f-6d7512c9be77)

- **FIFO Memory** is a dual-port buffer. So it can be accessed by both read and write clock domains.
- **winc** and **rinc** signals are enabled by the write and read domains respectively whenever data is to be written into or read from the FIFO buffer.
- **wptr** and **rptr** are pointers with gray code encoding. wptr points to the next location to be written into, while rptr points to the location of the contents being read currently. 
- wptr and rptr are synchronous to write and read domains respectively, and dual-flop synchronization is used to synchronize them to each other's clock domains.
- Assertion of **wfull** by the write domain indicates that wptr has wrapped around the FIFO memory locations and caught up to rptr, meaning the buffer is full. Assertion of **rempty** by the read domain indicates that rptr has caught upto wptr, meaning the buffer is empty. In either case, both pointers are at the same location. The distinction between the two states of the FIFO buffer can be made from the unused MSB of the pointers.

## Implementation
The design described has been implemented in Verilog on Quartus. The RTL and gate-level simulations have been performed using ModelSim, and the results are as follows:
### RTL Synthesis
![image](https://github.com/guavarav/Asynchronous-FIFO-Design/assets/142054506/31e96cf4-728d-491a-96ca-20e19de03d9f)

### RTL simulation
![image](https://github.com/guavarav/Asynchronous-FIFO-Design/assets/142054506/fd54bad0-6dbb-4bd4-b903-bf7d53eb9447)

### Gate-Level simulation
![image](https://github.com/guavarav/Asynchronous-FIFO-Design/assets/142054506/d61394e6-9192-4717-b827-90573c95491a)


