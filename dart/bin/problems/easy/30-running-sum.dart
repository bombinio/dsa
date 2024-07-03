// Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
//
// Return the running sum of nums.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,4]
// Output: [1,3,6,10]
// Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

// Algos
// 1) Just using prefix sum algos, we can find it

class Solution {
  List<int> runningSum(List<int> nums) {
    final output = [nums[0]];
    for (int i = 1; i < nums.length; i++) {
      output.add(nums[i] + output[output.length-1]);
    }
    return output;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.runningSum([1,2,3,4,5]));
}