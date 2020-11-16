module BancoReg(
	input wire iCLK, iRST, iRegWrite, 
	input wire [4:0] iRs1, iRs2, iWriteRegister,
	input wire [31:0]iWriteData,
	output wire [31:0] oDado1,
	output wire [31:0] oDado2
);

reg [31:0] BR[31:0];

reg[5:0] i;

initial 
	begin	
		for(i = 0; i <= 31; i = i + 1'b1)
			BR[i] = 32'd0;
	end
	
assign oDado1 = BR[iRs1];
assign oDado2 = BR[iRs2];

always @(posedge iCLK or posedge iRST)
begin
	if(iRST)
	begin	
		for(i = 0; i <= 31; i = i + 1'b1)
			BR[i] <= 32'b0;
	end
	else
	begin
		i <= 6'b0;
		if(iRegWrite && (iWriteRegister != 5'b0))
			BR[iWriteRegister] <= iWriteData;
	end
end


endmodule 