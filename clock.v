module clock (clkin, clkout);
input clkin;
output reg clkout;
integer count = 0;


always@(posedge clkin)
begin
 if (count == 25000000)
	begin
    clkout = ~clkout;
	 count = 0;
	 end 
	 else 
	 count = count + 1;
end
endmodule
	 