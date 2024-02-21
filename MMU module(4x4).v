// MMU module
module MMU #(parameter depth=4, bit_width=8, acc_width=32, size=4)(
    input clk,
    input control,
    input reset,
    input [(bit_width*depth)-1:0] data_arr,
    input [(bit_width*depth)-1:0] wt_arr,
    output reg [acc_width*size-1:0] acc_out
);

    wire [7:0] data_out00, data_out01, data_out02, data_out03, data_out10, data_out11, data_out12, data_out13, data_out20, data_out21, data_out22, data_out23, data_out30, data_out31, data_out32, data_out33;
    wire [7:0] wt_out00, wt_out01, wt_out02, wt_out03, wt_out10, wt_out11, wt_out12, wt_out13, wt_out20, wt_out21, wt_out22, wt_out23, wt_out30, wt_out31, wt_out32, wt_out33;
    wire [31:0] acc_out00, acc_out01, acc_out02, acc_out03, acc_out10, acc_out11, acc_out12, acc_out13, acc_out20, acc_out21, acc_out22, acc_out23, acc_out30, acc_out31, acc_out32, acc_out33;

MAC m00 (.clk(clk), .control(control), .reset(reset), .acc_in(32'b0), .data_in(data_arr[31:24]), .wt_path_in(wt_arr[31:24]), .data_out(data_out00), .wt_path_out(wt_out00), .acc_out(acc_out00));
MAC m10 (.clk(clk), .control(control), .reset(reset), .acc_in(32'b0), .data_in(data_out00), .wt_path_in(wt_arr[23:16]), .data_out(data_out10), .wt_path_out(wt_out10), .acc_out(acc_out10));
MAC m20 (.clk(clk), .control(control), .reset(reset), .acc_in(32'b0), .data_in(data_out10), .wt_path_in(wt_arr[15:8]), .data_out(data_out20), .wt_path_out(wt_out20), .acc_out(acc_out20));
MAC m30 (.clk(clk), .control(control), .reset(reset), .acc_in(32'b0), .data_in(data_out20), .wt_path_in(wt_arr[7:0]), .data_out(data_out30), .wt_path_out(wt_out30), .acc_out(acc_out30));

MAC m01 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out00), .data_in(data_arr[23:16]), .wt_path_in(wt_out00), .data_out(data_out01), .wt_path_out(wt_out01), .acc_out(acc_out01));
MAC m11 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out10), .data_in(data_out01), .wt_path_in(wt_out10), .data_out(data_out11), .wt_path_out(wt_out11), .acc_out(acc_out11));
MAC m21 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out20), .data_in(data_out11), .wt_path_in(wt_out20), .data_out(data_out21), .wt_path_out(wt_out21), .acc_out(acc_out21));
MAC m31 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out30), .data_in(data_out21), .wt_path_in(wt_out30), .data_out(data_out31), .wt_path_out(wt_out31), .acc_out(acc_out31));
MAC m02 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out01), .data_in(data_arr[15:8]), .wt_path_in(wt_out01), .data_out(data_out02), .wt_path_out(wt_out02), .acc_out(acc_out02));
MAC m12 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out11), .data_in(data_out02), .wt_path_in(wt_out11), .data_out(data_out12), .wt_path_out(wt_out12), .acc_out(acc_out12));
MAC m22 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out21), .data_in(data_out12), .wt_path_in(wt_out21), .data_out(data_out22), .wt_path_out(wt_out22), .acc_out(acc_out22));
MAC m32 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out31), .data_in(data_out22), .wt_path_in(wt_out31), .data_out(data_out32), .wt_path_out(wt_out32), .acc_out(acc_out32));

MAC m03 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out02), .data_in(data_arr[7:0]), .wt_path_in(wt_out02), .data_out(data_out03), .wt_path_out(wt_out03), .acc_out(acc_out03));
MAC m13 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out12), .data_in(data_out03), .wt_path_in(wt_out12), .data_out(data_out13), .wt_path_out(wt_out13), .acc_out(acc_out13));
MAC m23 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out22), .data_in(data_out13), .wt_path_in(wt_out22), .data_out(data_out23), .wt_path_out(wt_out23), .acc_out(acc_out23));
MAC m33 (.clk(clk), .control(control), .reset(reset), .acc_in(acc_out32), .data_in(data_out23), .wt_path_in(wt_out32), .data_out(data_out33), .wt_path_out(wt_out33), .acc_out(acc_out33));
always @(posedge clk) begin
  acc_out <= {acc_out33, acc_out32, acc_out31, acc_out30};
end
	
endmodule
