module Identity_1( in, out );
    input wire in;
    output reg out;
    
    always @(*)
        begin
            out = in;
        end
endmodule

module Identity_8( in, out );
    input wire[7:0] in;
    output reg[7:0] out;
    
    always @(*)
        begin
            out = in;
        end
endmodule

module Identity_16( in, out );
    input wire[15:0] in;
    output wire[15:0] out;
    
    Identity_8 I0( in[7:0], out[7:0] );
    Identity_8 I1( in[15:8], out[15:8] );
endmodule

module Dup_1( in, out1, out2 );
    input wire in;
    output reg out1, out2; 
    
    always @(*) begin
        out1 <= in;
        out2 <= in;
    end
endmodule

module Dup_8( in, out1, out2 );
    input wire[7:0] in;
    output wire[7:0] out1, out2; 
    
    Dup_1 D0( in[0], out1[0], out2[0] );
    Dup_1 D1( in[1], out1[1], out2[1] );
    Dup_1 D2( in[2], out1[2], out2[2] );
    Dup_1 D3( in[3], out1[3], out2[3] );
    Dup_1 D4( in[4], out1[4], out2[4] );
    Dup_1 D5( in[5], out1[5], out2[5] );
    Dup_1 D6( in[6], out1[6], out2[6] );
    Dup_1 D7( in[7], out1[7], out2[7] );
endmodule

module Dup_16( in, out1, out2 );
    input wire[15:0] in;
    output wire[15:0] out1, out2; 
    
    Dup_8 D0( in[7:0], out1[7:0], out2[7:0] );
    Dup_8 D1( in[15:8], out1[15:8], out2[15:8] );
endmodule

module Pad_zero_left_2_8( in, out );
    input wire[1:0] in;
    output reg[7:0] out;
    
    always @(*)
        begin
            out <= 0;
            out[1:0] <= in;
        end
endmodule

module Pack_2_1( in0, in1, out);
    input wire in0, in1;
    output reg[1:0] out;
    
    always @(*)
    begin
        out[0] <= in0;
        out[1] <= in1;
    end
endmodule

module Pack_2_8( in0, in1, out );
    input wire[7:0] in0, in1;
    output reg[1:0][7:0] out;
    
    always @(*)
    begin
        out[0][0] = in0[0];
        out[1][0] = in1[0];
        out[0][1] = in0[1];
        out[1][1] = in1[1];
        out[0][2] = in0[2];
        out[1][2] = in1[2];
        out[0][3] = in0[3];
        out[1][3] = in1[3];
        out[0][4] = in0[4];
        out[1][4] = in1[4];
        out[0][5] = in0[5];
        out[1][5] = in1[5];
        out[0][6] = in0[6];
        out[1][6] = in1[6];
        out[0][7] = in0[7];
        out[1][7] = in1[7];
    end
endmodule

module Pack_2_16( in0, in1, out );
    input wire[15:0] in0, in1;
    output reg[1:0][15:0] out;
    
    always @(*)
    begin
        out[0][0] = in0[0];
        out[1][0] = in1[0];
        out[0][1] = in0[1];
        out[1][1] = in1[1];
        out[0][2] = in0[2];
        out[1][2] = in1[2];
        out[0][3] = in0[3];
        out[1][3] = in1[3];
        out[0][4] = in0[4];
        out[1][4] = in1[4];
        out[0][5] = in0[5];
        out[1][5] = in1[5];
        out[0][6] = in0[6];
        out[1][6] = in1[6];
        out[0][7] = in0[7];
        out[1][7] = in1[7];
        out[0][8] = in0[8];
        out[1][8] = in1[8];
        out[0][9] = in0[9];
        out[1][9] = in1[9];
        out[0][10] = in0[10];
        out[1][10] = in1[10];
        out[0][11] = in0[11];
        out[1][11] = in1[11];
        out[0][12] = in0[12];
        out[1][12] = in1[12];
        out[0][13] = in0[13];
        out[1][13] = in1[13];
        out[0][14] = in0[14];
        out[1][14] = in1[14];
        out[0][15] = in0[15];
        out[1][15] = in1[15];
    end
endmodule

module Not_1( in, out );
    input wire in;
    output reg out;

    always @(*) 
    begin
        out = !in;
    end
endmodule

module Not_8( in, out );
    input wire[7:0] in;
    output wire[7:0] out;

    Not_1 N0( in[0], out[0] );
    Not_1 N1( in[1], out[1] );
    Not_1 N2( in[2], out[2] );
    Not_1 N3( in[3], out[3] );
    Not_1 N4( in[4], out[4] );
    Not_1 N5( in[5], out[5] );
    Not_1 N6( in[6], out[6] );
    Not_1 N7( in[7], out[7] );
endmodule

module Not_16( in, out );
    input wire[15:0] in;
    output wire[15:0] out;

    Not_8 N0( in[7:0], out[7:0] );
    Not_8 N1( in[15:8], out[15:8] );

endmodule

module Or_1( A, B, out );
    input wire A, B;
    output reg out;

    always @(*) 
    begin
        out <= A | B;
    end
endmodule

module Or_8( A, B, out );
    input wire[7:0] A, B;
    output wire[7:0] out;

    Or_1 O0( A[0], B[0], out[0] );
    Or_1 O1( A[1], B[1], out[1] );
    Or_1 O2( A[2], B[2], out[2] );
    Or_1 O3( A[3], B[3], out[3] );
    Or_1 O4( A[4], B[4], out[4] );
    Or_1 O5( A[5], B[5], out[5] );
    Or_1 O6( A[6], B[6], out[6] );
    Or_1 O7( A[7], B[7], out[7] );

endmodule

module Or_16( A, B, out );
    input wire[15:0] A, B;
    output wire[15:0] out;

    Or_8 O0( A[7:0], B[7:0], out[7:0] );
    Or_8 O1( A[15:8], B[15:8], out[15:8] );

endmodule

module Xor_1( A, B, out );
    input wire A, B;
    output reg out;

    always @(*) 
    begin
        out <= A ^ B;
    end
endmodule

module Xor_8( A, B, out );
    input wire[7:0] A, B;
    output wire[7:0] out;

    Xor_1 X0( A[0], B[0], out[0] );
    Xor_1 X1( A[1], B[1], out[1] );
    Xor_1 X2( A[2], B[2], out[2] );
    Xor_1 X3( A[3], B[3], out[3] );
    Xor_1 X4( A[4], B[4], out[4] );
    Xor_1 X5( A[5], B[5], out[5] );
    Xor_1 X6( A[6], B[6], out[6] );
    Xor_1 X7( A[7], B[7], out[7] );

endmodule

module Xor_16( A, B, out );
    input wire[15:0] A, B;
    output wire[15:0] out;

    Xor_8 X0( A[7:0], B[7:0], out[7:0] );
    Xor_8 X1( A[15:8], B[15:8], out[15:8] );

endmodule

module And_1( A, B, out );
    input wire A, B;
    output reg out;

    always @(*) 
    begin
        out <= A & B;
    end
endmodule

module And_8( A, B, out );
    input wire[7:0] A, B;
    output wire[7:0] out;

    And_1 A0( A[0], B[0], out[0] );
    And_1 A1( A[1], B[1], out[1] );
    And_1 A2( A[2], B[2], out[2] );
    And_1 A3( A[3], B[3], out[3] );
    And_1 A4( A[4], B[4], out[4] );
    And_1 A5( A[5], B[5], out[5] );
    And_1 A6( A[6], B[6], out[6] );
    And_1 A7( A[7], B[7], out[7] );

endmodule

module And_16( A, B, out );
    input wire[15:0] A, B;
    output wire[15:0] out;

    And_8 A0( A[7:0], B[7:0], out[7:0] );
    And_8 A1( A[15:8], B[15:8], out[15:8] );

endmodule

module Equals_1( A, B, areEqual );
    input wire A, B;
    output wire areEqual;
    wire different;
    
    Xor_1 X0( A, B, different );
    Not_1 N0( different, areEqual );
endmodule

module Equals_zero_8( A, isZero );
    input wire[7:0] A;
    output wire isZero;
    wire[6:0] carry;

    Or_1 O0( A[0], A[1], carry[0] );
    Or_1 O1( A[2], A[3], carry[1] );
    Or_1 O2( A[4], A[5], carry[2] );
    Or_1 O3( A[6], A[7], carry[3] );
    Or_1 O4( carry[0], carry[1], carry[4] );
    Or_1 O5( carry[2], carry[3], carry[5] );
    Or_1 O6( carry[4], carry[5], carry[6] );
    Not_1 N0( carry[6], isZero );
endmodule

module Equals_zero_16( A, isZero );
    input wire[15:0] A;
    output wire isZero;
    wire[1:0] carry;

    Equals_zero_8 E0( A[7:0], carry[0] );
    Equals_zero_8 E1( A[15:8], carry[1] );
    And_1 A0( carry[0], carry[1], isZero );
endmodule

module Equals_8( A, B, areEqual );
    input wire[7:0] A, B;
    output wire areEqual;
    wire[7:0] tempEquals;
    
    Xor_8 X0( A, B, tempEquals );
    Equals_zero_8 E0( tempEquals, areEqual );
endmodule

module Equals_16( A, B, areEqual );
    input wire[15:0] A, B;
    output wire areEqual;
    wire[1:0] tempEquals;
    
    Equals_8 E0( A[7:0], B[7:0], tempEquals[0] );
    Equals_8 E1( A[15:8], B[15:8], tempEquals[1] );
    And_1 A0( tempEquals[0], tempEquals[1], areEqual );
endmodule

