module Divide_by_16(A, B, Quotient, errorFlag);
	input [15:0] A, B;
	reg [15:0] test = 16'b0000000000000000;
	output wire [15:0] Quotient;
	integer testfor_0 = 0;
	output wire errorFlag;
	
	always @* begin
	if (B[15:0] == test[15:0]) begin
	#2
		testfor_0 = 1;
	end //
	end
	assign errorFlag = testfor_0;
	assign Quotient = A / B;
endmodule