module subtractor4(
input [3:0] A,
input [3:0] B,
output [3:0] DIFF
);

wire [3:0] Bcomp;
wire cout;

not(Bcomp[0],B[0]);
not(Bcomp[1],B[1]);
not(Bcomp[2],B[2]);
not(Bcomp[3],B[3]);

// A + (~B) + 1
adder4 add1(A, Bcomp + 1'b1, DIFF, cout);

endmodule

