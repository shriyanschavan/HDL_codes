module decoders (en, x, z);
input en;
input [2:0] x;
output [7:0] z;
wire x0n, x1n, x2n;
not(x0n, x[0]);
not(x1n, x[1]);
not(x2n, x[2]);
and(z[0], x0n, x1n, x2n, en);
and(z[1], x[0], x1n, x2n, en);
and(z[2], x0n, x[1], x2n, en);
and(z[3], x[0], x[1], x2n, en);
and(z[4], x0n, x1n, x[2], en);
and(z[5], x[0], x1n, x[2], en);
and(z[6], x0n, x[1], x[2], en);
and(z[7], x[0], x[1], x[2], en);
endmodule

module decoders (en, x, z);
input [2:0] x;
output reg [7:0] z;
input en;

always @ (x or en)
begin

if (en == 1)
begin
case(x)
	3'b000: z = 8'b00000001;
	3'b001: z = 8'b00000010;
	3'b010: z = 8'b00000100;
	3'b011: z = 8'b00001000;
	3'b100: z = 8'b00010000;
	3'b101: z = 8'b00100000;
	3'b110: z = 8'b01000000;
	3'b111: z = 8'b10000000;
	default: z = 8'b00000000;
endcase
end
else
z = 8'b00000000;
end
endmodule
