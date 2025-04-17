module ripple_adder_nand (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire cout1, cout2, cout3;
    full_adder_nand(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout1));
    full_adder_nand(.a(a[1]), .b(b[1]), .cin(cout1), .sum(sum[1]), .cout(cout2));
    full_adder_nand(.a(a[2]), .b(b[2]), .cin(cout2), .sum(sum[2]), .cout(cout3));
    full_adder_nand(.a(a[3]), .b(b[3]), .cin(cout3), .sum(sum[3]), .cout(cout));
endmodule


module full_adder_nand (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    // sum = a ^ b ^ cin;
    wire ab_xor;

    xor_nand(a, b, ab_xor);
    xor_nand(sum, ab_xor, cin);

    // carry (cout) = a & b | cin & a | cin & b;
    wire and1, and2, and3, or1;
    and_nand(a, b, and1);
    and_nand(cin, a, and2);
    and_nand(cin, b, and3);
    or_nand(and1, and2, or1);
    or_nand(and3, or1, cout);
endmodule

module xor_nand (
    input a,
    input b,
    output out
);
    wire ab_nand, a_ab_nand, b_ab_nand;
    nand(ab_nand, a, b);
    nand(a_ab_nand, ab_nand, a);
    nand(b_ab_nand, ab_nand, b);
    nand(out, a_ab_nand, b_ab_nand);
endmodule

module and_nand (
    input a,
    input b,
    output out
);
    wire ab_nand;
    nand(ab_nand, a, b);
    nand(out, ab_nand, ab_nand); // basically not of nand
endmodule

module or_nand (
    input a,
    input b,
    output out
);
    wire ab_nand, a_not, b_not;
    nand(a_not, a, a); // not gate
    nand(b_not, b, b); // not gate
    nand(out, a_not, b_not);
endmodule
