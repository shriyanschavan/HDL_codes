module fulladd (cin, x, y, s, cout);
input cin, x, y;
output s, cout;
assign s = x ^ y ^ cin;
assign cout = (x & y) | (x & cin) | (y & cin);
endmodule

module bitadd4 (carryin, X, Y, S, carryout, ssd1x, ssd0x, ssd1y, ssd0y, ssd1o, ssd0o);
input [3:0] X, Y;
assign X1 = X;
assign Y1 = Y;
output [3:0] S;
wire [4:0] S1;
input carryin;
//wire carryin;
//assign carryin = 0;
output carryout;
wire [3:1] C;
output reg [6:0] ssd1x, ssd0x, ssd1y, ssd0y, ssd1o, ssd0o;
assign S1 = {carryout, S};
reg [6:0] ro1, ro0, rx1, rx0, ry1, ry0; 
fulladd stage0 (carryin, X[0], Y[0], S[0], C[1]);
fulladd stage1 (C[1], X[1], Y[1], S[1], C[2]);
fulladd stage2 (C[2], X[2], Y[2], S[2], C[3]);
fulladd stage3 (C[3], X[3], Y[3], S[3], carryout);

always @ (S1)
begin
case(S1)
5'b00000: 
begin
ro1 = 7'b1111111;
ro0 = 7'b0000001;
end
5'b00001:
begin
ro1 = 7'b1111111;
ro0 = 7'b1001111;
end
5'b00010:
begin
ro1 = 7'b1111111;
ro0 = 7'b0010010;
end
5'b00011:
begin
ro1 = 7'b1111111;
ro0 = 7'b0000110;
end

5'b00100:
begin
ro1 = 7'b1111111;
ro0 = 7'b1001100;
end

5'b00101:
begin
ro1 = 7'b1111111;
ro0 = 7'b0100100;
end

5'b00110:
begin
ro1 = 7'b1111111;
ro0 = 7'b0100000;
end

5'b00111:
begin
ro1 = 7'b1111111;
ro0 = 7'b0001111;
end

5'b01000:
begin
ro1 = 7'b1111111;
ro0 = 7'b0000000;
end

5'b01001:
begin
ro1 = 7'b1111111;
ro0 = 7'b0000100;
end

5'b01010:
begin
ro1 = 7'b1001111;
ro0 = 7'b0000001;
end

5'b01011:
begin
ro1 = 7'b1001111;
ro0 = 7'b1001111;
end

5'b01100:
begin
ro1 = 7'b1001111;
ro0 = 7'b0010010;
end

5'b01101:
begin
ro1 = 7'b1001111;
ro0 = 7'b0000110;
end

5'b01110:
begin
ro1 = 7'b1001111;
ro0 = 7'b1001100;
end

5'b01111:
begin
ro1 = 7'b1001111;
ro0 = 7'b0100100;
end

5'b10000:
begin
ro1 = 7'b1001111;
ro0 = 7'b0100000;
end

5'b10001:
begin
ro1 = 7'b1001111;
ro0 = 7'b0001111;
end

5'b10010:
begin
ro1 = 7'b1001111;
ro0 = 7'b0000000;
end

5'b10011:
begin
ro1 = 7'b1001111;
ro0 = 7'b0000100;
end

5'b10100:
begin
ro1 = 7'b0010010;
ro0 = 7'b0000001;
end

5'b10101:
begin
ro1 = 7'b0010010;
ro0 = 7'b1001111;
end

5'b10110:
begin
ro1 = 7'b0010010;
ro0 = 7'b0010010;
end

5'b10111:
begin
ro1 = 7'b0010010;
ro0 = 7'b0000110;
end

5'b11000:
begin
ro1 = 7'b0010010;
ro0 = 7'b1001100;
end

5'b11001:
begin
ro1 = 7'b0010010;
ro0 = 7'b0100100;
end

5'b11010:
begin
ro1 = 7'b0010010;
ro0 = 7'b0100000;
end

5'b11011:
begin
ro1 = 7'b0010010;
ro0 = 7'b0001111;
end

5'b11100:
begin
ro1 = 7'b0010010;
ro0 = 7'b0000000;
end

