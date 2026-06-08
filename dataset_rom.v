module dataset_rom(
    input [3:0] addr,
    output reg [7:0] x,
    output reg [7:0] y,
    output reg class
);

always @(*) begin
    case(addr)
        4'd0:  begin x=10;  y=20;  class=0; end
        4'd1:  begin x=12;  y=18;  class=0; end
        4'd2:  begin x=15;  y=25;  class=0; end
        4'd3:  begin x=20;  y=30;  class=0; end
        4'd4:  begin x=25;  y=28;  class=0; end
        4'd5:  begin x=18;  y=22;  class=0; end
        4'd6:  begin x=100; y=110; class=1; end
        4'd7:  begin x=105; y=115; class=1; end
        4'd8:  begin x=120; y=130; class=1; end
        4'd9:  begin x=125; y=135; class=1; end
        4'd10: begin x=110; y=118; class=1; end
        4'd11: begin x=115; y=125; class=1; end
        4'd12: begin x=30;  y=35;  class=0; end
        4'd13: begin x=28;  y=32;  class=0; end
        4'd14: begin x=130; y=140; class=1; end
        4'd15: begin x=135; y=145; class=1; end
    endcase
end

endmodule
