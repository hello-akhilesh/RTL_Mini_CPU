module mini_cpu(
    input clk,
    input reset
);

    wire [3:0] read1, read2, alu_result;
    wire [1:0] alu_op, write_reg, read_reg1, read_reg2;
    wire reg_write;

    // Control Unit
    control_unit cu(
        .clk(clk),
        .reset(reset),
        .alu_op(alu_op),
        .reg_write(reg_write),
        .write_reg(write_reg),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2)
    );

    // Register File
    register_file rf(
        .clk(clk),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(alu_result),
        .reg_write(reg_write),
        .read_data1(read1),
        .read_data2(read2)
    );

    // ALU
    alu a(
        .opcode(alu_op),
        .a(read1),
        .b(read2),
        .result(alu_result)
    );

endmodule
