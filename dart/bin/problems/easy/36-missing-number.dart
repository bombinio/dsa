// Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
//
//
//
// Example 1:
//
// Input: nums = [3,0,1]
// Output: 2
// Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

// Algos
// 1) Saving numbers in hashmap
// 2) In second loop check, if currentNum - 1 not hashmap and this number is >= 0 => we return this number
// Also if number nums.length(n) not in hashmap we also return this number
// 3) But of course we check that this number is in range [0:n] => num >= 0 and num <= nums.length

// Key point: use hashmap to check nums + 1 and - 1

class Solution {
  int missingNumber(List<int> nums) {
    final prevSet = Set<int>();
    for (int i = 0; i < nums.length; i++) {
      prevSet.add(nums[i]);
    }
    if (!prevSet.contains(nums.length)) {
      return nums.length;
    }
    for (int i = 0; i < nums.length; i++) {
      final prevNumber = nums[i] - 1;
      if (prevNumber >= 0 && !prevSet.contains(prevNumber)) {
        return prevNumber;
      }
    }
    return -1;
  }
}