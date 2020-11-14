module Controlador(
	input [6:0] iInst,
	output oBranch, oLeMem, oEscMem, oMemPraReg, oULASrc, oEscReg, oJump,
	output [1:0] oULAOp
);

always @(*)
begin
	case(iInst)
	
	7'b0110011:  // tipo - R
	begin
		oBranch <= 1'b0;
		oLeMem <= 1'b0;
		oEscMem <= 1'b0;
		oMemPraReg <= 1'b0;
		oULAOp <= 2'b10;
		oULASrc <= 1'b0;
		oEscReg <= 1'b1;
		oJump <= 1'b0;
	end

	7'b1101111 : 	// jal
	begin
		oBranch <= 1'b0;
		oLeMem <= 1'b0;
		oEscMem <= 1'b0;
		oMemPraReg <= 1'b0;
		oULAOp <= 2'b11; // nao sei
		oULASrc <= 1'b1;
		oEscReg <= 1'b1;
		oJump <= 1'b1;
	end
	
	7'b0100011  :    // SW
	begin
		oBranch <= 1'b0;
		oLeMem <= 1'b0;
		oEscMem <= 1'b1;
		oMemPraReg <= 1'bx;
		oULAOp <= 2'b00; // nao sei
		oULASrc <= 1'b1;
		oEscReg <= 1'b0;
		oJump <= 1'b0;
	end
	
	7'b0000011  :    //LW
	begin
		oBranch <= 1'b0;
		oLeMem <= 1'b1;
		oEscMem <= 1'b0;
		oMemPraReg <= 1'b1; 
		oULAOp <= 2'b00; // nao sei
		oULASrc <= 1'b1;
		oEscReg <= 1'b1;
		oJump <= 1'b0;
	end
	
	7'b1100011 :    // BEQ
	begin
		oBranch <= 1'b1;
		oLeMem <= 1'b0;
		oEscMem <= 1'b0;
		oMemPraReg <= 1'bx;
		oULAOp <= 2'b01;
		oULASrc <= 1'b0;
		oEscReg <= 1'b0;
		oJump <= 1'b0;
	end
	
	default:
	begin
		oBranch <= 1'b0;
		oLeMem <= 1'b0;
		oEscMem <= 1'b0;
		oMemPraReg <= 1'b0;
		oULAOp <= 2'b0;
		oULASrc <= 1'b0;
		oEscReg <= 1'b0;
		oJump <= 1'b0;
	end
	endcase
end

endmodule 