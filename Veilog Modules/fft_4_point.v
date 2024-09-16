module fft_4_point(clk,rst,in1,in1i,in2,in2i,in3,in3i,in4,in4i,out1,out1i,out2,out2i,out3,out3i,out4,out4i);
    input clk,rst;
    input signed [31:0] in1,in1i,in2,in2i,in3,in3i,in4,in4i;
    output signed [34:0] out1,out1i,out2,out2i,out3,out3i,out4,out4i;

    wire signed[32:0] da1,da1i,da2,da2i,da3,da3i,da4,da4i;
    wire signed[32:0] sa1,sa1i,sa2,sa2i,sa3,sa3i,sa4,sa4i;

    wire signed[34:0] db1,db1i,db2,db2i,db3,db3i,db4,db4i;

    wire signed [32:0] wa1,wa1i,wa2,wa2i;

    // Stage 1

    bfly_stage1 but1(in1, in1i, in3, in3i, da1, da1i, da2, da2i);
    bfly_stage1 but2(in2, in2i, in4, in4i, da3, da3i, da4, da4i);

    dff1 ff1(clk,rst,da1,da1i,da2,da2i,da3,da3i,da4,da4i,sa1,sa1i,sa2,sa2i,sa3,sa3i,sa4,sa4i);

    // Stage 2

    assign wa1 = 1;
    assign wa1i = 0;
    assign wa2 = 0;
    assign wa2i = -1;

    bfly_stage2 but5(sa1,sa1i,sa3,sa3i,wa1,wa1i,db1,db1i,db3,db3i);
    bfly_stage2 but6(sa2,sa2i,sa4,sa4i,wa2,wa2i,db2,db2i,db4,db4i);

    dff2 ff2(clk,rst,db1,db1i,db2,db2i,db3,db3i,db4,db4i,out1,out1i,out2,out2i,out3,out3i,out4,out4i);

endmodule
