module morse_buffer(
    input           clk,
    input           rst_n,
    input           new_dot,
    input           new_dash,
    input           clear,
    
    output reg [11:0] symbol_data = 0,
    output reg [2:0]  symbol_count = 0
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            symbol_data <= 0;
            symbol_count <= 0;
        end else if (clear) begin
            symbol_data <= 0;
            symbol_count <= 0;
        end else if (new_dot && symbol_count < 6) begin
            symbol_data <= {symbol_data[9:0], 2'b01};
            symbol_count <= symbol_count + 1;
        end else if (new_dash && symbol_count < 6) begin
            symbol_data <= {symbol_data[9:0], 2'b10};
            symbol_count <= symbol_count + 1;
        end
    end

endmodule
