module Dup_1( in, out1, out2 );
    input wire in;
    output reg out1, out2; 
    
    always @(*) begin
        out1 = in;
        out2 = in;
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

module Pack_2_1( in0, in1, out);
    input wire in0, in1;
    output reg[1:0] out;
    
    always @(*)
    begin
        out[0] = in0;
        out[1] = in1;
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
        out = A | B;
    end
endmodule

module Xor_1( A, B, out );
    input wire A, B;
    output reg out;
    
    always @(*) 
    begin
        out = A ^ B;
    end
endmodule

module And_1( A, B, out );
    input wire A, B;
    output reg out;
    
    always @(*) 
    begin
        out = A & B;
    end
endmodule

module Quick_store( in, out );
    input wire in;
    output reg out;
    
    initial
    begin
        out <= 0; // This initialized our cache memory to all zeros
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
    
    Quick_store Q0( in[0], out[0] );
    Quick_store Q1( in[1], out[1] );
    Quick_store Q2( in[2], out[2] );
    Quick_store Q3( in[3], out[3] );
    Quick_store Q4( in[4], out[4] );
    Quick_store Q5( in[5], out[5] );
    Quick_store Q6( in[6], out[6] );
    Quick_store Q7( in[7], out[7] );
    Quick_store Q8( in[8], out[8] );
    Quick_store Q9( in[9], out[9] );
    Quick_store Q10( in[10], out[10] );
    Quick_store Q11( in[11], out[11] );
    Quick_store Q12( in[12], out[12] );
    Quick_store Q13( in[13], out[13] );
    Quick_store Q14( in[14], out[14] );
    Quick_store Q15( in[15], out[15] );
    
endmodule

module D_flip_flop( CLK, D, Q, Q_not );
    input wire CLK, D;
    output reg Q;
    output wire Q_not;
    
    Not_1 N1( Q, Q_not );
    
    initial
    begin
        Q <= 0; 
    end
    
    always @(posedge CLK) 
    begin
        Q <= D;
    end
endmodule

module D_flip_flop_8( CLK, D, Q, Q_not );
    input wire CLK;
    input wire[7:0] D;
    output wire[7:0] Q, Q_not;
    
    D_flip_flop D0( CLK, D[0], Q[0], Q_not[0] );
    D_flip_flop D1( CLK, D[1], Q[1], Q_not[1] );
    D_flip_flop D2( CLK, D[2], Q[2], Q_not[2] );
    D_flip_flop D3( CLK, D[3], Q[3], Q_not[3] );
    D_flip_flop D4( CLK, D[4], Q[4], Q_not[4] );
    D_flip_flop D5( CLK, D[5], Q[5], Q_not[5] );
    D_flip_flop D6( CLK, D[6], Q[6], Q_not[6] );
    D_flip_flop D7( CLK, D[7], Q[7], Q_not[7] );
    
endmodule

module D_flip_flop_16( CLK, D, Q, Q_not );
    input wire CLK;
    input wire[15:0] D;
    output wire[15:0] Q, Q_not;
    
    D_flip_flop_8 D0( CLK, D[7:0], Q[7:0], Q_not[7:0] );
    D_flip_flop_8 D1( CLK, D[15:8], Q[15:8], Q_not[15:8] );
    
endmodule

