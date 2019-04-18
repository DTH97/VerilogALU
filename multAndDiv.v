module Multiply16(A,B,P) ;
  input [15:0] A, B ;
  output [31:0] P ;
  
  // form partial products 
  wire [15:0] pp0 = A & {16{B[0]}} ;
  wire [15:0] pp1 = A & {16{B[1]}} ;
  wire [15:0] pp2 = A & {16{B[2]}} ;
  wire [15:0] pp3 = A & {16{B[3]}} ;
  wire [15:0] pp4 = A & {16{B[4]}} ;
  wire [15:0] pp5 = A & {16{B[5]}} ;
  wire [15:0] pp6 = A & {16{B[6]}} ;
  wire [15:0] pp7 = A & {16{B[7]}} ;
  wire [15:0] pp8 = A & {16{B[8]}} ;
  wire [15:0] pp9 = A & {16{B[9]}} ;
  wire [15:0] pp10 = A & {16{B[10]}} ;
  wire [15:0] pp11 = A & {16{B[11]}} ;
  wire [15:0] pp12 = A & {16{B[12]}} ;
  wire [15:0] pp13 = A & {16{B[13]}} ;
  wire [15:0] pp14 = A & {16{B[14]}} ;
  wire [15:0] pp15 = A & {16{B[15]}} ;
  

  wire c_out1, c_out2, c_out3, c_out4, c_out5, c_out6, c_out7, c_out8, c_out9;
  wire c_out10, c_out11, c_out12, c_out13, c_out14, c_out15;
  wire [15:0] s1, s2, s3, s4, s5, s6, s7, s8, s9;
  wire [15:0] s10, s11, s12, s13, s14, s15;
  
  Full_Adder_16 #(16) add1(1'B0, pp1, {1'B0,pp0[15:1]}, s1, cout_1);
  Full_Adder_16 #(16) add2(1'b0, pp2, {cout_1,s1[15:1]}, s2, cout_2);
  Full_Adder_16 #(16) add3(1'b0, pp3, {cout_2,s2[15:1]}, s3, cout_3);
  Full_Adder_16 #(16) add4(1'B0, pp4, {cout_3,s3[15:1]}, s4, cout_4);
  Full_Adder_16 #(16) add5(1'b0, pp5, {cout_4,s4[15:1]}, s5, cout_5);
  Full_Adder_16 #(16) add6(1'b0, pp6, {cout_5,s5[15:1]}, s6, cout_6);
  Full_Adder_16 #(16) add7(1'b0, pp7, {cout_6,s6[15:1]}, s7, cout_7);
  Full_Adder_16 #(16) add8(1'b0, pp8, {cout_7,s7[15:1]}, s8, cout_8);
  Full_Adder_16 #(16) add9(1'b0, pp9, {cout_8,s8[15:1]}, s9, cout_9);
  Full_Adder_16 #(16) add10(1'b0, pp10, {cout_9,s9[15:1]}, s10, cout_10);
  Full_Adder_16 #(16) add11(1'b0, pp11, {cout_10,s10[15:1]}, s11, cout_11);
  Full_Adder_16 #(16) add12(1'b0, pp12, {cout_11,s11[15:1]}, s12, cout_12);
  Full_Adder_16 #(16) add13(1'b0, pp13, {cout_12,s12[15:1]}, s13, cout_13);
  Full_Adder_16 #(16) add14(1'b0, pp14, {cout_13,s13[15:1]}, s14, cout_14);
  Full_Adder_16 #(16) add15(1'b0, pp15, {cout_14,s14[15:1]}, s15, cout_15);
  
  // collect the result
  assign P = {cout_15, s15, s14[0], s13[0], s12[0], s11[0], s10[0], s9[0],
  	 s8[0], s7[0], s6[0], s5[0], s4[0], s3[0], s2[0], s1[0], pp0[0]} ;
  	 
endmodule

module Divide_by_Operator(A, B, Quotient);
	input [15:0] A, B;
	output wire [15:0] Quotient;
	
	assign Quotient = A / B;
endmodule
