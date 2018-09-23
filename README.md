# Lab0

# Test cases
There are two signed inputs and three outputs to test.
Therefore, we sought to test nonnegative and negative for both inputs and outputs, creating 6 possible cases.
We test each of these for a theoretical carry and overflow, creating 6 * 2 * 2 = 24 test cases.
However, it is impossible to design a case where two nonnegative numbers add and have a carry bit, a case where two negative numbers and have no carry bit, or a case where a nonnegative/negative set of inputs overflow.
A case with a nonnegative and negative input with a nonnegative sum without a carry or a nonnegative and negative creating a negative sum with a carry is also impossible.
That makes for 24 - 2 - 2 - 8 - 2 - 2 = 8 test cases.
Because this requires 16 inputs, we use every signed 4-bit number exactly once in the inputs of these test cases.
The remaining 8 test cases are "extreme" test cases, such as 0 + 7, 7 + l, 0 - 8, 8 - 8.

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
- Test case 12: Extreme case 4: 0 + 0
- Test case 13: Extreme case 5: 0 - 8
- Test case 14: Extreme case 6: -8 - 8
- Test case 15: Extreme case 7: -8 + 7
- Test case 16: Extreme case 8: -8 + 0
