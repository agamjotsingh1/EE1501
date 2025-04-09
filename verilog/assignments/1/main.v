module priority_encoder (
    input [3:0] in,
    output reg [1:0] out,
    output reg valid
);
    
    always @(*) begin
        valid = | in;
        casez (in)
            4'bzzz1: out = 2'b00;
            4'bzz10: out = 2'b01;
            4'bz100: out = 2'b10;
            4'b1000: out = 2'b11;
            default: out = 2'b00;
        endcase
    end
endmodule

module even_parity_generator(
    input [7:0] data,
    output parity
);
    assign parity = ^ data;
endmodule

module up_counter(
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if(reset) count <= 4'b0000;
        else if(enable) begin
            count <= count + 1;
        end
    end
endmodule
