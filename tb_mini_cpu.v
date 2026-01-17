module tb_mini_cpu;

    reg clk;
    reg reset;

    mini_cpu cpu(
        .clk(clk),
        .reset(reset)
    );

    // Clock
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("mini_cpu.vcd");
        $dumpvars(0, tb_mini_cpu);

        reset = 1; #10;
        reset = 0;

        #200; // run simulation
        $finish;
    end

endmodule
