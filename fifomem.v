`timescale 1ns/1ps

module fifomem (rdata,wdata,waddr,raddr,wclken,wfull,wclk); // Number of mem address bits
 
 parameter DATASIZE = 8; // Memory data word width
 parameter ADDRSIZE = 4;
 output [DATASIZE-1:0] rdata;
 
 input [DATASIZE-1:0] wdata;
 input [ADDRSIZE-1:0] waddr, raddr;
 input wclken, wfull, wclk;
 
 // RTL Verilog memory model
 
 localparam DEPTH = 1<<ADDRSIZE;
 
 reg [DATASIZE-1:0] mem [0:DEPTH-1];
 
 assign rdata = mem[raddr];
 
 always @(posedge wclk)
	if (wclken && !wfull) mem[waddr] <= wdata;

endmodule
 