// AAAAAAAAAAAAAAA TEM MTA COISA FALTANDO TEM Q VER AS COISAS AI EMBAIXO

module CamDado(
	// input e clock
	input wire iCLK, iRST,
	input wire [31:0] iPCInicial,
	
	// sinais de controle
	output [31:0] wInst,
	input wCRegWrite,
	input wCMemWrite,
	input wCMemRead,
	input [2:0] wCMem2Reg,
	input [2:0] wCOrigPC,
	input [4:0] wCULAControl,
);

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
	.iInst(wInstr),
	.oSaida(wImmediate)
);

// ULA - Unidade Lógica-Aritmetica

wire [31:0] wULAResult;

ULA ULA0 (
	.iControl(wCULAControl),
	.iA(wOrigAULA),
	.iB(wOrigBULA),
	.oResult(wULAResult)
);


// TEM QUE FAZER ISSO AQUI EM BAIXO AINDA

// Unidade de controle de Branches 

wire wBranch; 

BranchControl BC0 (
	.iFunct3(wFunct3),
	.iA(wRead1),
	.iB(wRead2),
	.oBranch(wBranch)
);

// multiplexadores

wire [31:0] wOrigBULA;

always @(*)
	case(wCOrigBUla)
		2'b00   : wOrigBULA <= wRead2;
		2'b01   : wOrigBULA <= wImmediate;
		default : wOrigBULA <= 32'b0;
	endcase 
