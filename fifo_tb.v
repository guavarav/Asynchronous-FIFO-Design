`timescale 1ns/1ps

module fifo_tb ();

 wire [7:0] rdata;
 wire wfull;
 wire rempty;
 
 reg [7:0] wdata;
 reg winc, wclk, wrst_n;
 reg rinc, rclk, rrst_n;
 

 
 fifo1 DUT (rdata, wfull, rempty, wdata, winc, wclk, wrst_n, rinc, rclk, rrst_n);
 
 initial begin
  wclk <= 0; rclk <= 0; wrst_n <= 0; rrst_n <= 0;winc <= 1; rinc <= 0;
  
	#10 wrst_n = 1;rrst_n = 1;
	
   #8 wdata = 8'h01;
   #20 wdata = 8'h02;
	#20 wdata = 8'h03;
	#20 wdata = 8'h04;
	#20 wdata = 8'h05;
	#20 rinc <= 1;winc <= 0;
  #500 $stop;
 end
 
 always begin
 #10 wclk <= !wclk;
 
 end
 
  always begin
 #20 rclk <= !rclk;
 

 end
 
 
 
 endmodule
 

