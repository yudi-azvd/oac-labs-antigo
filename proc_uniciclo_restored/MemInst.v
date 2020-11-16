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
end

always @(posedge iCLK)
begin
	oInst <= BI[iLeInst];
end

endmodule 