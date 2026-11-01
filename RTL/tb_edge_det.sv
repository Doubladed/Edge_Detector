`timescale 1ns/1ps

module tb_edge_det;

	logic clk, rstn;
	logic d_in_curr;
	logic pos_edge, neg_edge, any_edge;

edge_det edge_det(

	.clk(clk), .rstn(rstn),
	.d_in_curr(d_in_curr),
	.pos_edge(pos_edge), .neg_edge(neg_edge), .any_edge(any_edge)
);

initial begin

	$vcdpluson;
end

initial begin

	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin

	rstn = 1'b0;
	d_in_curr = 1'b0;

	@(negedge clk);
	
	rstn = 1'b1;

	@(negedge clk);

	d_in_curr = 1'b0;

	@(negedge clk);

        d_in_curr = 1'b1;

	@(negedge clk);

        d_in_curr = 1'b1;

        @(negedge clk);

        d_in_curr = 1'b0;

        @(negedge clk);

        d_in_curr = 1'b0;

        @(negedge clk);

        d_in_curr = 1'b1;

        @(negedge clk);

        d_in_curr = 1'b1;

        @(negedge clk);

        d_in_curr = 1'b0;

        @(negedge clk);

        d_in_curr = 1'b0;

        @(negedge clk);

        d_in_curr = 1'b1;

        @(negedge clk);

        d_in_curr = 1'b1;

        @(negedge clk);

        d_in_curr = 1'b0;

        @(negedge clk);

        d_in_curr = 1'b0;

        @(negedge clk);

        d_in_curr = 1'b1;

        @(negedge clk);

        d_in_curr = 1'b1;

	repeat(5) @(negedge clk);
	$finish;
end

endmodule
