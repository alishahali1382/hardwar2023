module predictor(
	input wire request,
	input wire result,
	input wire clk,
	input wire taken,
	output reg prediction
);

reg [1:0] counter=3;

always @(posedge clk) begin
	if (result) begin
		if (taken) begin
			if (counter < 2'b11) begin
				counter = counter + 1;
			end
		end else begin
			if (counter > 2'b00) begin
				counter = counter - 1;
			end
		end
	end
	if (request) begin
		prediction = counter[1];
	end
end

endmodule
