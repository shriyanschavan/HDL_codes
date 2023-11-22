module latchsrnor(s, r, q, qbar);
input s, r;
output q, qbar;
nor (q, r, qbar);
nor (qbar, s, q);
endmodule


//module latch_sr(s, r, q, qbar);
//input s, r;
//output q, qbar;
//wire set, rst;
//not (set, s);
//not (rst, r);
//nand (q, set, qbar);
//nand (qbar, rst, q);
//endmodule


//module latch_sr(s, r, clk, q, qbar);
//input s, r, clk;
//output q, qbar;
//wire sint, rint;
//and (sint, s, clk);
//and (rint, r, clk);
//nor (q, rint, qbar);
//nor (qbar, sint, q);
//endmodule



//module latch_sr(d, clk, q, qbar);
//input d, clk;
//output q, qbar;
//wire s, r, sint, rint;
//assign s = (d);
//assign r = ~(d);
//and (sint, s, clk);
//and (rint, r, clk);
//nor (q, rint, qbar);
//nor (qbar, sint, q);
//endmodule

//module latch_sr(j, k, clk, q, qbar);
//input j, k, clk;
//output q, qbar;
//wire jint, kbar, kint, dint, s, r, sint, rint;
//and (jint, j, qbar);
//not (kbar, k);
//and (kint, kbar, q);
//or (dint, jint, kint);
//assign s = (dint);
//assign r = ~(dint);
//and (sint, s, clk);
//and (rint, r, clk);
//nor (q, rint, qbar);
//nor (qbar, sint, q);
//endmodule
