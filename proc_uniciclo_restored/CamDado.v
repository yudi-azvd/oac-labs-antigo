// AAAAAAAAAAAAAAA TEM MTA COISA FALTANDO TEM Q VER AS COISAS AI EMBAIXO

module CamDado(
	// input e clock
	input wire iCLK, iRST,
	input wire [31:0] iPCInicial,
	
	// Sinais de monitoramento
	output [31:0] mpc,
	
	// sinais de controle
	output [31:0] wInst,
	input wCRegWrite,
	input wCMemWrite,
	input wCMemRead,
	input [2:0] wCMem2Reg,
	input [2:0] wCOrigPC,
	input [4:0] wCULAControl,
	input [1:0] wCOrigBUla
);

// Monitoramento
assign mpc = PC;

// inicializando o PC

reg [31:0] PC;

initial
begin
	PC <= 32'b0;		// qualquer coisa a gente troca o endereço inicial para o do riscV
end 

wire [31:0] wPC4			= PC + 32'h00000004; 		// serase ?
wire [31:0] wBranchPC	= PC + wImmediate;

wire [4:0] wRs1 			= wInst[19:15];
wire [4:0] wRs2			= wInst[24:20];
wire [4:0] wRd				= wInst[11:7];
wire [2:0] wFunct3 		= wInst[14:12];
// wire [6:0] wOpcode	= wInst[6:0];

// BR

wire [31:0] wRead1, wRead2;

BancoReg BR0 (
	.iCLK(iCLK),
	.iRST(iRST),
	.iRs1(wRs1),
	.iRs2(wRs2),
	.iRegWrite(wCRegWrite),
	.iWriteRegister(wRd),
	.iWriteData(wRegWrite),
	.oDado1(wRead1),
	.oDado2(wRead2)
);

// gerador de imediato

GerImm IMMGEN0 (
	.iInst(wInst),
	.oSaida(wImmediate)
);

// ULA - Unidade Lógica-Aritmetica

wire [31:0] wULAResult;
wire Zero;

ULA ULA0 (
	.iControl(wCULAControl),
	.iA(wOrigAULA),
	.iB(wOrigBULA),
	.oResult(wULAResult),
	.oZero(Zero)
);

// Controlador

wire SaidaBranch, SaidaJump;

Controlador CTRL0 (
	.iInst(wInst),
	.oBranch(SaidaBranch),
	.oLeMem(wCMemRead),
	.oEscMem(wCMemWrite),
	.oMemPraReg(wCMem2Reg),
	.oEscReg(wCRegWrite),
	.oJump(SaidaJump),
	.oULActrl(wCULAControl),
	.oOBULA(wCOrigBUla)
);

// Memória de instrução

MemInst MI0 (
	.iCLK(iCLK),
	.iLeInst(PC),
	.oInst(wInst)
);

// memoria de dados

wire [31:0] MemSaida;

MemDados MEMD0 (
	.iCLK(iCLK),
	.iEnd(wULAResult),
	.iDadoEscrita(wRead2),
	.iEscMem(wCMemWrite),
	.iLeMem(wCMemRead),
	.oDado(MemSaida)
);


// multiplexadores

wire [31:0] wOrigBULA;

always @(*)
	case(wCOrigBUla)
		2'b00   : wOrigBULA <= wRead2;
		2'b01   : wOrigBULA <= wImmediate;
		default : wOrigBULA <= 32'b0;
	endcase 

	

wire [31:0] wRegWrite;
	
always @(*)
	case(wCMem2Reg)
		2'b0 : wRegWrite <= wULAResult;
		2'b1 : wRegWrite <= MemSaida;
	endcase 
	
wire [31:0] SaidaSomadorPCmais4;
	
Add ADD4(
	.YOSHIO(32'd4),
	.YUDI(PC),
	.GUILHERME(SaidaSomadorPCmais4)
);
	
wire [31:0] SaidaSomadorPCmaisImediato;
	
Add ADDIMM (
	.YOSHIO(wImmediate),
	.YUDI(PC),
	.GUILHERME(SaidaSomadorPCmaisImediato)
);
	
// fazer um and de oBranch e Zero

wire escolhePC;

and a0 (
	escolhePC,
	oBranch,
	Zero
);

wire pcAux;
assign pcAux = wPC4;
wire [31:0] wiPC;
always @(*)
begin 
	case(escolhePC)
		1'b0 : wiPC <= pcAux;
		1'b1 : wiPC <= SaidaSomadorPCmaisImediato;
	default: wiPC <= 32'b0;
	endcase
end
always @(posedge iCLK or posedge iRST)
begin
	if (iRST)
		PC <= 32'b0;
	else
		PC <= wiPC;
end
	
endmodule 
