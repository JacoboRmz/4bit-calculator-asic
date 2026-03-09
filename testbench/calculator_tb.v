`timescale 1ns/1ps

module calculator_tb;

reg [3:0] A;
reg [3:0] B;
reg [1:0] OP;

wire [7:0] RESULT;

calculator uut(A,B,OP,RESULT);

integer i;
integer j;
integer k;

initial begin

$dumpfile("wave.vcd");
$dumpvars(0,calculator_tb);

for(k = 0; k < 4; k = k + 1) begin
    OP = k;

    for(i = 0; i < 10; i = i + 1) begin
        A = i;

        for(j = 0; j < 10; j = j + 1) begin
            B = j;
            #10;
        end

    end

end

$finish;

end

endmodule
