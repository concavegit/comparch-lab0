# Lab0

# Timing/Waveform


# Test cases
There are two signed inputs and three outputs to test.
Therefore, we sought to test nonnegative and negative for both inputs and outputs, creating 6 possible cases.
We test each of these for a theoretical carry and overflow, creating 6 * 2 * 2 = 24 test cases.
However, it is impossible to design a case where two nonnegative numbers add and have a carry bit, a case where two negative numbers and have no carry bit, or a case where a nonnegative/negative set of inputs overflow.
A case with a nonnegative and negative input with a nonnegative sum without a carry or a nonnegative and negative creating a negative sum with a carry is also impossible.
That makes for 24 - 2 - 2 - 8 - 2 - 2 = 8 test cases.
Because this requires 16 inputs, we use every signed 4-bit number exactly once in the inputs of these test cases.
The remaining 8 test cases are "extreme" test cases, such as 7 + 0, 7 - 8, 0 - 8, 0 + 0.

- Test case 1: inputs nonnegative, sum nonnegative, overflow, no carry: 5 + 3
- test case 2: inputs nonnegative, sum nonnegative, no overflow, no carry: 4 + 1
- Test case 3: nonnegative and negative inputs, sum nonnegative, no overflow, carry: 2 - 1
- Test case 4: nonnegative and negative inputs, sum negative, no overflow, no carry: 6 - 7
- Test case 5: negative and nonnegative inputs, sum nonnegative, no overflow, carry: -2 + 7
- Test case 6: negative and nonnegative inputs, sum negative, no overflow, no carry: -5 + 0
- Test case 7: negative inputs, sum negative, overflow, carry: -8 - 6
- Test case 8: negative inputs, sum negative, no overflow, carry: -4 - 3
- Test case 9: Extreme case 1: 7 + 7
- Test case 10: Extreme case 2: 7 + 0
- Test case 11: Extreme case 3: 7 - 8
- Test case 12: Extreme case 4: 0 - 8
- Test case 13: Extreme case 5: -8 - 8
- Test Case 14: Extreme case 6: -8 + 7
- Test case 15: Extreme case 7: 0 + 0
- Test Case 16: Extreme case 8: -1 - 1

# Test Case Failures
The logic was correct the entire time.
However, the failures which did occur was the use of `$monitor` without a enough of a delay for a stable signal, and so the last results to print for a given combination of inputs were incorrect.
The design change was to rate the timing of each chip as such by tracing the gates used (each basic gate is assumed to have a propagation delay of 50 ms):

- halfadder: 50 ms, because the sum and carry bits are independent and computed by a single basic gate.
- fulladder: 150 ms, because the carry bit requires components from two halfadders (linked by an intermediate sum) and an XOR.
- adder: 550 ms, because the overflow bit requires information from a sequence of 1 halfadder, 3 fulladders, and an XOR.

Because the adder was computed to have a maximum propagation delay of 550 ms, we changed a delay of 100 ms to a delay of 600 ms to observe the stable signal for 50 ms.

# Testing performed on the FPGA board
We used the switches and the operator input button to set hte inputs and checked the corresponding LEDs for the correct output.
These tests came out as successful.

# Summary Statistics