/* TestBench for testing Mux_16_1
module TestBench;
    reg clk;
    reg[1:0][15:0] A;
    reg S;
    wire[15:0] out;
    
    Mux_16_1 M1( A, S, out );
    
    initial begin
        forever
            begin
	  
        		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=0;A[0][1]=0;A[0][2]=0;A[0][3]=0;A[0][4]=0;A[0][5]=0;A[0][6]=0;A[0][7]=0;A[0][8]=0;A[0][9]=0;A[0][10]=0;A[0][11]=0;A[0][12]=0;A[0][13]=0;A[0][14]=0;A[0][15]=0;A[1][0]=1;A[1][1]=1;A[1][2]=1;A[1][3]=1;A[1][4]=1;A[1][5]=1;A[1][6]=1;A[1][7]=1;A[1][8]=1;A[1][9]=1;A[1][10]=1;A[1][11]=1;A[1][12]=1;A[1][13]=1;A[1][14]=1;A[1][15]=1;S=0;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=1;A[0][1]=1;A[0][2]=1;A[0][3]=1;A[0][4]=1;A[0][5]=1;A[0][6]=1;A[0][7]=1;A[0][8]=1;A[0][9]=1;A[0][10]=1;A[0][11]=1;A[0][12]=1;A[0][13]=1;A[0][14]=1;A[0][15]=1;A[1][0]=0;A[1][1]=0;A[1][2]=0;A[1][3]=0;A[1][4]=0;A[1][5]=0;A[1][6]=0;A[1][7]=0;A[1][8]=0;A[1][9]=0;A[1][10]=0;A[1][11]=0;A[1][12]=0;A[1][13]=0;A[1][14]=0;A[1][15]=0;S=0;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=0;A[0][1]=0;A[0][2]=0;A[0][3]=0;A[0][4]=0;A[0][5]=0;A[0][6]=0;A[0][7]=0;A[0][8]=0;A[0][9]=0;A[0][10]=0;A[0][11]=0;A[0][12]=0;A[0][13]=0;A[0][14]=0;A[0][15]=0;A[1][0]=1;A[1][1]=1;A[1][2]=1;A[1][3]=1;A[1][4]=1;A[1][5]=1;A[1][6]=1;A[1][7]=1;A[1][8]=1;A[1][9]=1;A[1][10]=1;A[1][11]=1;A[1][12]=1;A[1][13]=1;A[1][14]=1;A[1][15]=1;S=0;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=1;A[0][1]=1;A[0][2]=1;A[0][3]=1;A[0][4]=1;A[0][5]=1;A[0][6]=1;A[0][7]=1;A[0][8]=1;A[0][9]=1;A[0][10]=1;A[0][11]=1;A[0][12]=1;A[0][13]=1;A[0][14]=1;A[0][15]=1;A[1][0]=0;A[1][1]=0;A[1][2]=0;A[1][3]=0;A[1][4]=0;A[1][5]=0;A[1][6]=0;A[1][7]=0;A[1][8]=0;A[1][9]=0;A[1][10]=0;A[1][11]=0;A[1][12]=0;A[1][13]=0;A[1][14]=0;A[1][15]=0;S=0;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=0;A[0][1]=0;A[0][2]=0;A[0][3]=0;A[0][4]=0;A[0][5]=0;A[0][6]=0;A[0][7]=0;A[0][8]=0;A[0][9]=0;A[0][10]=0;A[0][11]=0;A[0][12]=0;A[0][13]=0;A[0][14]=0;A[0][15]=0;A[1][0]=1;A[1][1]=1;A[1][2]=1;A[1][3]=1;A[1][4]=1;A[1][5]=1;A[1][6]=1;A[1][7]=1;A[1][8]=1;A[1][9]=1;A[1][10]=1;A[1][11]=1;A[1][12]=1;A[1][13]=1;A[1][14]=1;A[1][15]=1;S=0;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=1;A[0][1]=1;A[0][2]=1;A[0][3]=1;A[0][4]=1;A[0][5]=1;A[0][6]=1;A[0][7]=1;A[0][8]=1;A[0][9]=1;A[0][10]=1;A[0][11]=1;A[0][12]=1;A[0][13]=1;A[0][14]=1;A[0][15]=1;A[1][0]=0;A[1][1]=0;A[1][2]=0;A[1][3]=0;A[1][4]=0;A[1][5]=0;A[1][6]=0;A[1][7]=0;A[1][8]=0;A[1][9]=0;A[1][10]=0;A[1][11]=0;A[1][12]=0;A[1][13]=0;A[1][14]=0;A[1][15]=0;S=1;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=0;A[0][1]=0;A[0][2]=0;A[0][3]=0;A[0][4]=0;A[0][5]=0;A[0][6]=0;A[0][7]=0;A[0][8]=0;A[0][9]=0;A[0][10]=0;A[0][11]=0;A[0][12]=0;A[0][13]=0;A[0][14]=0;A[0][15]=0;A[1][0]=1;A[1][1]=1;A[1][2]=1;A[1][3]=1;A[1][4]=1;A[1][5]=1;A[1][6]=1;A[1][7]=1;A[1][8]=1;A[1][9]=1;A[1][10]=1;A[1][11]=1;A[1][12]=1;A[1][13]=1;A[1][14]=1;A[1][15]=1;S=1;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=1;A[0][1]=1;A[0][2]=1;A[0][3]=1;A[0][4]=1;A[0][5]=1;A[0][6]=1;A[0][7]=1;A[0][8]=1;A[0][9]=1;A[0][10]=1;A[0][11]=1;A[0][12]=1;A[0][13]=1;A[0][14]=1;A[0][15]=1;A[1][0]=0;A[1][1]=0;A[1][2]=0;A[1][3]=0;A[1][4]=0;A[1][5]=0;A[1][6]=0;A[1][7]=0;A[1][8]=0;A[1][9]=0;A[1][10]=0;A[1][11]=0;A[1][12]=0;A[1][13]=0;A[1][14]=0;A[1][15]=0;S=1;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=0;A[0][1]=0;A[0][2]=0;A[0][3]=0;A[0][4]=0;A[0][5]=0;A[0][6]=0;A[0][7]=0;A[0][8]=0;A[0][9]=0;A[0][10]=0;A[0][11]=0;A[0][12]=0;A[0][13]=0;A[0][14]=0;A[0][15]=0;A[1][0]=1;A[1][1]=1;A[1][2]=1;A[1][3]=1;A[1][4]=1;A[1][5]=1;A[1][6]=1;A[1][7]=1;A[1][8]=1;A[1][9]=1;A[1][10]=1;A[1][11]=1;A[1][12]=1;A[1][13]=1;A[1][14]=1;A[1][15]=1;S=1;
		#5 clk = 0 ;
		#5 clk = 1 ;A[0][0]=1;A[0][1]=1;A[0][2]=1;A[0][3]=1;A[0][4]=1;A[0][5]=1;A[0][6]=1;A[0][7]=1;A[0][8]=1;A[0][9]=1;A[0][10]=1;A[0][11]=1;A[0][12]=1;A[0][13]=1;A[0][14]=1;A[0][15]=1;A[1][0]=0;A[1][1]=0;A[1][2]=0;A[1][3]=0;A[1][4]=0;A[1][5]=0;A[1][6]=0;A[1][7]=0;A[1][8]=0;A[1][9]=0;A[1][10]=0;A[1][11]=0;A[1][12]=0;A[1][13]=0;A[1][14]=0;A[1][15]=0;S=1;
		
            end
    end
    
    initial begin
        #11
	    $display("+-----+------------------+------------------+---+------------------+");	
        $display("| CLK |       A[0]       |       A[1]       | S |       out        |");
	    $display("+-----+------------------+------------------+---+------------------+");
	forever
        begin
	        #5	$display("|  %b  | %16b | %16b | %b | %16b |", clk, A[0], A[1], S, out);		
	    end
    end
  
    initial begin
    #91
    $finish;
    end
endmodule
*/
module Mux_16_1( in, selector, out );
    input wire[1:0][15:0] in;
    input wire selector;
    output reg[15:0] out;
    
    always @(*) 
    begin
        out = in[selector];
    end
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
    


module TestBench;
    reg clk;
    reg[15:0] A;
    reg S;
    wire[15:0] out;
    
    CacheRegister_16 C( A, S, out );
    
    initial begin
        forever
            begin
	  
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 0; S = 0;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 1; S = 0;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 2; S = 0;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 3; S = 1;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 4; S = 0;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 5; S = 1;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 6; S = 0;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 7; S = 1;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 8; S = 1;
        		#5 clk = 0 ;
        		#5 clk = 1 ; A = 9; S = 0;
        		
		
            end
    end
    
    initial begin
        #11
	    $display("+-----+------------------+---+------------------+");	
        $display("| CLK |       A[0]       | S |       out        |");
	    $display("+-----+------------------+---+------------------+");
	forever
        begin
	        #5	$display("|  %b  | %16b | %b | %16b |", clk, A , S, out);		
	    end
    end
  

    initial begin
    #101
    $finish;
    end
endmodule
