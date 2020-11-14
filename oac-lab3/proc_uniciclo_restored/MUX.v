module MUX (input [31:0] A, B, C, D, input [1:0] Sel,
                    output [31:0] S);

always @(*)
    case(Sel)
       2'b00:     S <= A;
       2'b01:     S <= B;
       2'b10:     S <= C;
       2'b11:     S <= D;
   endcase

endmodule