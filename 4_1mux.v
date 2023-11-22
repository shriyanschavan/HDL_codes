module mux4_1(a, b, c, d, s, f, ip0, ip1, ip2, ip3, sel, op);
input a,b,c,d;
input [1:0]s;
wire [3:0]oi;
output ip0, ip1, ip2, ip3;
output [1:0]sel;
output op;
output f;

and(oi[0], ~s[0], ~s[1], a);
and(oi[1], s[0], ~s[1], b);
and(oi[2], ~s[0], s[1], c);
and(oi[3], s[0], s[1], d);
or(f ,oi[0], oi[1], oi[2], oi[3]);

assign ip0 = a;
assign ip1 = b;
assign ip2 = c;
assign ip3 = d;
assign sel[0] = s[0];
assign sel[1] = s[1];
assign op = f;

endmodule

//-----------------------------------------------------------------------//

module mux4_1 (a, b, c, d, s, f, ip0, ip1, ip2, ip3, sel, op);
input a,b,c,d;
input [1:0] s;
output ip0, ip1, ip2, ip3;
output [1:0]sel;
output op;
output reg f;

always@(a,b,c,d,s)
	begin 
		case (s)
		
		2'b00 : f <= a;
		2'b01 : f <= b;
		2'b10 : f <= c;
		2'b11 : f <= d;
		
		endcase
		
	end
assign ip0 = a;
assign ip1 = b;
assign ip2 = c;
assign ip3 = d;
assign sel[0] = s[0];
assign sel[1] = s[1];
assign op = f;

endmodule
		
		
