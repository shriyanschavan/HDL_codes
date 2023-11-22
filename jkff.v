module jkff(j, k, clk, q, qbar);
input j, k, clk;
output q, qbar;
wire jint, kbar, kint, dint;
and (jint, j, qbar);
not (kbar, k);
and (kint, kbar, q);
or (dint, jint, kint);
dff(dint, clk, q, qbar);
endmodule
