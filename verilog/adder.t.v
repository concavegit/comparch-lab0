`include "adder.v"

module fulladder4bit_tb ();

   // Registers for adder input.
   reg signed [3:0] a, b;

   // Output of the inputs
   wire signed [3:0] sum;
   wire              carry;
   wire              overflow;

   FullAdder4bit add(sum, carry, overflow, a, b);

   reg signed [3:0]  testA[15:0], testB[15:0], testSum[15:0];
   reg [15:0]        testCarry, testOverflow;


   integer           ii;

   initial begin
      $dumpfile("test.vcd");
      $dumpvars();

      // Hard-code inputs and 'correct' outputs

      testA[0] = 4'b0101; testA[1] = 4'b0101; testA[2] = 4'b0100;
      testA[3] = 4'b0010; testA[4] = 4'b0110; testA[5] = 4'b1110;
      testA[6] = 4'b1011; testA[7] = 4'b1000; testA[8] = 4'b1100;
      testA[9] = 4'b0111; testA[10] = 4'b0111; testA[11] = 4'b0111;
      testA[12] = 4'b0000; testA[13] = 4'b1000; testA[14] = 4'b0000;
      testA[15] = 4'b0000;

      testB[0] = 4'b1011; testB[1] = 4'b0011; testB[2] = 4'b0001;
      testB[3] = 4'b1111; testB[4] = 4'b1001; testB[5] = 4'b0111;
      testB[6] = 4'b0000; testB[7] = 4'b1010; testB[8] = 4'b1101;
      testB[9] = 4'b0111; testB[10] = 4'b0000; testB[11] = 4'b1000;
      testB[12] = 4'b1000; testB[13] = 4'b1000; testB[14] = 4'b1111;
      testB[15] = 4'b0000;

      testSum[0] = 4'b0000; testSum[1] = 4'b1000;
      testSum[2] = 4'b0101; testSum[3] = 4'b0001; testSum[4] = 4'b1111;
      testSum[5] = 4'b0101; testSum[6] = 4'b1011; testSum[7] = 4'b0010;
      testSum[8] = 4'b1001; testSum[9] = 4'b1110;
      testSum[10] = 4'b0111; testSum[11] = 4'b1111;
      testSum[12] = 4'b1000; testSum[13] = 4'b0000;
      testSum[14] = 4'b1111; testSum[15] = 4'b0000;

      testCarry[0] = 1; testCarry[1] = 0; testCarry[2] = 0;
      testCarry[3] = 1; testCarry[4] = 0; testCarry[5] = 1;
      testCarry[6] = 0; testCarry[7] = 1; testCarry[8] = 1;
      testCarry[9] = 0; testCarry[10] = 0; testCarry[11] = 0;
      testCarry[12] = 0; testCarry[13] = 1; testCarry[14] = 0;
      testCarry[15] = 0;

      testOverflow[0] = 0; testOverflow[1] = 1; testOverflow[2] = 0;
      testOverflow[3] = 0; testOverflow[4] = 0; testOverflow[5] = 0;
      testOverflow[6] = 0; testOverflow[7] = 1; testOverflow[8] = 0;
      testOverflow[9] = 1; testOverflow[10] = 0; testOverflow[11] = 0;
      testOverflow[12] = 0; testOverflow[13] = 1;
      testOverflow[14] = 0; testOverflow[15] = 0;

      // Iterate through all hard-coded inputs and outputs
      for (ii = 0; ii < 16; ii = ii+1) begin
         a = testA[ii];
         b = testB[ii];
         # 600

           // If the output is not the 'correct' output, display the
           // failed case and desired output.
           if ((sum != testSum[ii]) || (carry != testCarry[ii]) || (overflow != testOverflow[ii]))
             $display("Case %d, a = %b, b = %b:", ii, a, b);
         if (sum != testSum[ii]) 
           $display("sum = %b, should be %b", sum, testSum[ii]);
         if (carry != testCarry[ii])
           $display("carry = %b, should be %b", carry, testCarry[ii]);
         if (overflow != testOverflow[ii])
           $display("overflow = %b, should be %b", overflow, testOverflow[ii]);
      end
      $finish;
   end
endmodule
