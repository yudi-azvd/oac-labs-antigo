module MemInst(
	input wire iCLK,
	input [31:0] iLeInst,
	output [31:0] oInst
);

reg [31:0] BI[0:255];

initial 
begin
	BI[0] = 32'h005282b3;
	BI[1] = 32'h40630333;
	BI[2] = 32'h005282b3;
	BI[3] = 32'h40630333;
	BI[4] = 32'h005282b3;
	BI[5] = 32'h40630333;
	BI[6] = 32'h005282b3;
	BI[7] = 32'h40630333;
	BI[8] = 32'h005282b3;
	BI[9] = 32'h40630333;
end

always @(posedge iCLK)
begin
	oInst <= BI[iLeInst>>2];
end

endmodule 