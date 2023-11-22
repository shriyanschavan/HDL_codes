module latch_sr(ip1, ip2, clk, q, qbar);
input ip1, ip2, clk;
output q, qbar;

jkff(ip1, ip2, clk, q, qbar);
endmodule 