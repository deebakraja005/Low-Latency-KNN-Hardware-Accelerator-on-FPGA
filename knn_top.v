module knn_top(
    input clk,
    input reset,
    input start,
    input load,
    input K_sel,
    input [7:0] sw,
    output [3:0] led
);

reg [7:0] x_reg = 0;
reg [7:0] y_reg = 0;
reg select_xy = 0;

wire result;
wire done;

always @(posedge clk) begin
    if (reset) begin
        x_reg <= 0;
        y_reg <= 0;
        select_xy <= 0;
    end
    else if (load) begin
        if (select_xy == 0) begin
            x_reg <= sw;
            select_xy <= 1;
        end
        else begin
            y_reg <= sw;
            select_xy <= 0;
        end
    end
end

knn_controller core(
    .clk(clk),
    .reset(reset),
    .start(start),
    .K_sel(K_sel),
    .x_in(x_reg),
    .y_in(y_reg),
    .result(result),
    .done(done)
);

assign led[0] = result;
assign led[1] = done;
assign led[2] = select_xy;
assign led[3] = 0;

endmodule
