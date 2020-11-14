
`ifndef PARAM
	`include "Parametros.v"
`endif

`timescale 1 ns / 1 ps

module ALU_tb;

reg [31:0] IA, IB;
reg [4:0] ICONTROL;
wire [31:0] ORESULT;

ALU alu0 (
	.iA(IA),
	.iB(IB),
	.iControl(ICONTROL),
	.oResult(ORESULT)
	);
	
initial
	begin
	
		$display($time, " << Starting Simulation >> ");

		IA = 32'd255;
		IB = 32'd15;
		ICONTROL = OPXOR;
	
		#10 
		IA = 32'd0;
		IB = 32'd1;
		ICONTROL = OPOR;
		
		#10
		IA = 32'd0;
		IB = 32'd1;
		ICONTROL = OPAND;
		
		#10
		IA = 32'd1;
		IB = 32'd1;
		ICONTROL = OPADD;

		#10
		IA = 32'd0;
		IB = 32'd1;
		ICONTROL = OPSUB;

		#10
		IA = 32'd2;
		IB = 32'd2;
		ICONTROL = OPMUL;
		
		#10
		IA = 32'd4;
		IB = 32'd2;
		ICONTROL = OPDIV;

		#10
		IA = 32'd4;
		IB = 32'd0;
		ICONTROL = OPDIV;
		
		#10
		IA = 32'd4;
		IB = -32'd2;
		ICONTROL = OPMULHU;
		
		#100;
		$display($time, "<< Simulation Complete >>");
		$stop;
	end

	
initial
	begin
		$display("\t\ttime,\tiA,\tiB,\tiControl,\toResult"); 
		$monitor("%d,\t%h,\t%h,\t%h,\t%h,",$time, IA, IB, ICONTROL, ORESULT);	
	end


endmodule
