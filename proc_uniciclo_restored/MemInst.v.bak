module MemInst(
	input wire iCLK,
	input [8:0] iLeInst,
	output [31:0] oInst
);

reg [31:0] BI[0:255];

initial 
begin
	BI[0] = 32'h0000293;
	BI[1] = 32'h0fc10417;
	BI[2] = 32'hffc40413;
end

always @(posedge iCLK)
begin
	oInst <= BI[iLeInst];
end

endmodule 