module Controlador(
	input [6:0] iInst,
	output oBranch, oLeMem, oEscMem, oMemPraReg, oULASrc, oEscReg, oJump,
	output [3:0] oULAOp
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
		oULAOp <= 4'b0010;
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
		oULAOp <= 4'b0011; // nao sei
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
		oULAOp <= 4'b0000; // nao sei
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
		oULAOp <= 4'b0000; // nao sei
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
		oULAOp <= 4'b0001;
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
		oULAOp <= 4'b0;
		oULASrc <= 1'b0;
		oEscReg <= 1'b0;
		oJump <= 1'b0;
	end
	endcase
end

endmodule 