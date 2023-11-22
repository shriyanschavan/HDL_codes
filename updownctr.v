module updownctr(clk, rst, w, oups, oupl);
input clk, rst, w;
output reg [6:0] oups;
output reg [3:0] oupl;
wire clk1sec;
clock clk1 (clk, clk1sec);


always @ (posedge(clk1sec) or posedge(rst))
begin
if(rst == 1)
	oupl <= 0;
else
	if(w == 0)
		if (oupl == 15)
			oupl <= 0;
		else
			oupl <= oupl + 1;
	else
		if(oupl == 0)
			oupl <= 15;
		else 
			oupl <= oupl - 1;
end		
			
always@(oupl)
begin
case(oupl)
4'd0:
	begin
	oups = 7'b0000001;
	end
4'd1: 
	begin
	oups = 7'b1001111;
	end
4'd2: 
	begin
	oups = 7'b0010010;
	end
4'd3: 
	begin
	oups = 7'b0000110;
	end
4'd4: 
	begin
	oups = 7'b1001100;
	end
4'd5: 
	begin
	oups = 7'b0100100;
	end
4'd6: 
	begin
	oups = 7'b0100000;
	end
4'd7: 
	begin
	oups = 7'b0001111;
	end
4'd8: 
	begin
	oups = 7'b0000000;
	end
4'd9: 
	begin
	oups = 7'b0000100;
	end
4'd10: 
	begin
	oups = 7'b0000010;
	end
4'd11: 
	begin
	oups = 7'b1100000;
	end
4'd12: 
	begin
	oups = 7'b0110001;
	end
4'd13: 
	begin
	oups = 7'b1000010;
	end
4'd14: 
	begin
	oups = 7'b0110000;
	end
4'd15: 
	begin
	oups = 7'b0111000;
	end
endcase
end
endmodule


	

 

			
	