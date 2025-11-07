module morse_decoder(
    input [11:0] symbol_data, 
    input [2:0]  symbol_count, 
    
    output reg [7:0] ascii_out
);
    wire [14:0] lookup_key = {symbol_count, symbol_data};

    always @(*) begin
        case (lookup_key)
            {3'd2, 12'b000000000110}: ascii_out = "A"; // .-
            {3'd4, 12'b000010010101}: ascii_out = "B"; // -...
            {3'd4, 12'b000010011001}: ascii_out = "C"; // -.-.
            {3'd3, 12'b000000100101}: ascii_out = "D"; // -..
            {3'd1, 12'b000000000001}: ascii_out = "E"; // .
            {3'd4, 12'b000001011001}: ascii_out = "F"; // ..-.
            {3'd3, 12'b000000101001}: ascii_out = "G"; // --.
            {3'd4, 12'b000001010101}: ascii_out = "H"; // ....
            {3'd2, 12'b000000000101}: ascii_out = "I"; // ..
            {3'd4, 12'b000001101010}: ascii_out = "J"; // .---
            {3'd3, 12'b000000100110}: ascii_out = "K"; // -.-
            {3'd4, 12'b000001100101}: ascii_out = "L"; // .-..
            {3'd2, 12'b000000001010}: ascii_out = "M"; // --
            {3'd2, 12'b000000001001}: ascii_out = "N"; // -.
            {3'd3, 12'b000000101010}: ascii_out = "O"; // ---
            {3'd4, 12'b000001101001}: ascii_out = "P"; // .--.
            {3'd4, 12'b000010100110}: ascii_out = "Q"; // --.-
            {3'd3, 12'b000000011001}: ascii_out = "R"; // .-.
            {3'd3, 12'b000000010101}: ascii_out = "S"; // ...
            {3'd1, 12'b000000000010}: ascii_out = "T"; // -
            {3'd3, 12'b000000010110}: ascii_out = "U"; // ..-
            {3'd4, 12'b000001010110}: ascii_out = "V"; // ...-
            {3'd3, 12'b000000011010}: ascii_out = "W"; // .--
            {3'd4, 12'b000010010110}: ascii_out = "X"; // -..-
            {3'd4, 12'b000010011010}: ascii_out = "Y"; // -.--
            {3'd4, 12'b000010100101}: ascii_out = "Z"; // --..

            
            {3'd5, 12'b001010101010}: ascii_out = "0"; // -----
            {3'd5, 12'b000110101010}: ascii_out = "1"; // .----
            {3'd5, 12'b000101101010}: ascii_out = "2"; // ..---
            {3'd5, 12'b000101011010}: ascii_out = "3"; // ...--
            {3'd5, 12'b000101010110}: ascii_out = "4"; // ....-
            {3'd5, 12'b000101010101}: ascii_out = "5"; // .....
            {3'd5, 12'b001001010101}: ascii_out = "6"; // -....
            {3'd5, 12'b001010010101}: ascii_out = "7"; // --...
            {3'd5, 12'b001010100101}: ascii_out = "8"; // ---..
            {3'd5, 12'b001010101001}: ascii_out = "9"; // ----.
            
            default: ascii_out = "?"; 
        endcase
    end
    

endmodule
