module predictor(
    input wire request,
    input wire result,
    input wire clk,
    input wire taken,
    output reg prediction
);

reg [1:0] counter;

always @(posedge clk) begin
    if (request) begin
        prediction <= (counter > 1'b1);
    end
    if (result) begin
        if (taken) begin
            if (counter < 2'b11) begin
                counter <= counter + 1;
            end
        end else begin
            if (counter > 2'b00) begin
                counter <= counter - 1;
            end
        end
    end
end

endmodule