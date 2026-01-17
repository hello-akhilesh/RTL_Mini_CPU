module register_file(
    input clk,
    input [1:0] read_reg1,
    input [1:0] read_reg2,
    input [1:0] write_reg,
    input [3:0] write_data,
    input reg_write,
    output [3:0] read_data1,
    output [3:0] read_data2
);

    reg [3:0] registers [0:3]; // 4 registers
    integer i;

    
    initial begin
        for (i = 0; i < 4; i = i + 1)
            registers[i] = 4'b0000;
    end

    // Read ports (combinational)
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

    // Write port (synchronous)
    always @(posedge clk) begin
        if (reg_write)
            registers[write_reg] <= write_data;
    end

endmodule