5'b11101:
begin
ro1 = 7'b0010010;
ro0 = 7'b0000100;
end

5'b11110:
begin
ro1 = 7'b0000110;
ro0 = 7'b0000001;
end

5'b11111:
begin
ro1 = 7'b0000110;
ro0 = 7'b1001111;
end
default:
begin
ro1 = 7'b1111111;
ro0 = 7'b1111111;
end

endcase
 ssd1o = ro1;
 ssd0o = ro0;
end

always @ (X)
begin
case(X)
4'b0000:
begin 
rx1 = 7'b1111111;
rx0 = 7'b0000001;
end
4'b0001:
begin
rx1 = 7'b1111111; 
rx0 = 7'b1001111;
end
4'b0010:
begin
rx1 = 7'b1111111;
rx0 = 7'b0010010;
end

4'b0011:
begin
rx1 = 7'b1111111;
rx0 = 7'b0000110;
end

4'b0100:
begin
rx1 = 7'b1111111;
rx0 = 7'b1001100;
end

4'b0101:
begin
rx1 = 7'b1111111;
rx0 = 7'b0100100;
end

4'b0110:
begin
rx1 = 7'b1111111;
rx0 = 7'b0100000;
end

4'b0111:
begin
rx1 = 7'b1111111;
rx0 = 7'b0001111;
end

4'b1000:
begin
rx1 = 7'b1111111;
rx0 = 7'b0000000;
end

4'b1001:
begin
rx1 = 7'b1111111;
rx0 = 7'b0000100;
end

4'b1010:
begin
rx1 = 7'b1001111;
rx0 = 7'b0000001;
end

4'b1011:
begin
rx1 = 7'b1001111;
rx0 = 7'b1001111;
end

4'b1100:
begin
rx1 = 7'b1001111;
rx0 = 7'b0010010;
end

4'b1101:
begin
rx1 = 7'b1001111;
rx0 = 7'b0000110;
end

4'b1110:
begin
rx1 = 7'b1001111;
rx0 = 7'b1001100;
end

4'b1111:
begin
rx1 = 7'b1001111;
rx0 = 7'b0100100;
end
default: 
begin
rx1 = 7'b1111111;
rx0 = 7'b1111111;
end
endcase
 ssd1x = rx1;
 ssd0x = rx0;
end

always @ (Y)
begin
case(Y)
4'b0000:
begin 
ry1 = 7'b1111111;
ry0 = 7'b0000001;
end
4'b0001:
begin
ry1 = 7'b1111111; 
ry0 = 7'b1001111;
end
4'b0010:
begin
ry1 = 7'b1111111;
ry0 = 7'b0010010;
end
4'b0011:
begin
ry1 = 7'b1111111;
ry0 = 7'b0000110;
end

4'b0100:
begin
ry1 = 7'b1111111;
ry0 = 7'b1001100;
end

4'b0101:
begin
ry1 = 7'b1111111;
ry0 = 7'b0100100;
end

4'b0110:
begin
ry1 = 7'b1111111;
ry0 = 7'b0100000;
end

4'b0111:
begin
ry1 = 7'b1111111;
ry0 = 7'b0001111;
end

4'b1000:
begin
ry1 = 7'b1111111;
ry0 = 7'b0000000;
end

4'b1001:
begin
ry1 = 7'b1111111;
ry0 = 7'b0000100;
end

4'b1010:
begin
ry1 = 7'b1001111;
ry0 = 7'b0000001;
end

4'b1011:
begin
ry1 = 7'b1001111;
ry0 = 7'b1001111;
end

4'b1100:
begin
ry1 = 7'b1001111;
ry0 = 7'b0010010;
end

4'b1101:
begin
ry1 = 7'b1001111;
ry0 = 7'b0000110;
end

4'b1110:
begin
ry1 = 7'b1001111;
ry0 = 7'b1001100;
end

4'b1111:
begin
ry1 = 7'b1001111;
ry0 = 7'b0100100;
end
default:
begin 
ry1 = 7'b1111111;
ry0 = 7'b1111111;
end

endcase
 ssd1y = ry1;
 ssd0y = ry0;
end

endmodule