module Full_Adder_1( c_in, A, B, S, c_out );
    input wire c_in, A, B;
    output wire S, c_out;
    wire[2:0] temp;
    
    Xor_1 X0( A, B, temp[0] );
    Xor_1 X1( temp[0], c_in, S );
    And_1 A0( A, B, temp[1] );
    And_1 A1( temp[0], c_in, temp[2] );
    Or_1 O1( temp[1], temp[2], c_out );
endmodule

module Full_Adder_8( c_in, A, B, S, c_out );
    input wire c_in;
    input wire[7:0] A, B;
    output wire c_out;
    output wire[7:0] S;
    wire[7:1] carry;
    
    Full_Adder_1 FA0( c_in, A[0], B[0], S[0], carry[1] );
    Full_Adder_1 FA1( carry[1], A[1], B[1], S[1], carry[2] );
    Full_Adder_1 FA2( carry[2], A[2], B[2], S[2], carry[3] );
    Full_Adder_1 FA3( carry[3], A[3], B[3], S[3], carry[4] );
    Full_Adder_1 FA4( carry[4], A[4], B[4], S[4], carry[5] );
    Full_Adder_1 FA5( carry[5], A[5], B[5], S[5], carry[6] );
    Full_Adder_1 FA6( carry[6], A[6], B[6], S[6], carry[7] );
    Full_Adder_1 FA7( carry[7], A[7], B[7], S[7], c_out );
endmodule

module Full_Adder_16( c_in, A, B, S, c_out );
    input wire c_in;
    input wire[15:0] A, B;
    output wire c_out;
    output wire[15:0] S;
    wire carry;
    
    Full_Adder_8 FA0( c_in, A[7:0], B[7:0], S[7:0], carry );
    Full_Adder_8 FA1( carry, A[15:8], B[15:8], S[15:8], c_out );
endmodule

module Add_16( A, B, S, overflow_error );
    input wire[15:0] A, B;
    output wire[15:0] S;
    output wire overflow_error;
    wire[8:0] carrys;
    reg c_in;
    
    Full_Adder_8 FA0( c_in, A[7:0], B[7:0], S[7:0], carry );
    Full_Adder_1 FA1( carry, A[8], B[8], S[8], carrys[1] );
    Full_Adder_1 FA2( carrys[1], A[9], B[9], S[9], carrys[2] );
    Full_Adder_1 FA3( carrys[2], A[10], B[10], S[10], carrys[3] );
    Full_Adder_1 FA4( carrys[3], A[11], B[11], S[11], carrys[4] );
    Full_Adder_1 FA5( carrys[4], A[12], B[12], S[12], carrys[5] );
    Full_Adder_1 FA6( carrys[5], A[13], B[13], S[13], carrys[6] );
    Full_Adder_1 FA7( carrys[6], A[14], B[14], S[14], carrys[7] );
    Full_Adder_1 FA8( carrys[7], A[15], B[15], S[15], carrys[8] );
    Xor_1 X0( carrys[7], carrys[8], overflow_error );
    
    initial begin
        c_in = 0;
    end
endmodule

module Subtract_16( A, B, D, overflow_error );
    input wire[15:0] A, B;
    output wire[15:0] D;
    output wire overflow_error;
    wire[15:0] B_not;
    reg c_in;
    wire[8:0] carrys;
    
    Not_16 N0( B, B_not );
    Full_Adder_8 FA0( c_in, A[7:0], B_not[7:0], D[7:0], carry );
    Full_Adder_1 FA1( carry, A[8],B_not[8], D[8], carrys[1] );
    Full_Adder_1 FA2( carrys[1], A[9], B_not[9], D[9], carrys[2] );
    Full_Adder_1 FA3( carrys[2], A[10], B_not[10], D[10], carrys[3] );
    Full_Adder_1 FA4( carrys[3], A[11], B_not[11], D[11], carrys[4] );
    Full_Adder_1 FA5( carrys[4], A[12], B_not[12], D[12], carrys[5] );
    Full_Adder_1 FA6( carrys[5], A[13], B_not[13], D[13], carrys[6] );
    Full_Adder_1 FA7( carrys[6], A[14], B_not[14], D[14], carrys[7] );
    Full_Adder_1 FA8( carrys[7], A[15], B_not[15], D[15], carrys[8] );
    Xor_1 X0( carrys[7], carrys[8], overflow_error );
    //Add_16 FA0( A, B_not, D, overflow_error );
    
    initial begin
        c_in = 1;
    end
endmodule

