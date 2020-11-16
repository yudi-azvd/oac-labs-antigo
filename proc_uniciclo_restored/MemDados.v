module MemDados(
	input wire iCLK,
	input [8:0] iEnd,
	input [31:0] iDadoEscrita,
	input wire iEscMem, iLeMem,
	output [31:0] oDado,
	output [31:0] oDebug
);

reg [31:0] BancoMem[0:255];

reg [8:0] i;	// mudar de acordo com o tamanho do banco !!!

initial 
begin
	for(i = 0; i <= 255; i = i + 1'b1)
		BancoMem[i] = 32'b0;
end

always @(*)
begin
	if(iLeMem)
		oDado = BancoMem[iEnd];
end

always @(posedge iCLK)
begin
	if(iEscMem)
	begin
		BancoMem[iEnd] <= iDadoEscrita;
		oDebug <= iDadoEscrita;
	end
end

endmodule 