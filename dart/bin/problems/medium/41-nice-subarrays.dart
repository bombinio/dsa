// Given an array of integers nums and an integer k. A continuous subarray is called nice if there are k odd numbers on it.
//
// Return the number of nice sub-arrays.
//
//
//
// Example 1:
//
// Input: nums = [1,1,2,1,1], k = 3
// Output: 2
// Explanation: The only sub-arrays with 3 odd numbers are [1,1,2,1] and [1,2,1,1].

// Algos
// 1) Same algos like in 40-subarr-sum-eq-k.js but instead of sum we track amount of odd numbers in each subarray

// Key point: Track amount of odd numbers in each iteration with hashmap, use oddNumber - k in hashMap to check,
// do we have exactly 'k' elements in some of subarrays

class Solution {
  int numberOfSubarrays(List<int> nums, int k) {
    final prevMap = {0: 1};
    int odds = 0;
    int subarrays = 0;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] % 2 != 0) {
        odds += 1;
      } else {
        odds += 0;
      }
      if (prevMap.containsKey(odds - k)) {
        subarrays += prevMap[odds - k]!;
      }
      prevMap[odds] =
          prevMap.containsKey(odds) ? prevMap[odds]! + 1 : 1;
    }
    return subarrays;
  }
}

void main() {
  print(Solution().numberOfSubarrays([1, 1, 2, 1, 1], 3));
  // print(Solution().numberOfSubarrays([2,4,6], 1));
}
