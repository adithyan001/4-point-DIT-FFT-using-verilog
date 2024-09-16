module bfly_stage2
#(parameter n = 33)
(
    input signed [n-1:0] ar,ai,br,bi,wr,wi,
    output signed [n+1:0] p1r,p1i,p2r,p2i
);

    wire signed [n:0] pr,pi;
    multi_stage2 cm(br,bi,wr,wi,pr,pi);
    add_sub_stage2 a1(1'b1,{ar[n-1],ar},{ai[n-1],ai},pr,pi,p1r,p1i);
    add_sub_stage2 a2(1'b0,{ar[n-1],ar},{ai[n-1],ai},pr,pi,p2r,p2i);

endmodule

