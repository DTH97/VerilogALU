module Mux_16_1( in, selector, out );
    input wire[1:0][15:0] in;
    input wire selector;
    output reg[15:0] out;
    
    always @(*) 
    begin
        out = in[selector];
    end
endmodule

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
        		#5 clk = 1 ;A[0]=0;A[1]=-1;S=0;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=-1;A[1]=0;S=0;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=0;A[1]=-1;S=0;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=-1;A[1]=0;S=0;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=0;A[1]=-1;S=0;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=-1;A[1]=0;S=1;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=0;A[1]=-1;S=1;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=-1;A[1]=0;S=1;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=0;A[1]=-1;S=1;
        		#5 clk = 0 ;
        		#5 clk = 1 ;A[0]=-1;A[1]=0;S=0;
		
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
    #111
    $finish;
    end
endmodule
