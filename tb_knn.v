`timescale 1ns/1ps

module tb_knn;

reg clk = 0;
always #5 clk = ~clk;   // 100 MHz clock

reg reset = 1;
reg start = 0;
reg K_sel = 0;  
reg signed [7:0] x_in, y_in;

wire result;
wire done;

reg [31:0] start_time;
reg [31:0] end_time;

// Instantiate controller (named mapping = safe)
knn_controller uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .K_sel(K_sel),
    .x_in(x_in),
    .y_in(y_in),
    .result(result),
    .done(done)
);

initial begin

    // Initialize
    reset = 1;
    start = 0;
    x_in = 0;
    y_in = 0;
    K_sel = 0;

    #20 reset = 0;

    // =============================
    // TEST 1
    // =============================
    x_in = 15;
    y_in = 22;
    K_sel = 0;

    @(posedge clk);
    start = 1;
    start_time = $time;
    @(posedge clk);
    start = 0;

    @(posedge done);
    end_time = $time;

    #1;  // allow signal settle

    $display(" ");
    $display("=================================");
    $display("TEST 1 RESULTS");
    $display("---------------------------------");
    $display("Latency       : %0t ns", end_time - start_time);
    $display("Clock Cycles  : %0d", (end_time - start_time)/10);
    $display("Result        : %0d (Expected 0)", result);
    $display("=================================");

    #50;

    // =============================
    // TEST 2
    // =============================
    x_in = 110;
    y_in = 120;
    K_sel = 1;

    @(posedge clk);
    start = 1;
    start_time = $time;
    @(posedge clk);
    start = 0;

    @(posedge done);
    end_time = $time;

    #1;

    $display(" ");
    $display("=================================");
    $display("TEST 2 RESULTS");
    $display("---------------------------------");
    $display("Latency       : %0t ns", end_time - start_time);
    $display("Clock Cycles  : %0d", (end_time - start_time)/10);
    $display("Result        : %0d (Expected 1)", result);
    $display("=================================");
    $display(" ");

    #20;
    $stop;
end

endmodule
