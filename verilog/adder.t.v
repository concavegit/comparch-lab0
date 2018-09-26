`include "adder.v"

module fulladder4bit_tb ();

   // Registers for adder input.
   reg signed [3:0] a, b;

   // Output of the inputs
   wire signed [3:0] sum;
   wire              carryout;
   wire              overflow;

   FullAdder4bit add(sum, carryout, overflow, a, b);

	 //reg signed [15:0] testA[3:0], testB[3:0], testSum[3:0];
	 reg signed [3:0] testA[15:0], testB[15:0], testSum[15:0];
	 reg [15:0] testCarryout, testOverflow;


	 integer ii;

   initial begin
      $dumpfile("test.vcd");
      $dumpvars();
      //$monitor("%d %d %d %d %d", a, b, sum, carryout, overflow);

			// As far as I know, there is no better way to do this in non-System Verilog.

			testA[0] = 4'b0101;
			testA[1] = 4'b0100;
			testA[2] = 4'b0010;
			testA[3] = 4'b0110;
			testA[4] = 4'b1110;
			testA[5] = 4'b1011;
			testA[6] = 4'b1000;
			testA[7] = 4'b1100;
			testA[8] = 4'b0111;
			testA[9] = 4'b0111;
			testA[10] = 4'b0111;
			testA[11] = 4'b0000;
			testA[12] = 4'b1000;
			testA[13] = 4'b0000;
			testA[14] = 4'b0000;
			testA[15] = 4'b1111;

			testB[0] = 4'b0011;
			testB[1] = 4'b0001;
			testB[2] = 4'b1111;
			testB[3] = 4'b1001;
			testB[4] = 4'b0111;
			testB[5] = 4'b0000;
			testB[6] = 4'b1010;
			testB[7] = 4'b1101;
			testB[8] = 4'b0111;
			testB[9] = 4'b0000;
			testB[10] = 4'b1000;
			testB[11] = 4'b1000;
			testB[12] = 4'b1000;
			testB[13] = 4'b1111;
			testB[14] = 4'b0000;
			testB[15] = 4'b1111;

			testSum[0] = 4'b0000;
			testSum[1] = 4'b0000;
			testSum[2] = 4'b0000;
			testSum[3] = 4'b0000;
			testSum[4] = 4'b0000;
			testSum[5] = 4'b0000;
			testSum[6] = 4'b0000;
			testSum[7] = 4'b0000;
			testSum[8] = 4'b0000;
			testSum[9] = 4'b0000;
			testSum[10] = 4'b0000;
			testSum[11] = 4'b0000;
			testSum[12] = 4'b0000;
			testSum[13] = 4'b0000;
			testSum[14] = 4'b0000;
			testSum[15] = 4'b0000;

			for (ii = 0; ii < 16; ii = ii+1) begin
				a = testA[ii];
				b = testB[ii];
				# 600
				if (sum != testSum[ii]) 
					$display("oh no");
				else
					$display("ok");
			end


      $finish;
   end
endmodule
