module dff (d, clk, q, qbar);
input d, clk;
output q, qbar;

gatedsr(d, ~d, clk, q, qbar);
endmodule
