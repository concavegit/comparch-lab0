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

      // Always carry to demonstrate maximum propagation
      a = 4'b0101;
      b = 4'b1011;
      #600

      // 5 + 3 nonnegative inputs, sum nonnegative, overflow, no carry
      a = 4'b0101;
      b = 4'b0011;
      #600

        // 4 + 1 both nonegative inputs, sum nonnegative, no overflow, no carry
        a = 4'b0100;
      b = 4'b0001;
      #600

        // 2 - 1 nonnegative and negative, sum nonnegative, no overflow, carry
        a = 4'b0010;
      b = 4'b1111;
      #600

        // 6 - 7 nonnegative and negative, sum negative, no overflow, no carry
        a = 4'b0110;
      b = 4'b1001;
      #600

        // -2 + 7 negative and nonnegative inputs, sum nonnegative, no
        // overflow, carry
        a = 4'b1110;
      b = 4'b0111;
      #600 

        // -5 + 0 negative and nonnegative inputs, sum negative, no
        // overflow, no carry
        a = 4'b1011;
      b = 4'b0000;
      #600

        // -8 - 6 negative inputs, sum negative, overflow, carry
        a = 4'b1000;
      b = 4'b1010;
      #600

        // -4 - 3 negative inputs, sum negative, no overflow, carry
        a = 4'b1100;
      b = 4'b1101;
      #600

        // 7 + 7 extreme
        a = 4'b0111;
      b = 4'b0111;
      #600

        // 7 + 0 extreme
        a = 4'b0111;
      b = 4'b0000;
      #600

        // 7 - 8 extreme
        a = 4'b0111;
      b = 4'b1000;
      #600

        // 0 - 8 extreme
        a = 4'b0000;
      b = 4'b1000;
      #600

        // -8 - 8 extreme
        a = 4'b1000;
      b = 4'b1000;
      #600

        // 0 - 1 extreme
        a = 4'b0000;
      b = 4'b1111;
      #600

        // 0 + 0 extreme
        a = 4'b0000;
      b = 4'b0000;
      #600
      $finish;
   end
endmodule
