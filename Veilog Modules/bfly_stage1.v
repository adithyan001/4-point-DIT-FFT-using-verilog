module bfly_stage1
#(parameter n = 32)
(
    input signed [n-1:0] ar,ai,br,bi,
    output signed [n:0] p1r,p1i,p2r,p2i
);

    add_sub_stage1 a1(1'b1,ar,ai,br,bi,p1r,p1i);
    add_sub_stage1 s1(1'b0,ar,ai,br,bi,p2r,p2i);

endmodule
