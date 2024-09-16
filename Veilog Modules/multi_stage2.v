module multi_stage2
#(parameter n = 33)
(
    input signed [n-1:0] ar,ai,br,bi,
    output signed [n:0] pr,pi
);

    wire signed [2*n-1:0] tr,ti;
    assign tr= ar*br - ai*bi;
    assign ti= ar*bi + ai*br;

    assign pr = tr[n:0];
    assign pi = ti[n:0];

endmodule

