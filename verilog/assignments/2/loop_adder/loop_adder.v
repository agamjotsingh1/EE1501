module loop_adder (
);
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
