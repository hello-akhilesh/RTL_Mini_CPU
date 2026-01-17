module control_unit(
    input clk,
    input reset,
    output reg [1:0] alu_op,
    output reg reg_write,
    output reg [1:0] write_reg,
    output reg [1:0] read_reg1,
    output reg [1:0] read_reg2
);

    reg [1:0] state, next_state;

    localparam FETCH   = 2'b00;
    localparam DECODE  = 2'b01;
    localparam EXECUTE = 2'b10;
    localparam WRITE   = 2'b11;

    reg [7:0] instruction;

    // ================= INSTRUCTION MEMORY =================
    reg [7:0] instr_mem [0:3];
    initial begin
        instr_mem[0] = 8'b00000111; // ADD R0, R1, R3
        instr_mem[1] = 8'b01011001; // SUB R1, R2, R1
        instr_mem[2] = 8'b10000010; // AND R0, R0, R2
        instr_mem[3] = 8'b11111100; // OR  R3, R3, R0
    end

    reg [1:0] pc;

    // ================= STATE REGISTER =================
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= FETCH;
        else
            state <= next_state;
    end

    // ================= NEXT STATE LOGIC =================
    always @(*) begin
        case(state)
            FETCH:   next_state = DECODE;
            DECODE:  next_state = EXECUTE;
            EXECUTE: next_state = WRITE;
            WRITE:   next_state = FETCH;
            default: next_state = FETCH;
        endcase
    end

    // ================= INSTRUCTION REGISTER (CLOCKED) =================
    always @(posedge clk or posedge reset) begin
        if (reset)
            instruction <= 8'b0;
        else if (state == FETCH)
            instruction <= instr_mem[pc];
    end

    // ================= OUTPUT / CONTROL LOGIC =================
    always @(*) begin
        // Default values
        alu_op    = 0;
        reg_write = 0;
        write_reg = 0;
        read_reg1 = 0;
        read_reg2 = 0;

        case(state)
            DECODE: begin
                alu_op    = instruction[7:6];
                write_reg = instruction[5:4];
                read_reg1 = instruction[3:2];
                read_reg2 = instruction[1:0];
            end

            WRITE: begin
                reg_write = 1;
            end
        endcase
    end

    // ================= PROGRAM COUNTER =================
    always @(posedge clk or posedge reset) begin
        if(reset)
            pc <= 0;
        else if(state == WRITE)
            pc <= pc + 1;
    end

endmodule
