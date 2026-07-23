
`timescale 1ns / 1ps
module tb_Traffic_Light_Controller;
    reg clk;
    reg rst;
    wire [2:0] light_M1;
    wire [2:0] light_M2;
    wire [2:0] light_MT;
    wire [2:0] light_S;
    // Instantiate DUT
    Traffic_Light_Controller uut (
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_M2(light_M2),
        .light_MT(light_MT),
        .light_S(light_S) );
    // Clock generation (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    // Reset generation
    initial begin
        rst = 1;
        #20;
        rst = 0;
    end
    // Monitor outputs
    initial begin
        $monitor("Time=%0t rst=%b M1=%b M2=%b MT=%b S=%b",
                  $time, rst,
                  light_M1, light_M2,
                  light_MT, light_S);
    end
    // Run simulation
    initial begin
        #2000;
        $finish;
    end
endmodule
