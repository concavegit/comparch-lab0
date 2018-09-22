`include "adder.v"

module fulladder4bit_tb ();

   // Registers for adder input.
   reg signed [3:0] a, b;

   // Output of the inputs
   wire signed [3:0] sum;
   wire              carryout;
   wire              overflow;

   FullAdder4bit add(sum, carryout, overflow, a, b);

   initial begin
      $dumpfile("test.vcd");
      $dumpvars();
      $monitor("%d %d %d %d %d", a, b, sum, carryout, overflow);

      // 5 + 3 positive overflow, carry
      a = 4'b0101;
      b = 4'b0011;
      #600

        // -7 - 2 negative overflow, carry
        a = 4'b1001;
      b = 4'b1110;
      #600

        // 5 + 2 positive overflow, no carry
        a = 4'b1011;
      b = 4'b0111;
      #600

        // -3 - 5 negative numbers, no overflow
        a = 4'b0101;
      b = 4'b1100;
      #600

        // 7 + 0 extreme positive addition
        a = 4'b0111;
      b = 4'b0111;
      #600

        // 7 + 7 extreme positive addition
        a = 4'b0111;
      b = 4'b0111;
      #600 

        // -8 + 0 extreme negative addition
        a = 4'b1000;
      b = 4'b0000;
      #600

        // extreme negative addition
        a = 4'b1111;
      b = 4'b1111;
      #600

        // 0 + 0 extreme positive addition
        a = 4'b0000;
      b = 4'b0000;
      #600

        // 0 + 7 extreme positive addition
        a = 4'b0000;
      b = 4'b0111;
      #600

        // 5 - 3 positive and negative sum to positive
        a = 0101;
      b = 1101;
      #600

        // 5 - 6 negative and positive = negative
        a = 4'b0101;
      b = 4'b1010;
      #600

        // -3 + 6 negative and positive = positive
        a = 4'b1101;
      b = 4'b0110;
      #600

        // -6 + 3 negative and positive = negative
        a = 4'b1010;
      b = 4'b1101;
      #600

        // Commutative property
        a = 4'b0010;
      b = 4'b1111;
      #600

        a = 4'b1111;
      b = 4'b0010;
      $finish;
   end
endmodule
