`timescale 1ns / 1ps

module tb_conv;

    reg [3:0] x[7:0];
    reg [3:0] h[7:0];
    wire [3:0] out[14:0];

    // Instantiate the DUT
    convolve uut (
        .x(x),
        .h(h),
        .out(out)
    );

    initial begin
        // Initialize x
        x[0] = 4'd1; x[1] = 4'd2; x[2] = 4'd3; x[3] = 4'd4;
        x[4] = 4'd0; x[5] = 4'd1; x[6] = 4'd0; x[7] = 4'd1;

        // Initialize h
        h[0] = 4'd1; h[1] = 4'd0; h[2] = 4'd1; h[3] = 4'd0;
        h[4] = 4'd1; h[5] = 4'd0; h[6] = 4'd1; h[7] = 4'd0;

        #10;

        $display("Convolution result:");
        for (int i = 0; i < 15; i = i + 1) begin
            $display("out[%0d] = %0d", i, out[i]);
        end

        $finish;
    end

endmodule

// iverilog -g2012 -o tb_conv.vvp conv.v tb_conv.v
// vvp tb_conv.vvp
