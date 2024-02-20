module MAC #(
    parameter bit_width = 8,
    parameter acc_width = 32
)(
    input clk,
    input control,
    input reset,
    input [acc_width - 1:0] acc_in,
    input [bit_width - 1:0] data_in,
    input [bit_width - 1:0] wt_path_in,
    output reg [acc_width - 1:0] acc_out,
    output reg [bit_width - 1:0] data_out,
    output reg [bit_width - 1:0] wt_path_out
);

    reg [bit_width + bit_width - 1:0] result;
    reg [acc_width - 1:0] acc_reg;
    reg [bit_width - 1:0] weight_reg;

    always @(posedge clk) begin
        if (reset) begin
            acc_out <= 0;
            wt_path_out <= 0;
        end
        else begin
            acc_out <= acc_reg;
            wt_path_out <= wt_path_in;
            data_out <= data_in;
        end
    end

    always @* begin
        result = data_in * wt_path_in;
        acc_reg = acc_in + result;
    end
endmodule

