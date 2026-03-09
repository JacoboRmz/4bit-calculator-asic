module calculator(

input [3:0] A,
input [3:0] B,
input [1:0] OP,
output reg [7:0] RESULT

);

wire [3:0] SUM;
wire [3:0] DIFF;
wire COUT;

adder4 add1(A,B,SUM,COUT);
subtractor4 sub1(A,B,DIFF);

always @(*) begin

case(OP)

2'b00: RESULT ={3'b000, COUT, SUM};

2'b01: RESULT = DIFF;

2'b10: RESULT = A * B;

2'b11: begin
    if(B == 0)
        RESULT = 0;   // protección división por cero
    else
        RESULT = A / B;
end

endcase

end

endmodule
