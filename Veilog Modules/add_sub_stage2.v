module add_sub_stage2
#(parameter n = 34)
( input sel,
    input signed [n-1:0] ar,ai,br,bi,
    output reg signed [n:0] sr,si
);
    always@(sel,ar,ai,br,bi)
    begin
        if(sel)
            begin
                sr=ar+br;
                si=ai+bi;
            end
        else
            begin
                sr=ar-br;
                si=ai-bi;
            end
    end
endmodule