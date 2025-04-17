`timescale 1ns/1ns

module tb_ripple_adder_nand;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    ripple_adder_nand dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $dumpfile("ripple_adder_nand.vcd");
        $dumpvars(0, tb_ripple_adder_nand);

        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #50 a = 4'b1111; b = 4'b1111; cin = 1'b0;
        #50 a = 4'b1010; b = 4'b0101; cin = 1'b0;
        #50 a = 4'b0001; b = 4'b0001; cin = 1'b1;
        #50 a = 4'b0110; b = 4'b1001; cin = 1'b0;
        #50 a = 4'b1111; b = 4'b1111; cin = 1'b1;
        #50 a = 4'b0000; b = 4'b1010; cin = 1'b0;
        #50 a = 4'b1111; b = 4'b0000; cin = 1'b0;
        #50 a = 4'b1001; b = 4'b1001; cin = 1'b0;
        #50 a = 4'b0111; b = 4'b0001; cin = 1'b1;

        $finish;
    end
endmodule