module Multiply_16(A,B,P, overflow) ;
  input wire[15:0] A, B ;
  output reg[15:0] P ;
  output wire overflow;
  reg[15:0] upper;
  wire not_overflow;
  
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
  
  Full_Adder_16 add1(1'B0, pp1, {1'B0,pp0[15:1]}, s1, cout_1);
  Full_Adder_16 add2(1'b0, pp2, {cout_1,s1[15:1]}, s2, cout_2);
  Full_Adder_16 add3(1'b0, pp3, {cout_2,s2[15:1]}, s3, cout_3);
  Full_Adder_16 add4(1'B0, pp4, {cout_3,s3[15:1]}, s4, cout_4);
  Full_Adder_16 add5(1'b0, pp5, {cout_4,s4[15:1]}, s5, cout_5);
  Full_Adder_16 add6(1'b0, pp6, {cout_5,s5[15:1]}, s6, cout_6);
  Full_Adder_16 add7(1'b0, pp7, {cout_6,s6[15:1]}, s7, cout_7);
  Full_Adder_16 add8(1'b0, pp8, {cout_7,s7[15:1]}, s8, cout_8);
  Full_Adder_16 add9(1'b0, pp9, {cout_8,s8[15:1]}, s9, cout_9);
  Full_Adder_16 add10(1'b0, pp10, {cout_9,s9[15:1]}, s10, cout_10);
  Full_Adder_16 add11(1'b0, pp11, {cout_10,s10[15:1]}, s11, cout_11);
  Full_Adder_16 add12(1'b0, pp12, {cout_11,s11[15:1]}, s12, cout_12);
  Full_Adder_16 add13(1'b0, pp13, {cout_12,s12[15:1]}, s13, cout_13);
  Full_Adder_16 add14(1'b0, pp14, {cout_13,s13[15:1]}, s14, cout_14);
  Full_Adder_16 add15(1'b0, pp15, {cout_14,s14[15:1]}, s15, cout_15);
  Equals_zero_16 EZ( upper, not_overflow );
  Not_1 N0( not_overflow, overflow );
  
  // collect the result
  always @(*)
    begin
      upper = {cout_15, s15[15:1]};
      P = {s15[0], s14[0], s13[0], s12[0], s11[0], s10[0], s9[0], s8[0], s7[0], s6[0], s5[0], s4[0], s3[0], s2[0], s1[0], pp0[0]} ;
    end
endmodule

module Divide_16(A, B, Quotient, div_by_zero_error);
    input [15:0] A, B;
    output wire [15:0] Quotient;
    output wire div_by_zero_error;
    reg[1:0][15:0] data;
    wire selector, error;
    
    Equals_zero_16 EZ( B, error );
    Dup_1 D0( error, selector, div_by_zero_error );
    Mux_16_1 M0( data, selector, Quotient );
    
    initial
        begin
            data[1] = 0;
        end

    always @(*)
        begin
            data[0] = A / B;
        end
endmodule

module Left_shift_8( in, data_in, data_out, out );
    input wire in;
    input wire[7:0] data_in;
    output reg out;
    output reg[7:0] data_out;
    
    always @(*)
        begin
            data_out[7:1] = data_in[6:0];
            data_out[0] = in;
            out = data_in[7];
        end
endmodule

module Left_shift_16( in, data_in, data_out, out );
    input wire in;
    input wire[15:0] data_in;
    output wire out;
    output wire[15:0] data_out;
    wire carry;
    
    Left_shift_8 L0( in, data_in[7:0], data_out[7:0], carry );
    Left_shift_8 L1( carry, data_in[15:8], data_out[15:8], out );
endmodule

module Left_Logical_Shift_8( in, offset, out );
    input wire[7:0] in;
    input wire[3:0] offset;
    output wire[7:0] out;
    wire[15:0][7:0] shifts;
    wire[7:0] pushedOut;
    reg zero;
    reg[7:0] wordZero;
    
    Identity_8 I( in, shifts[0] );
    Left_shift_8 LS1( zero, shifts[0], shifts[1], pushedOut[1] );
    Left_shift_8 LS2( zero, shifts[1], shifts[2], pushedOut[2] );
    Left_shift_8 LS3( zero, shifts[2], shifts[3], pushedOut[3] );
    Left_shift_8 LS4( zero, shifts[3], shifts[4], pushedOut[4] );
    Left_shift_8 LS5( zero, shifts[4], shifts[5], pushedOut[5] );
    Left_shift_8 LS6( zero, shifts[5], shifts[6], pushedOut[6] );
    Left_shift_8 LS7( zero, shifts[6], shifts[7], pushedOut[7] );
    Identity_8 I0( wordZero, shifts[8] );
    Identity_8 I1( wordZero, shifts[9] );
    Identity_8 I2( wordZero, shifts[10] );
    Identity_8 I3( wordZero, shifts[11] );
    Identity_8 I4( wordZero, shifts[12] );
    Identity_8 I5( wordZero, shifts[13] );
    Identity_8 I6( wordZero, shifts[14] );
    Identity_8 I7( wordZero, shifts[15] );
    Mux_8_4 M0( shifts, offset, out ); 
    
    initial
        begin
            zero = 0;
            wordZero = 0;
        end
endmodule

module Left_Logical_Shift_16( in, offset, out );
    input wire[15:0] in;
    input wire[4:0] offset;
    output wire[15:0] out;
    wire[31:0][15:0] shifts;
    wire[15:0] pushedOut;
    reg zero;
    reg[15:0] wordZero;
    
    Identity_16 I( in, shifts[0] );
    Left_shift_16 LS1( zero, in, shifts[1], pushedOut[1] );
    Left_shift_16 LS2( zero, shifts[1], shifts[2], pushedOut[2] );
    Left_shift_16 LS3( zero, shifts[2], shifts[3], pushedOut[3] );
    Left_shift_16 LS4( zero, shifts[3], shifts[4], pushedOut[4] );
    Left_shift_16 LS5( zero, shifts[4], shifts[5], pushedOut[5] );
    Left_shift_16 LS6( zero, shifts[5], shifts[6], pushedOut[6] );
    Left_shift_16 LS7( zero, shifts[6], shifts[7], pushedOut[7] );
    Left_shift_16 LS8( zero, shifts[7], shifts[8], pushedOut[8] );
    Left_shift_16 LS9( zero, shifts[8], shifts[9], pushedOut[9] );
    Left_shift_16 LS10( zero, shifts[9], shifts[10], pushedOut[10] );
    Left_shift_16 LS11( zero, shifts[10], shifts[11], pushedOut[11] );
    Left_shift_16 LS12( zero, shifts[11], shifts[12], pushedOut[12] );
    Left_shift_16 LS13( zero, shifts[12], shifts[13], pushedOut[13] );
    Left_shift_16 LS14( zero, shifts[13], shifts[14], pushedOut[14] );
    Left_shift_16 LS15( zero, shifts[14], shifts[15], pushedOut[15] );
    Identity_16 I0( wordZero, shifts[16] );
    Identity_16 I1( wordZero, shifts[17] );
    Identity_16 I2( wordZero, shifts[18] );
    Identity_16 I3( wordZero, shifts[19] );
    Identity_16 I4( wordZero, shifts[20] );
    Identity_16 I5( wordZero, shifts[21] );
    Identity_16 I6( wordZero, shifts[22] );
    Identity_16 I7( wordZero, shifts[23] );
    Identity_16 I8( wordZero, shifts[24] );
    Identity_16 I9( wordZero, shifts[25] );
    Identity_16 I10( wordZero, shifts[26] );
    Identity_16 I11( wordZero, shifts[27] );
    Identity_16 I12( wordZero, shifts[28] );
    Identity_16 I13( wordZero, shifts[29] );
    Identity_16 I14( wordZero, shifts[30] );
    Identity_16 I15( wordZero, shifts[31] );
    Mux_16_5 M0( shifts, offset, out ); 
    
    initial
        begin
            zero = 0;
            wordZero = 0;
        end
endmodule

module Left_Arithmetic_Shift_8( in, offset, out );
    input wire[7:0] in;
    input wire[3:0] offset;
    output wire[7:0] out;
    
    Left_Logical_Shift_8 L0( in, offset, out );
endmodule

module Left_Arithmetic_Shift_16( in, offset, out );
    input wire[15:0] in;
    input wire[4:0] offset;
    output wire[15:0] out;
    
    Left_Logical_Shift_16 L0( in, offset, out );
endmodule

module Right_shift_8( in, data_in, data_out, out );
    input wire in;
    input wire[7:0] data_in;
    output reg out;
    output reg[7:0] data_out;
    
    always @(*)
        begin
            data_out[6:0] = data_in[7:1];
            data_out[7] = in;
            out = data_in[0];
        end
endmodule

module Right_shift_16( in, data_in, data_out, out );
    input wire in;
    input wire[15:0] data_in;
    output wire out;
    output wire[15:0] data_out;
    wire carry;
    
    Right_shift_8 L0( carry, data_in[7:0], data_out[7:0], out );
    Right_shift_8 L1( in, data_in[15:8], data_out[15:8], carry );
endmodule

module Right_Logical_Shift_8( in, offset, out );
    input wire[7:0] in;
    input wire[3:0] offset;
    output wire[7:0] out;
    wire[15:0][7:0] shifts;
    wire[7:0] pushedOut;
    reg zero;
    reg[7:0] wordZero;
    
    Identity_8 I( in, shifts[0] );
    Right_shift_8 RS1( zero, shifts[0], shifts[1], pushedOut[1] );
    Right_shift_8 RS2( zero, shifts[1], shifts[2], pushedOut[2] );
    Right_shift_8 RS3( zero, shifts[2], shifts[3], pushedOut[3] );
    Right_shift_8 RS4( zero, shifts[3], shifts[4], pushedOut[4] );
    Right_shift_8 RS5( zero, shifts[4], shifts[5], pushedOut[5] );
    Right_shift_8 RS6( zero, shifts[5], shifts[6], pushedOut[6] );
    Right_shift_8 RS7( zero, shifts[6], shifts[7], pushedOut[7] );
    Identity_8 I0( wordZero, shifts[8] );
    Identity_8 I1( wordZero, shifts[9] );
    Identity_8 I2( wordZero, shifts[10] );
    Identity_8 I3( wordZero, shifts[11] );
    Identity_8 I4( wordZero, shifts[12] );
    Identity_8 I5( wordZero, shifts[13] );
    Identity_8 I6( wordZero, shifts[14] );
    Identity_8 I7( wordZero, shifts[15] );
    Mux_8_4 M0( shifts, offset, out ); 
    
    initial
        begin
            zero = 0;
            wordZero = 0;
        end
endmodule

module Right_Logical_Shift_16( in, offset, out );
    input wire[15:0] in;
    input wire[4:0] offset;
    output wire[15:0] out;
    wire[31:0][15:0] shifts;
    wire[15:0] pushedOut;
    reg zero;
    reg[15:0] wordZero;
    
    Identity_16 I( in, shifts[0] );
    Right_shift_16 RS1( zero, shifts[0], shifts[1], pushedOut[1] );
    Right_shift_16 RS2( zero, shifts[1], shifts[2], pushedOut[2] );
    Right_shift_16 RS3( zero, shifts[2], shifts[3], pushedOut[3] );
    Right_shift_16 RS4( zero, shifts[3], shifts[4], pushedOut[4] );
    Right_shift_16 RS5( zero, shifts[4], shifts[5], pushedOut[5] );
    Right_shift_16 RS6( zero, shifts[5], shifts[6], pushedOut[6] );
    Right_shift_16 RS7( zero, shifts[6], shifts[7], pushedOut[7] );
    Right_shift_16 RS8( zero, shifts[7], shifts[8], pushedOut[8] );
    Right_shift_16 RS9( zero, shifts[8], shifts[9], pushedOut[9] );
    Right_shift_16 RS10( zero, shifts[9], shifts[10], pushedOut[10] );
    Right_shift_16 RS11( zero, shifts[10], shifts[11], pushedOut[11] );
    Right_shift_16 RS12( zero, shifts[11], shifts[12], pushedOut[12] );
    Right_shift_16 RS13( zero, shifts[12], shifts[13], pushedOut[13] );
    Right_shift_16 RS14( zero, shifts[13], shifts[14], pushedOut[14] );
    Right_shift_16 RS15( zero, shifts[14], shifts[15], pushedOut[15] );
    Identity_16 I0( wordZero, shifts[16] );
    Identity_16 I1( wordZero, shifts[17] );
    Identity_16 I2( wordZero, shifts[18] );
    Identity_16 I3( wordZero, shifts[19] );
    Identity_16 I4( wordZero, shifts[20] );
    Identity_16 I5( wordZero, shifts[21] );
    Identity_16 I6( wordZero, shifts[22] );
    Identity_16 I7( wordZero, shifts[23] );
    Identity_16 I8( wordZero, shifts[24] );
    Identity_16 I9( wordZero, shifts[25] );
    Identity_16 I10( wordZero, shifts[26] );
    Identity_16 I11( wordZero, shifts[27] );
    Identity_16 I12( wordZero, shifts[28] );
    Identity_16 I13( wordZero, shifts[29] );
    Identity_16 I14( wordZero, shifts[30] );
    Identity_16 I15( wordZero, shifts[31] );
    Mux_16_5 M0( shifts, offset, out );
    
    initial
        begin
            zero = 0;
            wordZero = 0;
        end
endmodule

module Right_Arithmetic_Shift_8( in, offset, out );
    input wire[7:0] in;
    input wire[3:0] offset;
    output wire[7:0] out;
    wire[15:0][7:0] shifts;
    wire[8:0] pushedOut;
    reg zero;
    reg[7:0] wordZero;
    
    Identity_8 I( in, shifts[0] );
    Right_shift_8 RS1( in[7], shifts[0], shifts[1], pushedOut[1] );
    Right_shift_8 RS2( in[7], shifts[1], shifts[2], pushedOut[2] );
    Right_shift_8 RS3( in[7], shifts[2], shifts[3], pushedOut[3] );
    Right_shift_8 RS4( in[7], shifts[3], shifts[4], pushedOut[4] );
    Right_shift_8 RS5( in[7], shifts[4], shifts[5], pushedOut[5] );
    Right_shift_8 RS6( in[7], shifts[5], shifts[6], pushedOut[6] );
    Right_shift_8 RS7( in[7], shifts[6], shifts[7], pushedOut[7] );
    Right_shift_8 RS8( in[7], shifts[7], shifts[8], pushedOut[8] );
    Identity_8 I0( shifts[8], shifts[9] );
    Identity_8 I1( shifts[8], shifts[10] );
    Identity_8 I2( shifts[8], shifts[11] );
    Identity_8 I3( shifts[8], shifts[12] );
    Identity_8 I4( shifts[8], shifts[13] );
    Identity_8 I5( shifts[8], shifts[14] );
    Identity_8 I6( shifts[8], shifts[15] );
    Mux_8_4 M0( shifts, offset, out ); 
    
    initial
        begin
            zero = 0;
            wordZero = 0;
        end
endmodule

module Right_Arithmetic_Shift_16( in, offset, out );
    input wire[15:0] in;
    input wire[4:0] offset;
    output wire[15:0] out;
    wire[31:0][15:0] shifts;
    wire[16:0] pushedOut;
    reg zero;
    reg[15:0] wordZero;
    
    Identity_16 I( in, shifts[0] );
    Right_shift_16 RS1( in[15], shifts[0], shifts[1], pushedOut[1] );
    Right_shift_16 RS2( in[15], shifts[1], shifts[2], pushedOut[2] );
    Right_shift_16 RS3( in[15], shifts[2], shifts[3], pushedOut[3] );
    Right_shift_16 RS4( in[15], shifts[3], shifts[4], pushedOut[4] );
    Right_shift_16 RS5( in[15], shifts[4], shifts[5], pushedOut[5] );
    Right_shift_16 RS6( in[15], shifts[5], shifts[6], pushedOut[6] );
    Right_shift_16 RS7( in[15], shifts[6], shifts[7], pushedOut[7] );
    Right_shift_16 RS8( in[15], shifts[7], shifts[8], pushedOut[8] );
    Right_shift_16 RS9( in[15], shifts[8], shifts[9], pushedOut[9] );
    Right_shift_16 RS10( in[15], shifts[9], shifts[10], pushedOut[10] );
    Right_shift_16 RS11( in[15], shifts[10], shifts[11], pushedOut[11] );
    Right_shift_16 RS12( in[15], shifts[11], shifts[12], pushedOut[12] );
    Right_shift_16 RS13( in[15], shifts[12], shifts[13], pushedOut[13] );
    Right_shift_16 RS14( in[15], shifts[13], shifts[14], pushedOut[14] );
    Right_shift_16 RS15( in[15], shifts[14], shifts[15], pushedOut[15] );
    Right_shift_16 RS16( in[15], shifts[15], shifts[16], pushedOut[16] );
    Identity_16 I1( shifts[16], shifts[17] );
    Identity_16 I2( shifts[16], shifts[18] );
    Identity_16 I3( shifts[16], shifts[19] );
    Identity_16 I4( shifts[16], shifts[20] );
    Identity_16 I5( shifts[16], shifts[21] );
    Identity_16 I6( shifts[16], shifts[22] );
    Identity_16 I7( shifts[16], shifts[23] );
    Identity_16 I8( shifts[16], shifts[24] );
    Identity_16 I9( shifts[16], shifts[25] );
    Identity_16 I10( shifts[16], shifts[26] );
    Identity_16 I11( shifts[16], shifts[27] );
    Identity_16 I12( shifts[16], shifts[28] );
    Identity_16 I13( shifts[16], shifts[29] );
    Identity_16 I14( shifts[16], shifts[30] );
    Identity_16 I15( shifts[16], shifts[31] );
    Mux_16_5 M0( shifts, offset, out ); 
    
    initial
        begin
            zero = 0;
            wordZero = 0;
        end
endmodule

module Quick_store( in, out );
    input wire in;
    output reg out;
    
    initial
    begin
        out <= 0; // This initializes our cache memory to all zeros
    end
    
    always @(*) 
    begin
        out <= in;
    end
endmodule

module Quick_store_8( in, out );
    input wire[7:0] in;
    output wire[7:0] out;
    
    Quick_store Q0( in[0], out[0] );
    Quick_store Q1( in[1], out[1] );
    Quick_store Q2( in[2], out[2] );
    Quick_store Q3( in[3], out[3] );
    Quick_store Q4( in[4], out[4] );
    Quick_store Q5( in[5], out[5] );
    Quick_store Q6( in[6], out[6] );
    Quick_store Q7( in[7], out[7] );
    
endmodule

module Quick_store_16( in, out );
    input wire[15:0] in;
    output wire[15:0] out;
    
    Quick_store_8 Q0( in[7:0], out[7:0] );
    Quick_store_8 Q1( in[15:8], out[15:8] );
    
endmodule

module Pos_D_flip_flop( CLK, D, Q);
    input wire CLK, D;
    output reg Q;

    initial
    begin
        #6 Q <= 0;
    end

    always @(posedge CLK) 
    begin
        Q <= D;
    end
endmodule

module Pos_D_flip_flop_8( CLK, D, Q);
    input wire CLK;
    input wire[7:0] D;
    output wire[7:0] Q;

    Pos_D_flip_flop D0( CLK, D[0], Q[0] );
    Pos_D_flip_flop D1( CLK, D[1], Q[1] );
    Pos_D_flip_flop D2( CLK, D[2], Q[2] );
    Pos_D_flip_flop D3( CLK, D[3], Q[3] );
    Pos_D_flip_flop D4( CLK, D[4], Q[4] );
    Pos_D_flip_flop D5( CLK, D[5], Q[5] );
    Pos_D_flip_flop D6( CLK, D[6], Q[6] );
    Pos_D_flip_flop D7( CLK, D[7], Q[7] );

endmodule

module Pos_D_flip_flop_16( CLK, D, Q );
    input wire CLK;
    input wire[15:0] D;
    output wire[15:0] Q;

    Pos_D_flip_flop_8 D0( CLK, D[7:0], Q[7:0] );
    Pos_D_flip_flop_8 D1( CLK, D[15:8], Q[15:8] );

endmodule

module Pos_D_flip_flop_32( CLK, D, Q );
    input wire CLK;
    input wire[31:0] D;
    output wire[31:0] Q;

    Pos_D_flip_flop_16 D0( CLK, D[15:0], Q[15:0] );
    Pos_D_flip_flop_16 D1( CLK, D[31:16], Q[31:16] );

endmodule

module Neg_D_flip_flop( CLK, D, Q );
    input wire CLK, D;
    output reg Q;

    initial
    begin
        #6 Q <= 0;
    end

    always @(negedge CLK) 
    begin
        Q <= D;
    end
endmodule

module Neg_D_flip_flop_8( CLK, D, Q );
    input wire CLK;
    input wire[7:0] D;
    output wire[7:0] Q;

    Neg_D_flip_flop D0( CLK, D[0], Q[0] );
    Neg_D_flip_flop D1( CLK, D[1], Q[1] );
    Neg_D_flip_flop D2( CLK, D[2], Q[2] );
    Neg_D_flip_flop D3( CLK, D[3], Q[3] );
    Neg_D_flip_flop D4( CLK, D[4], Q[4] );
    Neg_D_flip_flop D5( CLK, D[5], Q[5] );
    Neg_D_flip_flop D6( CLK, D[6], Q[6] );
    Neg_D_flip_flop D7( CLK, D[7], Q[7] );

endmodule

module Neg_D_flip_flop_16( CLK, D, Q );
    input wire CLK;
    input wire[15:0] D;
    output wire[15:0] Q;

    Neg_D_flip_flop_8 D0( CLK, D[7:0], Q[7:0] );
    Neg_D_flip_flop_8 D1( CLK, D[15:8], Q[15:8] );

endmodule

module Neg_D_flip_flop_32( CLK, D, Q );
    input wire CLK;
    input wire[31:0] D;
    output wire[31:0] Q;

    Neg_D_flip_flop_16 D0( CLK, D[15:0], Q[15:0] );
    Neg_D_flip_flop_16 D1( CLK, D[31:16], Q[31:16] );

endmodule

module Error_Latch_1( CLK, reset, set, out );
    input wire CLK, reset, set;
    output reg out;
    wire should_set, not_reset, store;

    Or_1 O( set, out, should_set );
    Not_1 N( reset, not_reset );
    And_1 A( should_set, not_reset, store );

    initial
    begin
        #6 out <= 0;
    end

    always @(negedge CLK) 
    begin
        out <= store;
    end
endmodule

module Error_Latch_8( CLK, reset, set, out );
    input wire CLK, reset;
    input wire[7:0] set;
    output wire[7:0] out;

    Error_Latch_1 EL0( CLK, reset, set[0], out[0] );
    Error_Latch_1 EL1( CLK, reset, set[1], out[1] );
    Error_Latch_1 EL2( CLK, reset, set[2], out[2] );
    Error_Latch_1 EL3( CLK, reset, set[3], out[3] );
    Error_Latch_1 EL4( CLK, reset, set[4], out[4] );
    Error_Latch_1 EL5( CLK, reset, set[5], out[5] );
    Error_Latch_1 EL6( CLK, reset, set[6], out[6] );
    Error_Latch_1 EL7( CLK, reset, set[7], out[7] );
endmodule

module Mux_8_4( in, selector, out );
    input wire[15:0][7:0] in;
    input wire[3:0] selector;
    output reg[7:0] out;
    
    always @(*) 
    begin
        out = in[selector];
    end
endmodule

module Mux_16_4( in, selector, out );
    input wire[15:0][15:0] in;
    input wire[3:0] selector;
    output reg[15:0] out;
    
    always @(*) 
    begin
        out = in[selector];
    end
endmodule

module Mux_16_5( in, selector, out );
    input wire[31:0][15:0] in;
    input wire[4:0] selector;
    output reg[15:0] out;
    
    always @(*) 
    begin
        out = in[selector];
    end
endmodule

module Mux_16_1( in, selector, out );
    input wire[1:0][15:0] in;
    input wire selector;
    output reg[15:0] out;
    
    always @(*) 
    begin
        out = in[selector];
    end
endmodule

module Mux_16_8( in, selector, out );
    input wire[255:0][15:0] in;
    input wire[7:0] selector;
    output reg[15:0] out;
    
    always @(*) 
    begin
        out = in[selector];
    end
endmodule

module Decoder_3_8( in, out );
    input wire[2:0] in;
    output reg[7:0] out;
    
    always @(*)
    begin
        out=0;out[in] = 1;
    end
endmodule

module Decoder_8_256( in, out );
    input wire[7:0] in;
    output reg[255:0] out;
    
    always @(*)
    begin
        out=0;out[in] = 1;
    end
endmodule

module Conditional_Decoder_8_256( in, any_hot, out );
    input wire[7:0] in;
    input wire any_hot;
    output reg[255:0] out;

    always @(*)
    begin
        out=0;out[in] = any_hot;
    end
endmodule

module Encoder_16_4( in, out );
    input wire[15:0] in;
    output wire[3:0] out;
    reg[3:0][15:0] masks;
    wire[3:0][15:0] filtered;

    And_16 A0( in, masks[0], filtered[0] );
    And_16 A1( in, masks[1], filtered[1] );
    And_16 A2( in, masks[2], filtered[2] );
    And_16 A3( in, masks[3], filtered[3] );

    Equals_zero_16 EZ0( filtered[0], out[0] );
    Equals_zero_16 EZ1( filtered[1], out[1] );
    Equals_zero_16 EZ2( filtered[2], out[2] );
    Equals_zero_16 EZ3( filtered[3], out[3] );

    initial
        begin
            masks[0] = 16'b0101010101010101;
            masks[1] = 16'b0011001100110011;
            masks[2] = 16'b0000111100001111;
            masks[3] = 16'b0000000011111111;
        end
endmodule

module Cache_8_16( inValue, selector, memoryState );
    input wire[15:0] inValue;
    input wire[7:0] selector;
    output wire[7:0][15:0] memoryState;
    
    CacheRegister_16 C0( inValue, selector[0], memoryState[0] );
    CacheRegister_16 C1( inValue, selector[1], memoryState[1] );
    CacheRegister_16 C2( inValue, selector[2], memoryState[2] );
    CacheRegister_16 C3( inValue, selector[3], memoryState[3] );
    CacheRegister_16 C4( inValue, selector[4], memoryState[4] );
    CacheRegister_16 C5( inValue, selector[5], memoryState[5] );
    CacheRegister_16 C6( inValue, selector[6], memoryState[6] );
    CacheRegister_16 C7( inValue, selector[7], memoryState[7] );
endmodule

module Cache_64_16( inValue, selector, memoryState );
    input wire[15:0] inValue;
    input wire[63:0] selector;
    output wire[63:0][15:0] memoryState;
    
    CacheRegister_16 C0( inValue, selector[0], memoryState[0] );
    CacheRegister_16 C1( inValue, selector[1], memoryState[1] );
    CacheRegister_16 C2( inValue, selector[2], memoryState[2] );
    CacheRegister_16 C3( inValue, selector[3], memoryState[3] );
    CacheRegister_16 C4( inValue, selector[4], memoryState[4] );
    CacheRegister_16 C5( inValue, selector[5], memoryState[5] );
    CacheRegister_16 C6( inValue, selector[6], memoryState[6] );
    CacheRegister_16 C7( inValue, selector[7], memoryState[7] );
    CacheRegister_16 C8( inValue, selector[8], memoryState[8] );
    CacheRegister_16 C9( inValue, selector[9], memoryState[9] );
    CacheRegister_16 C10( inValue, selector[10], memoryState[10] );
    CacheRegister_16 C11( inValue, selector[11], memoryState[11] );
    CacheRegister_16 C12( inValue, selector[12], memoryState[12] );
    CacheRegister_16 C13( inValue, selector[13], memoryState[13] );
    CacheRegister_16 C14( inValue, selector[14], memoryState[14] );
    CacheRegister_16 C15( inValue, selector[15], memoryState[15] );
    CacheRegister_16 C16( inValue, selector[16], memoryState[16] );
    CacheRegister_16 C17( inValue, selector[17], memoryState[17] );
    CacheRegister_16 C18( inValue, selector[18], memoryState[18] );
    CacheRegister_16 C19( inValue, selector[19], memoryState[19] );
    CacheRegister_16 C20( inValue, selector[20], memoryState[20] );
    CacheRegister_16 C21( inValue, selector[21], memoryState[21] );
    CacheRegister_16 C22( inValue, selector[22], memoryState[22] );
    CacheRegister_16 C23( inValue, selector[23], memoryState[23] );
    CacheRegister_16 C24( inValue, selector[24], memoryState[24] );
    CacheRegister_16 C25( inValue, selector[25], memoryState[25] );
    CacheRegister_16 C26( inValue, selector[26], memoryState[26] );
    CacheRegister_16 C27( inValue, selector[27], memoryState[27] );
    CacheRegister_16 C28( inValue, selector[28], memoryState[28] );
    CacheRegister_16 C29( inValue, selector[29], memoryState[29] );
    CacheRegister_16 C30( inValue, selector[30], memoryState[30] );
    CacheRegister_16 C31( inValue, selector[31], memoryState[31] );
    CacheRegister_16 C32( inValue, selector[32], memoryState[32] );
    CacheRegister_16 C33( inValue, selector[33], memoryState[33] );
    CacheRegister_16 C34( inValue, selector[34], memoryState[34] );
    CacheRegister_16 C35( inValue, selector[35], memoryState[35] );
    CacheRegister_16 C36( inValue, selector[36], memoryState[36] );
    CacheRegister_16 C37( inValue, selector[37], memoryState[37] );
    CacheRegister_16 C38( inValue, selector[38], memoryState[38] );
    CacheRegister_16 C39( inValue, selector[39], memoryState[39] );
    CacheRegister_16 C40( inValue, selector[40], memoryState[40] );
    CacheRegister_16 C41( inValue, selector[41], memoryState[41] );
    CacheRegister_16 C42( inValue, selector[42], memoryState[42] );
    CacheRegister_16 C43( inValue, selector[43], memoryState[43] );
    CacheRegister_16 C44( inValue, selector[44], memoryState[44] );
    CacheRegister_16 C45( inValue, selector[45], memoryState[45] );
    CacheRegister_16 C46( inValue, selector[46], memoryState[46] );
    CacheRegister_16 C47( inValue, selector[47], memoryState[47] );
    CacheRegister_16 C48( inValue, selector[48], memoryState[48] );
    CacheRegister_16 C49( inValue, selector[49], memoryState[49] );
    CacheRegister_16 C50( inValue, selector[50], memoryState[50] );
    CacheRegister_16 C51( inValue, selector[51], memoryState[51] );
    CacheRegister_16 C52( inValue, selector[52], memoryState[52] );
    CacheRegister_16 C53( inValue, selector[53], memoryState[53] );
    CacheRegister_16 C54( inValue, selector[54], memoryState[54] );
    CacheRegister_16 C55( inValue, selector[55], memoryState[55] );
    CacheRegister_16 C56( inValue, selector[56], memoryState[56] );
    CacheRegister_16 C57( inValue, selector[57], memoryState[57] );
    CacheRegister_16 C58( inValue, selector[58], memoryState[58] );
    CacheRegister_16 C59( inValue, selector[59], memoryState[59] );
    CacheRegister_16 C60( inValue, selector[60], memoryState[60] );
    CacheRegister_16 C61( inValue, selector[61], memoryState[61] );
    CacheRegister_16 C62( inValue, selector[62], memoryState[62] );
    CacheRegister_16 C63( inValue, selector[63], memoryState[63] );
endmodule

module Cache_265_16( inValue, selector, memoryState );
    input wire[15:0] inValue;
    input wire[255:0] selector;
    output wire[255:0][15:0] memoryState;
    
    CacheRegister_16 C0( inValue, selector[0], memoryState[0] );
    CacheRegister_16 C1( inValue, selector[1], memoryState[1] );
    CacheRegister_16 C2( inValue, selector[2], memoryState[2] );
    CacheRegister_16 C3( inValue, selector[3], memoryState[3] );
    CacheRegister_16 C4( inValue, selector[4], memoryState[4] );
    CacheRegister_16 C5( inValue, selector[5], memoryState[5] );
    CacheRegister_16 C6( inValue, selector[6], memoryState[6] );
    CacheRegister_16 C7( inValue, selector[7], memoryState[7] );
    CacheRegister_16 C8( inValue, selector[8], memoryState[8] );
    CacheRegister_16 C9( inValue, selector[9], memoryState[9] );
    CacheRegister_16 C10( inValue, selector[10], memoryState[10] );
    CacheRegister_16 C11( inValue, selector[11], memoryState[11] );
    CacheRegister_16 C12( inValue, selector[12], memoryState[12] );
    CacheRegister_16 C13( inValue, selector[13], memoryState[13] );
    CacheRegister_16 C14( inValue, selector[14], memoryState[14] );
    CacheRegister_16 C15( inValue, selector[15], memoryState[15] );
    CacheRegister_16 C16( inValue, selector[16], memoryState[16] );
    CacheRegister_16 C17( inValue, selector[17], memoryState[17] );
    CacheRegister_16 C18( inValue, selector[18], memoryState[18] );
    CacheRegister_16 C19( inValue, selector[19], memoryState[19] );
    CacheRegister_16 C20( inValue, selector[20], memoryState[20] );
    CacheRegister_16 C21( inValue, selector[21], memoryState[21] );
    CacheRegister_16 C22( inValue, selector[22], memoryState[22] );
    CacheRegister_16 C23( inValue, selector[23], memoryState[23] );
    CacheRegister_16 C24( inValue, selector[24], memoryState[24] );
    CacheRegister_16 C25( inValue, selector[25], memoryState[25] );
    CacheRegister_16 C26( inValue, selector[26], memoryState[26] );
    CacheRegister_16 C27( inValue, selector[27], memoryState[27] );
    CacheRegister_16 C28( inValue, selector[28], memoryState[28] );
    CacheRegister_16 C29( inValue, selector[29], memoryState[29] );
    CacheRegister_16 C30( inValue, selector[30], memoryState[30] );
    CacheRegister_16 C31( inValue, selector[31], memoryState[31] );
    CacheRegister_16 C32( inValue, selector[32], memoryState[32] );
    CacheRegister_16 C33( inValue, selector[33], memoryState[33] );
    CacheRegister_16 C34( inValue, selector[34], memoryState[34] );
    CacheRegister_16 C35( inValue, selector[35], memoryState[35] );
    CacheRegister_16 C36( inValue, selector[36], memoryState[36] );
    CacheRegister_16 C37( inValue, selector[37], memoryState[37] );
    CacheRegister_16 C38( inValue, selector[38], memoryState[38] );
    CacheRegister_16 C39( inValue, selector[39], memoryState[39] );
    CacheRegister_16 C40( inValue, selector[40], memoryState[40] );
    CacheRegister_16 C41( inValue, selector[41], memoryState[41] );
    CacheRegister_16 C42( inValue, selector[42], memoryState[42] );
    CacheRegister_16 C43( inValue, selector[43], memoryState[43] );
    CacheRegister_16 C44( inValue, selector[44], memoryState[44] );
    CacheRegister_16 C45( inValue, selector[45], memoryState[45] );
    CacheRegister_16 C46( inValue, selector[46], memoryState[46] );
    CacheRegister_16 C47( inValue, selector[47], memoryState[47] );
    CacheRegister_16 C48( inValue, selector[48], memoryState[48] );
    CacheRegister_16 C49( inValue, selector[49], memoryState[49] );
    CacheRegister_16 C50( inValue, selector[50], memoryState[50] );
    CacheRegister_16 C51( inValue, selector[51], memoryState[51] );
    CacheRegister_16 C52( inValue, selector[52], memoryState[52] );
    CacheRegister_16 C53( inValue, selector[53], memoryState[53] );
    CacheRegister_16 C54( inValue, selector[54], memoryState[54] );
    CacheRegister_16 C55( inValue, selector[55], memoryState[55] );
    CacheRegister_16 C56( inValue, selector[56], memoryState[56] );
    CacheRegister_16 C57( inValue, selector[57], memoryState[57] );
    CacheRegister_16 C58( inValue, selector[58], memoryState[58] );
    CacheRegister_16 C59( inValue, selector[59], memoryState[59] );
    CacheRegister_16 C60( inValue, selector[60], memoryState[60] );
    CacheRegister_16 C61( inValue, selector[61], memoryState[61] );
    CacheRegister_16 C62( inValue, selector[62], memoryState[62] );
    CacheRegister_16 C63( inValue, selector[63], memoryState[63] );
    CacheRegister_16 C64( inValue, selector[64], memoryState[64] );
    CacheRegister_16 C65( inValue, selector[65], memoryState[65] );
    CacheRegister_16 C66( inValue, selector[66], memoryState[66] );
    CacheRegister_16 C67( inValue, selector[67], memoryState[67] );
    CacheRegister_16 C68( inValue, selector[68], memoryState[68] );
    CacheRegister_16 C69( inValue, selector[69], memoryState[69] );
    CacheRegister_16 C70( inValue, selector[70], memoryState[70] );
    CacheRegister_16 C71( inValue, selector[71], memoryState[71] );
    CacheRegister_16 C72( inValue, selector[72], memoryState[72] );
    CacheRegister_16 C73( inValue, selector[73], memoryState[73] );
    CacheRegister_16 C74( inValue, selector[74], memoryState[74] );
    CacheRegister_16 C75( inValue, selector[75], memoryState[75] );
    CacheRegister_16 C76( inValue, selector[76], memoryState[76] );
    CacheRegister_16 C77( inValue, selector[77], memoryState[77] );
    CacheRegister_16 C78( inValue, selector[78], memoryState[78] );
    CacheRegister_16 C79( inValue, selector[79], memoryState[79] );
    CacheRegister_16 C80( inValue, selector[80], memoryState[80] );
    CacheRegister_16 C81( inValue, selector[81], memoryState[81] );
    CacheRegister_16 C82( inValue, selector[82], memoryState[82] );
    CacheRegister_16 C83( inValue, selector[83], memoryState[83] );
    CacheRegister_16 C84( inValue, selector[84], memoryState[84] );
    CacheRegister_16 C85( inValue, selector[85], memoryState[85] );
    CacheRegister_16 C86( inValue, selector[86], memoryState[86] );
    CacheRegister_16 C87( inValue, selector[87], memoryState[87] );
    CacheRegister_16 C88( inValue, selector[88], memoryState[88] );
    CacheRegister_16 C89( inValue, selector[89], memoryState[89] );
    CacheRegister_16 C90( inValue, selector[90], memoryState[90] );
    CacheRegister_16 C91( inValue, selector[91], memoryState[91] );
    CacheRegister_16 C92( inValue, selector[92], memoryState[92] );
    CacheRegister_16 C93( inValue, selector[93], memoryState[93] );
    CacheRegister_16 C94( inValue, selector[94], memoryState[94] );
    CacheRegister_16 C95( inValue, selector[95], memoryState[95] );
    CacheRegister_16 C96( inValue, selector[96], memoryState[96] );
    CacheRegister_16 C97( inValue, selector[97], memoryState[97] );
    CacheRegister_16 C98( inValue, selector[98], memoryState[98] );
    CacheRegister_16 C99( inValue, selector[99], memoryState[99] );
    CacheRegister_16 C100( inValue, selector[100], memoryState[100] );
    CacheRegister_16 C101( inValue, selector[101], memoryState[101] );
    CacheRegister_16 C102( inValue, selector[102], memoryState[102] );
    CacheRegister_16 C103( inValue, selector[103], memoryState[103] );
    CacheRegister_16 C104( inValue, selector[104], memoryState[104] );
    CacheRegister_16 C105( inValue, selector[105], memoryState[105] );
    CacheRegister_16 C106( inValue, selector[106], memoryState[106] );
    CacheRegister_16 C107( inValue, selector[107], memoryState[107] );
    CacheRegister_16 C108( inValue, selector[108], memoryState[108] );
    CacheRegister_16 C109( inValue, selector[109], memoryState[109] );
    CacheRegister_16 C110( inValue, selector[110], memoryState[110] );
    CacheRegister_16 C111( inValue, selector[111], memoryState[111] );
    CacheRegister_16 C112( inValue, selector[112], memoryState[112] );
    CacheRegister_16 C113( inValue, selector[113], memoryState[113] );
    CacheRegister_16 C114( inValue, selector[114], memoryState[114] );
    CacheRegister_16 C115( inValue, selector[115], memoryState[115] );
    CacheRegister_16 C116( inValue, selector[116], memoryState[116] );
    CacheRegister_16 C117( inValue, selector[117], memoryState[117] );
    CacheRegister_16 C118( inValue, selector[118], memoryState[118] );
    CacheRegister_16 C119( inValue, selector[119], memoryState[119] );
    CacheRegister_16 C120( inValue, selector[120], memoryState[120] );
    CacheRegister_16 C121( inValue, selector[121], memoryState[121] );
    CacheRegister_16 C122( inValue, selector[122], memoryState[122] );
    CacheRegister_16 C123( inValue, selector[123], memoryState[123] );
    CacheRegister_16 C124( inValue, selector[124], memoryState[124] );
    CacheRegister_16 C125( inValue, selector[125], memoryState[125] );
    CacheRegister_16 C126( inValue, selector[126], memoryState[126] );
    CacheRegister_16 C127( inValue, selector[127], memoryState[127] );
    CacheRegister_16 C128( inValue, selector[128], memoryState[128] );
    CacheRegister_16 C129( inValue, selector[129], memoryState[129] );
    CacheRegister_16 C130( inValue, selector[130], memoryState[130] );
    CacheRegister_16 C131( inValue, selector[131], memoryState[131] );
    CacheRegister_16 C132( inValue, selector[132], memoryState[132] );
    CacheRegister_16 C133( inValue, selector[133], memoryState[133] );
    CacheRegister_16 C134( inValue, selector[134], memoryState[134] );
    CacheRegister_16 C135( inValue, selector[135], memoryState[135] );
    CacheRegister_16 C136( inValue, selector[136], memoryState[136] );
    CacheRegister_16 C137( inValue, selector[137], memoryState[137] );
    CacheRegister_16 C138( inValue, selector[138], memoryState[138] );
    CacheRegister_16 C139( inValue, selector[139], memoryState[139] );
    CacheRegister_16 C140( inValue, selector[140], memoryState[140] );
    CacheRegister_16 C141( inValue, selector[141], memoryState[141] );
    CacheRegister_16 C142( inValue, selector[142], memoryState[142] );
    CacheRegister_16 C143( inValue, selector[143], memoryState[143] );
    CacheRegister_16 C144( inValue, selector[144], memoryState[144] );
    CacheRegister_16 C145( inValue, selector[145], memoryState[145] );
    CacheRegister_16 C146( inValue, selector[146], memoryState[146] );
    CacheRegister_16 C147( inValue, selector[147], memoryState[147] );
    CacheRegister_16 C148( inValue, selector[148], memoryState[148] );
    CacheRegister_16 C149( inValue, selector[149], memoryState[149] );
    CacheRegister_16 C150( inValue, selector[150], memoryState[150] );
    CacheRegister_16 C151( inValue, selector[151], memoryState[151] );
    CacheRegister_16 C152( inValue, selector[152], memoryState[152] );
    CacheRegister_16 C153( inValue, selector[153], memoryState[153] );
    CacheRegister_16 C154( inValue, selector[154], memoryState[154] );
    CacheRegister_16 C155( inValue, selector[155], memoryState[155] );
    CacheRegister_16 C156( inValue, selector[156], memoryState[156] );
    CacheRegister_16 C157( inValue, selector[157], memoryState[157] );
    CacheRegister_16 C158( inValue, selector[158], memoryState[158] );
    CacheRegister_16 C159( inValue, selector[159], memoryState[159] );
    CacheRegister_16 C160( inValue, selector[160], memoryState[160] );
    CacheRegister_16 C161( inValue, selector[161], memoryState[161] );
    CacheRegister_16 C162( inValue, selector[162], memoryState[162] );
    CacheRegister_16 C163( inValue, selector[163], memoryState[163] );
    CacheRegister_16 C164( inValue, selector[164], memoryState[164] );
    CacheRegister_16 C165( inValue, selector[165], memoryState[165] );
    CacheRegister_16 C166( inValue, selector[166], memoryState[166] );
    CacheRegister_16 C167( inValue, selector[167], memoryState[167] );
    CacheRegister_16 C168( inValue, selector[168], memoryState[168] );
    CacheRegister_16 C169( inValue, selector[169], memoryState[169] );
    CacheRegister_16 C170( inValue, selector[170], memoryState[170] );
    CacheRegister_16 C171( inValue, selector[171], memoryState[171] );
    CacheRegister_16 C172( inValue, selector[172], memoryState[172] );
    CacheRegister_16 C173( inValue, selector[173], memoryState[173] );
    CacheRegister_16 C174( inValue, selector[174], memoryState[174] );
    CacheRegister_16 C175( inValue, selector[175], memoryState[175] );
    CacheRegister_16 C176( inValue, selector[176], memoryState[176] );
    CacheRegister_16 C177( inValue, selector[177], memoryState[177] );
    CacheRegister_16 C178( inValue, selector[178], memoryState[178] );
    CacheRegister_16 C179( inValue, selector[179], memoryState[179] );
    CacheRegister_16 C180( inValue, selector[180], memoryState[180] );
    CacheRegister_16 C181( inValue, selector[181], memoryState[181] );
    CacheRegister_16 C182( inValue, selector[182], memoryState[182] );
    CacheRegister_16 C183( inValue, selector[183], memoryState[183] );
    CacheRegister_16 C184( inValue, selector[184], memoryState[184] );
    CacheRegister_16 C185( inValue, selector[185], memoryState[185] );
    CacheRegister_16 C186( inValue, selector[186], memoryState[186] );
    CacheRegister_16 C187( inValue, selector[187], memoryState[187] );
    CacheRegister_16 C188( inValue, selector[188], memoryState[188] );
    CacheRegister_16 C189( inValue, selector[189], memoryState[189] );
    CacheRegister_16 C190( inValue, selector[190], memoryState[190] );
    CacheRegister_16 C191( inValue, selector[191], memoryState[191] );
    CacheRegister_16 C192( inValue, selector[192], memoryState[192] );
    CacheRegister_16 C193( inValue, selector[193], memoryState[193] );
    CacheRegister_16 C194( inValue, selector[194], memoryState[194] );
    CacheRegister_16 C195( inValue, selector[195], memoryState[195] );
    CacheRegister_16 C196( inValue, selector[196], memoryState[196] );
    CacheRegister_16 C197( inValue, selector[197], memoryState[197] );
    CacheRegister_16 C198( inValue, selector[198], memoryState[198] );
    CacheRegister_16 C199( inValue, selector[199], memoryState[199] );
    CacheRegister_16 C200( inValue, selector[200], memoryState[200] );
    CacheRegister_16 C201( inValue, selector[201], memoryState[201] );
    CacheRegister_16 C202( inValue, selector[202], memoryState[202] );
    CacheRegister_16 C203( inValue, selector[203], memoryState[203] );
    CacheRegister_16 C204( inValue, selector[204], memoryState[204] );
    CacheRegister_16 C205( inValue, selector[205], memoryState[205] );
    CacheRegister_16 C206( inValue, selector[206], memoryState[206] );
    CacheRegister_16 C207( inValue, selector[207], memoryState[207] );
    CacheRegister_16 C208( inValue, selector[208], memoryState[208] );
    CacheRegister_16 C209( inValue, selector[209], memoryState[209] );
    CacheRegister_16 C210( inValue, selector[210], memoryState[210] );
    CacheRegister_16 C211( inValue, selector[211], memoryState[211] );
    CacheRegister_16 C212( inValue, selector[212], memoryState[212] );
    CacheRegister_16 C213( inValue, selector[213], memoryState[213] );
    CacheRegister_16 C214( inValue, selector[214], memoryState[214] );
    CacheRegister_16 C215( inValue, selector[215], memoryState[215] );
    CacheRegister_16 C216( inValue, selector[216], memoryState[216] );
    CacheRegister_16 C217( inValue, selector[217], memoryState[217] );
    CacheRegister_16 C218( inValue, selector[218], memoryState[218] );
    CacheRegister_16 C219( inValue, selector[219], memoryState[219] );
    CacheRegister_16 C220( inValue, selector[220], memoryState[220] );
    CacheRegister_16 C221( inValue, selector[221], memoryState[221] );
    CacheRegister_16 C222( inValue, selector[222], memoryState[222] );
    CacheRegister_16 C223( inValue, selector[223], memoryState[223] );
    CacheRegister_16 C224( inValue, selector[224], memoryState[224] );
    CacheRegister_16 C225( inValue, selector[225], memoryState[225] );
    CacheRegister_16 C226( inValue, selector[226], memoryState[226] );
    CacheRegister_16 C227( inValue, selector[227], memoryState[227] );
    CacheRegister_16 C228( inValue, selector[228], memoryState[228] );
    CacheRegister_16 C229( inValue, selector[229], memoryState[229] );
    CacheRegister_16 C230( inValue, selector[230], memoryState[230] );
    CacheRegister_16 C231( inValue, selector[231], memoryState[231] );
    CacheRegister_16 C232( inValue, selector[232], memoryState[232] );
    CacheRegister_16 C233( inValue, selector[233], memoryState[233] );
    CacheRegister_16 C234( inValue, selector[234], memoryState[234] );
    CacheRegister_16 C235( inValue, selector[235], memoryState[235] );
    CacheRegister_16 C236( inValue, selector[236], memoryState[236] );
    CacheRegister_16 C237( inValue, selector[237], memoryState[237] );
    CacheRegister_16 C238( inValue, selector[238], memoryState[238] );
    CacheRegister_16 C239( inValue, selector[239], memoryState[239] );
    CacheRegister_16 C240( inValue, selector[240], memoryState[240] );
    CacheRegister_16 C241( inValue, selector[241], memoryState[241] );
    CacheRegister_16 C242( inValue, selector[242], memoryState[242] );
    CacheRegister_16 C243( inValue, selector[243], memoryState[243] );
    CacheRegister_16 C244( inValue, selector[244], memoryState[244] );
    CacheRegister_16 C245( inValue, selector[245], memoryState[245] );
    CacheRegister_16 C246( inValue, selector[246], memoryState[246] );
    CacheRegister_16 C247( inValue, selector[247], memoryState[247] );
    CacheRegister_16 C248( inValue, selector[248], memoryState[248] );
    CacheRegister_16 C249( inValue, selector[249], memoryState[249] );
    CacheRegister_16 C250( inValue, selector[250], memoryState[250] );
    CacheRegister_16 C251( inValue, selector[251], memoryState[251] );
    CacheRegister_16 C252( inValue, selector[252], memoryState[252] );
    CacheRegister_16 C253( inValue, selector[253], memoryState[253] );
    CacheRegister_16 C254( inValue, selector[254], memoryState[254] );
    CacheRegister_16 C255( inValue, selector[255], memoryState[255] );
endmodule

module CacheRegister_16( data_in, storage_activator, data_out );
    input wire storage_activator;
    input wire[15:0] data_in;
    output wire[15:0] data_out;
    
    wire[15:0] FF_in, FF_out, loopBack;
    wire[1:0][15:0] mux_in;
    
    Pack_2_16 P0( loopBack, data_in, mux_in );
    Mux_16_1 M0( mux_in, storage_activator, FF_in );
    Quick_store_16 Q0( FF_in, FF_out );
    Dup_16 D1( FF_out, data_out, loopBack );
    
endmodule

/*
nop      = 0000 0000 -> 0
save     = 0000 0001 -> 1
add      = 1000 0000 -> 2
subtract = 1000 0001 -> 3
multiply = 1000 0010 -> 4
divide   = 1000 0011 -> 5
and      = 0100 0000 -> 6
or       = 0100 0001 -> 7
not      = 0100 0010 -> 8
xor      = 0100 0011 -> 9
lls      = 0100 0100 -> 10
rls      = 0100 0101 -> 11
las      = 0100 0110 -> 12
ras      = 0100 0111 -> 13
*/
module Opcode_Converter_ROM( opcode, index );
    input wire[7:0] opcode;
    output wire[3:0] index;
    wire[15:0] one_hot_index;
    reg[7:0] save_literal, add_literal, subtract_literal, multiply_literal, divide_literal, and_literal, or_literal, not_literal, xor_literal, lls_literal, rls_literal, las_literal, ras_literal, reset_literal, nop_literal;
    reg zero;

    Equals_8 E0( opcode, nop_literal, one_hot_index[0] );
    Equals_8 E1( opcode, save_literal, one_hot_index[1] );
    Equals_8 E2( opcode, add_literal, one_hot_index[2] );
    Equals_8 E3( opcode, subtract_literal, one_hot_index[3] );
    Equals_8 E4( opcode, multiply_literal, one_hot_index[4] );
    Equals_8 E5( opcode, divide_literal, one_hot_index[5] );
    Equals_8 E6( opcode, and_literal, one_hot_index[6] );
    Equals_8 E7( opcode, or_literal, one_hot_index[7] );
    Equals_8 E8( opcode, not_literal, one_hot_index[8] );
    Equals_8 E9( opcode, xor_literal, one_hot_index[9] );
    Equals_8 E10( opcode, lls_literal, one_hot_index[10] );
    Equals_8 E11( opcode, rls_literal, one_hot_index[11] );
    Equals_8 E12( opcode, las_literal, one_hot_index[12] );
    Equals_8 E13( opcode, ras_literal, one_hot_index[13] );
    Identity_1 I0( zero, one_hot_index[14] );
    Identity_1 I1( zero, one_hot_index[15] );

    Encoder_16_4 E14( one_hot_index, index );

    initial
        begin
            nop_literal <= 8'b00000000;
            save_literal <= 8'b00000001;
            add_literal <= 8'b10000000;
            subtract_literal <= 8'b10000001;
            multiply_literal <= 8'b10000010;
            divide_literal <= 8'b10000011;
            and_literal <= 8'b01000000;
            or_literal <= 8'b01000001;
            not_literal <= 8'b01000010;
            xor_literal <= 8'b01000011;
            lls_literal <= 8'b01000100;
            rls_literal <= 8'b01000101;
            las_literal <= 8'b01000110;
            ras_literal <= 8'b01000111;
            zero <= 0;
        end
endmodule


/*
nop      = 0000 0000 -> 0
save     = 0000 0001 -> 1
add      = 1000 0000 -> 2
subtract = 1000 0001 -> 3
multiply = 1000 0010 -> 4
divide   = 1000 0011 -> 5
and      = 0100 0000 -> 6
or       = 0100 0001 -> 7
not      = 0100 0010 -> 8
xor      = 0100 0011 -> 9
lls      = 0100 0100 -> 10
rls      = 0100 0101 -> 11
las      = 0100 0110 -> 12
ras      = 0100 0111 -> 13
reset    = 0000 0010
*/
module Process_Operation( CLK, op, out, errors_out );
    input wire CLK;
    input wire[31:0] op;
    output wire[15:0] out;
    output wire[7:0] errors_out;
    wire[31:0] operation;
    wire[15:0][7:0] errors;
    wire[15:0][15:0] values;
    wire[1:0][15:0] pre_processed_values;
    wire[3:0][1:0] temp;
    wire[3:0] opcode_index;
    wire[7:0] opcode, A_location, B_location, output_location, out_location, processed_error, error, error_out, error_stall;
    wire[15:0] A, B, out_value, pre_processed_value, processed_value;
    wire[255:0] one_hot_output_location;
    wire[255:0][15:0] memory;
    reg[15:0] zero;
    reg[7:0] reset_literal;
    wire should_reset;

    Pos_D_flip_flop_32 Front_Guard( CLK, op, operation );

    Identity_8 I0( operation[31:24], opcode );
    Identity_8 I1( operation[23:16], A_location );
    Identity_8 I2( operation[15:8], B_location );
    Identity_8 I3( operation[7:0], output_location );

    Opcode_Converter_ROM OCR( opcode, opcode_index );
    Mux_16_8 MA( memory, A_location, A );
    Mux_16_8 MB( memory, B_location, B );
    Cache_265_16 MEM( out, one_hot_output_location, memory );

    // Check signatures and decide how errors will work
    Identity_16 I4( zero, values[0] );
    Identity_16 I5( operation[23:8], values[1] );
    Add_16      A0( A, B, values[2], add_error );
    Subtract_16 S0( A, B, values[3], sub_error );
    Multiply_16 M0( A, B, values[4], mult_error );
    Divide_16   D0( A, B, values[5], div_error );
    And_16      A1( A, B, values[6] );
    Or_16       O0( A, B, values[7] );
    Not_16      N0( B, values[8] );
    Xor_16      X0( A, B, values[9] );
    Left_Logical_Shift_16 LLS( A, B[4:0], values[10] );
    Right_Logical_Shift_16 RLS( A, B[4:0], values[11] );
    Left_Arithmetic_Shift_16 LAS( A, B[4:0], values[12] );
    Right_Arithmetic_Shift_16 RAS( A, B[4:0], values[13]);
    Identity_16 I6( zero, values[14] );
    Identity_16 I7( zero, values[15] );
    
    Identity_8 I8( zero[7:0], errors[0] );
    Identity_8 I9( zero[7:0], errors[1] );
    Pack_2_1 P0( add_error, zero[0], temp[0] );
    Pack_2_1 P1( sub_error, zero[0], temp[1] );
    Pack_2_1 P2( mult_error, zero[0], temp[2] );
    Pack_2_1 P3( zero[0], div_error, temp[3] );
    Pad_zero_left_2_8 P4( temp[0], errors[2] );
    Pad_zero_left_2_8 P5( temp[1], errors[3] );
    Pad_zero_left_2_8 P6( temp[2], errors[4] );
    Pad_zero_left_2_8 P7( temp[3], errors[5] );
    Identity_8 I10( zero[7:0], errors[6] );
    Identity_8 I11( zero[7:0], errors[7] );
    Identity_8 I12( zero[7:0], errors[8] );
    Identity_8 I13( zero[7:0], errors[9] );
    Identity_8 I14( zero[7:0], errors[10] );
    Identity_8 I15( zero[7:0], errors[11] );
    Identity_8 I16( zero[7:0], errors[12] );
    Identity_8 I17( zero[7:0], errors[13] );
    Identity_8 I18( zero[7:0], errors[14] );
    Identity_8 I19( zero[7:0], errors[15] );
    
    Equals_8 E0( opcode, reset_literal, should_reset );

    Mux_16_4 MO( values, opcode_index, processed_value );
    Mux_8_4  M1( errors, opcode_index, processed_error );

    Neg_D_flip_flop_16 Value_acc( CLK, processed_value, out );
    Neg_D_flip_flop_8 Location_acc( CLK, output_location, out_location );
    Error_Latch_8 Error_acc( CLK, should_reset, processed_error, error );

    Dup_8 D1( error, errors_out, error_stall );
    Equals_zero_8 EZ0( error_stall, not_should_stall );
    Not_1 N1( not_should_stall, stall );
    Or_1 O2( CLK, should_reset, temp_store );
    Or_1 O3( temp_store, stall, not_should_store );
    Not_1 N2( not_should_store, should_store );

    Conditional_Decoder_8_256 CD( out_location, should_store, one_hot_output_location );

    initial
        begin
            zero <= 0;
            reset_literal <= 8'b00000010;
        end
endmodule

/*
nop      = 0000 0000 -> 0
save     = 0000 0001 -> 1
add      = 1000 0000 -> 2
subtract = 1000 0001 -> 3
multiply = 1000 0010 -> 4
divide   = 1000 0011 -> 5
and      = 0100 0000 -> 6
or       = 0100 0001 -> 7
not      = 0100 0010 -> 8
xor      = 0100 0011 -> 9
lls      = 0100 0100 -> 10
rls      = 0100 0101 -> 11
las      = 0100 0110 -> 12
ras      = 0100 0111 -> 13
reset    = 0000 0010
*/
module TestBench;
    reg clk;
    reg[31:0] op;
    wire[15:0] out;
    wire[7:0] errors_out;
    
    Process_Operation PO( clk, op, out, errors_out );
    
    initial begin
                #15 clk = 0;op=32'b00000001000000000000100000000001; // m[1] = 8
                #5 clk = 1;
                #5 clk = 0;op=32'b00000001000000000000001100000010; // m[2] = 3
                #5 clk = 1;
                #5 clk = 0;op=32'b10000000000000010000001000000011; // m[3] = m[1] add m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b10000001000000010000001000000100; // m[4] = m[1] subtract m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b10000010000000010000001000000101; // m[5] = m[1] mult m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b10000011000000010000001000000110; // m[6] = m[1] div m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000000000000010000001000000111; // m[7] = m[1] and m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000001000000010000001000001000; // m[8] = m[1] or m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000010000000000000001000001001; // m[9] = not m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000011000000010000001000001010; // m[10] = m[1] xor m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000100000000010000001000001011; // m[11] = m[1] lls m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000101000000010000001000001100; // m[12] = m[1] rls m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000110000000010000001000001101; // m[13] = m[1] las m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b01000111000000010000001000001110; // m[14] = m[1] ras m[2]
                #5 clk = 1;
                #5 clk = 0;op=32'b10000011000000010000000000001111; // m[15] = m[1] div m[0] div-by-zero error
                #5 clk = 1;
                #5 clk = 0;op=32'b00000010000000000000000000000000; // reset
                #5 clk = 1;
                #5 clk = 0;op=32'b00000001011111111111111100010000; // m[16] = 65536
                #5 clk = 1;
                #5 clk = 0;op=32'b10000000000100000001000000010001; // m[17] = m[16] add m[16] overflow error
                #5 clk = 1;
                #5 clk = 0;op=32'b00000010000000000000000000000000; // reset
                #5 clk = 1;
                #5 clk = 0;
    end
    
    initial begin
        #11
        $display("+-----+----------+----------+----------+----------+++------------------+----------+");  
        $display("| CLK |    OP    |    A     |     B    |   out    |||     Acc_Value    |   error  |");
        $display("+-----+----------+----------+----------+----------+++------------------+----------+");
    forever
        begin
            #5  $display("|  %b  | %8b | %8b | %8b | %8b ||| %16b | %8b |", clk, op[31:24], op[23:16], op[15:8], op[7:0], out, errors_out );
        end
    end
  

    initial begin
    #206
    $finish;
    end
endmodule
