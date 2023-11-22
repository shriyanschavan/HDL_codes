module encoder (x, y, z);
input [7:0] x;
output reg [2:0] y;
output reg z;

always @ (x)
begin
case(x)
	8'b00000001: 
	begin
	y = 3'b000;
	z = 1;
	end
	
	8'b00000010:
	begin
	y = 3'b001;
	z = 1;
	end
	
	8'b00000100:
	begin
	y = 3'b010;
	z = 1;
	end
	
	8'b00001000:
	begin
	y = 3'b011;
	z = 1;
	end
	
	8'b00010000:
	begin
	y = 3'b100;
	z = 1;
	end
	
	8'b00100000:
	begin
	y = 3'b101;
	z = 1;
	end
	
	8'b01000000:
	begin
	y = 3'b110;
	z = 1;
	end 
	
	8'b10000000:
	begin
	y = 3'b111;
	z = 1;
	end 
	
	8'b00000000:
	begin
	z = 0;
	end
	
	default: 
	begin
	z = 0;
	end
	
endcase
end
endmodule
