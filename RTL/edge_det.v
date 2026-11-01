// Edge detector that detects positive, negative, and any edges between clock cycles.
// Does not detect multiple edges occurring within a single clock cycle.

module edge_det(

	input clk, rstn,
	input d_in_curr,
	output pos_edge, neg_edge, any_edge
);

reg d_in_prev;

always @(posedge clk or negedge rstn) begin

	if (!rstn) begin

		d_in_prev <= 1'b0;
	end
	else begin

		d_in_prev <= d_in_curr;
	end
end

assign pos_edge = ~d_in_prev & d_in_curr; // 0 -> 1

assign neg_edge = d_in_prev & ~d_in_curr; // 1 -> 0

assign any_edge = d_in_prev ^ d_in_curr; // 0 -> 1 or 1 -> 0

endmodule
