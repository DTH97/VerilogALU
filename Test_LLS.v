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
    Identity_8 I1( in[15:8], out[7:0] );
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

module Right_Arithmetic_shift_16( in, offset, out );
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

module Mux_8_4( in, selector, out );
    input wire[15:0][7:0] in;
    input wire[3:0] selector;
    output reg[7:0] out;
    
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

module TestBench;
    reg clk;
    reg[7:0] A, B;
    wire[7:0] out;
    Left_Logical_Shift_8 LLS( A, B[3:0], out );
    

    initial begin
        forever
            begin
	  
        		#5 clk = 0 ;
        		#5 clk = 1 ;A=5;B=0;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=1;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=2;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=3;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=4;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=5;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=6;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=7;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=8;
        		#5 clk = 0 ;
        		#5 clk = 1 ;B=9;
		
            end
    end
    
    initial begin
        #11
	    $display("+-----+----------+----------+----------+");	
        $display("| CLK |     A    |     B    |   out    |");
	    $display("+-----+----------+----------+----------+");
	forever
        begin
	        #5	$display("|  %b  | %8b | %8b | %8b |", clk, A, B, out);		
	    end
    end
  
    initial begin
    #101
    $finish;
    end
endmodule
