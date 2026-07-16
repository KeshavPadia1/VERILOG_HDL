module counter_tb;
reg reset,clk,load,mode;
reg [3:0] d_in;
wire [3:0] count;

counter C(reset,load,d_in,clk,mode,count);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor($time," Reset=%b Load=%b d_in=%b Mode=%b CLK=%b Count=%b",
             reset,load,d_in,mode,clk,count);

    reset = 1; load = 0; mode = 0; d_in = 0;
    #12 reset = 0;                          

    #8  load = 1; d_in = 4'b0010; mode = 1; 
    #10 load = 0;                            
    #40 mode = 0;                            
    #100 $finish;
end
endmodule