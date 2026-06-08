module distance_unit(
    input [7:0] x_in, y_in,
    input [7:0] x_train, y_train,
    output [17:0] distance
);

wire [8:0] dx = x_in - x_train;
wire [8:0] dy = y_in - y_train;

wire [17:0] dx2 = dx * dx;
wire [17:0] dy2 = dy * dy;

assign distance = dx2 + dy2;

endmodule
