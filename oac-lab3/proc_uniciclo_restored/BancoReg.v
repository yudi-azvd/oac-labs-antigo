module BancoReg(
	input wire iCLK, iRegWrite, 
	input wire [4:0] iRs1, iRs2, iWriteRegister,
	input wire [31:0]iWriteData,
	output wire [31:0] oDado1,	
	output wire [31:0] oDado2
);

reg [31:0] BR[31:0];
parameter SPR = 5'd2; // endereço da pilha (SP)
integer i;

initial 
	begin	
		for(i = 0; i <= 31; i = i + 1)
			BR[i] = 32'd0;
		BR[SPR] = 32'd1020;
		BR[6] = 32'd15;
		BR[7] = 32'd10;
	end
	
assign oDado1 = BR[iRs1];
assign oDado2 = BR[iRs2];

always @(posedge iCLK)
begin
//	if(iRST)
//	begin	
//		for(i = 0; i <= 31; i = i + 1)
//			BR[i] <= 32'b0;
//		BR[SPR] <= 32'd1020;
//	end
//	else

		i <= 6'b0;
		if(iRegWrite && (iWriteRegister != 5'b0))
			BR[iWriteRegister] <= iWriteData;
end


endmodule 