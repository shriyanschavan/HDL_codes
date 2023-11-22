module gatedsr(s, r, clk, q, qbar);
input s, r, clk;
output q, qbar;
wire sint, rint;
and (sint, s, clk);
and (rint, r, clk);
latchsrnor(sint, rint, q, qbar);
endmodule 