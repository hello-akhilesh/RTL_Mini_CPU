module alu(
    input [1:0] opcode,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] result
);

    always @(*) begin
        case(opcode)
            2'b00: result = a + b; // ADD
            2'b01: result = a - b; // SUB
            2'b10: result = a & b; // AND
            2'b11: result = a | b; // OR
            default: result = 0;
        endcase
    end
endmodule
