module knn_controller(
    input clk,
    input reset,
    input start,
    input K_sel,
    input [7:0] x_in,
    input [7:0] y_in,
    output reg result,
    output reg done
);

reg start_d;
wire start_pulse;

always @(posedge clk)
    start_d <= start;

assign start_pulse = start & ~start_d;

reg [3:0] addr;
wire [7:0] x_train, y_train;
wire class_train;
wire [17:0] distance;

dataset_rom rom(addr, x_train, y_train, class_train);
distance_unit du(x_in, y_in, x_train, y_train, distance);

reg [17:0] d0,d1,d2,d3,d4;
reg c0,c1,c2,c3,c4;

reg [2:0] count0, count1;
reg [2:0] K;

reg [1:0] state;
localparam S_IDLE=0, S_COMPUTE=1, S_VOTE=2, S_DONE=3;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= S_IDLE;
        done <= 0;
        result <= 0;
        addr <= 0;
        d0<=18'h3FFFF; d1<=18'h3FFFF; d2<=18'h3FFFF;
        d3<=18'h3FFFF; d4<=18'h3FFFF;
    end
    else
    begin
        case(state)
        S_IDLE:
        begin
            done <= 0;
            if(start_pulse)
            begin
                addr <= 0;
                d0<=18'h3FFFF; d1<=18'h3FFFF; d2<=18'h3FFFF;
                d3<=18'h3FFFF; d4<=18'h3FFFF;
                state <= S_COMPUTE;
            end
        end
        S_COMPUTE:
        begin
            if(distance < d0) begin
                d4<=d3; d3<=d2; d2<=d1; d1<=d0; d0<=distance;
            end
            else if(distance < d1) begin
                d4<=d3; d3<=d2; d2<=d1; d1<=distance;
            end
            else if(distance < d2) begin
                d4<=d3; d3<=d2; d2<=distance;
            end
            else if(distance < d3) begin
                d4<=d3; d3<=distance;
            end
            else if(distance < d4) begin
                d4<=distance;
            end
            if(addr == 4'd15)
                state <= S_VOTE;
            else
                addr <= addr + 1;
        end
        S_VOTE:
        begin
            result <= (d0 < 18'd10000); // simple stable classification
            state <= S_DONE;
        end
        S_DONE:
        begin
            done <= 1;
        end
        endcase
    end
end
endmodule
