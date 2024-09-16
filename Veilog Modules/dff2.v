module dff2
#(parameter n = 35)
(input clk,rst,
    input signed[n-1:0] d1,d2,d3,d4,d5,d6,d7,d8,
    output reg signed[n-1:0] q1,q2,q3,q4,q5,q6,q7,q8
);

    always@(posedge clk,posedge rst)
    if(rst)
        begin
            q1<=0;
            q2<=0;
            q3<=0;
            q4<=0;
            q5<=0;
            q6<=0;
            q7<=0;
            q8<=0;
        end
    else
        begin
            q1<=d1;
            q2<=d2;
            q3<=d3;
            q4<=d4;
            q5<=d5;
            q6<=d6;
            q7<=d7;
            q8<=d8;
        end

endmodule
