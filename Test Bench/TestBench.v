`timescale 1ns / 1ps

module TestBench();
reg clk =0;
reg rst;
reg signed [31:0] in1,in1i,in2,in2i,in3,in3i,in4,in4i;
wire signed [34:0] out1,out1i,out2,out2i,out3,out3i,out4,out4i;

fft_4_point DUT(clk,rst,in1,in1i,in2,in2i,in3,in3i,in4,in4i,out1,out1i,out2,out2i,out3,out3i,out4,out4i);
 
always
#5 clk = ~clk;

initial
begin

// first input

rst = 1;
in1 = 0; in1i = 0;
in2 = 1; in2i = 0;
in3 = 2; in3i = 0;
in4 = 3; in4i = 0;

#13 rst = 0;
 
// second input
#10 in1 = 1; in1i = 0;
in2 = 1; in2i = 0;
in3 = 0; in3i = 0;
in4 = 0; in4i = 0;

// third input
#10 in1 = 1; in1i = 0;
in2 = 0; in2i = 0;
in3 = -1; in3i = 0;
in4 = 0; in4i = 0;

#100 $display("\n*******************************\n");
end

initial
$monitor("\n*******************************\nTime = %0t\n\n { Y0 , Y1, Y2 , Y3 } = { %0d + %0d j , %0d + %0d , %0d + %0d , %0d + %0d j }",$time,out1,out1i,out2,out2i,out3,out3i,out4,out4i);


endmodule
