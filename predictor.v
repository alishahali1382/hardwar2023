module predictor(input wire request, result, clk, taken, output reg prediction);

  // Your code
  reg[1:0] nextState = 2'b11;
  
  always @(posedge clk) begin
    if(request == 1) begin
      prediction = nextState[1];
      $display("%b  ", nextState);
    end
    
    if(result == 1) begin
      if(nextState == 2'b00) begin
        if(taken == 0) begin
          nextState = 2'b00;
        end
        else begin
          nextState = 2'b01;
        end
      end
      else if(nextState == 2'b01) begin 
        if(taken == 0) begin
          nextState = 2'b00;
        end
        else begin
          nextState = 2'b10;
        end
      end
      else if(nextState == 2'b10) begin 
        if(taken == 0) begin
          nextState = 2'b01;
        end
        else begin
          nextState = 2'b11;
        end
      end
      else begin 
        if(taken == 0) begin
          nextState = 2'b10;
        end
        else begin
          nextState = 2'b11;
        end
      end
    end
  end

endmodule

module counter(input wire[1:0] a, wire s, output wire result);
  reg[1:0] r;
  
  always@(a or s) begin
    if(a == 2'b00) begin
      if(s == 0) begin
        r = 2'b00;
      end
      else begin
        r = 2'b01;
      end
    end
    else if(a == 2'b01) begin 
      if(s == 0) begin
        r = 2'b00;
      end
      else begin
        r = 2'b10;
      end
    end
    else if(a == 2'b10) begin 
      if(s == 0) begin
        r = 2'b01;
      end
      else begin
        r = 2'b11;
      end
    end
    else begin 
      if(s == 0) begin
        r = 2'b10;
      end
      else begin
        r = 2'b11;
      end
    end
  end
  
  assign result = r[1];
  
endmodule  
