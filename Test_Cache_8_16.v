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

module Mux_16_1( in, selector, out );
    input wire[1:0][15:0] in;
    input wire selector;
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
    reg[2:0] S;
    wire[7:0] decoded_S;
    wire[7:0][15:0] memory;

    Decoder_3_8 D0( S, decoded_S );
    Cache_8_16 C0( A, decoded_S, memory );
    
    initial begin
        forever
            begin
	  
        		#5 clk = 0;
        		#5 clk = 1;A=0;S=0;
        		#5 clk = 0;
        		#5 clk = 1;A=1;S=1;
        		#5 clk = 0;
        		#5 clk = 1;A=2;S=2;
        		#5 clk = 0;
        		#5 clk = 1;A=3;S=3;
        		#5 clk = 0;
        		#5 clk = 1;A=4;S=4;
        		#5 clk = 0;
        		#5 clk = 1;A=5;S=5;
        		#5 clk = 0;
        		#5 clk = 1;A=6;S=6;
        		#5 clk = 0;
        		#5 clk = 1;A=7;S=7;
        		
		
            end
    end
    
    initial begin
        #11
	    $display("+-----+---+---+-----+-----+-----+-----+-----+-----+-----+-----+");	
        $display("| CLK | D | S |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |");
	    $display("+-----+---+---+-----+-----+-----+-----+-----+-----+-----+-----+");
	forever
        begin
	        #5	$display("|  %b  | %1d | %1d |  %1d  |  %1d  |  %1d  |  %1d  |  %1d  |  %1d  |  %1d  |  %1d  |", clk, A , S, memory[0], memory[1], memory[2], memory[3], memory[4], memory[5], memory[6], memory[7]);		
	    end
    end
  

    initial begin
    #101
    $finish;
    end
endmodule
