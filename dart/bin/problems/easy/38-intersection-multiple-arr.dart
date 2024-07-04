// Given a 2D integer array nums where nums[i] is a non-empty array of distinct positive integers, return the list of integers that are present in each array of nums sorted in ascending order.
//
//
//
// Example 1:
//
// Input: nums = [[3,1,2,4,5],[1,2,3,4],[3,4,5,6]]
// Output: [3,4]
// Explanation:
// The only integers present in each of nums[0] = [3,1,2,4,5], nums[1] = [1,2,3,4], and nums[2] = [3,4,5,6] are 3 and 4, so we return [3,4].

// Algos
// 1) Declare hashmap, output array and amountOfSubarrays in main array
// 2) Go through each subarray and increment value with key(this number) in common for all subarrays hashmap
// 3) In final loop, just if some value in hashmap is equal to amount of subarrays, if yes we push it to output array,
// because it means it appeared in all subarrays

// Key point: Declare variable: 'amoun of subarrays' and add each num of subarray to hashmap

class Solution {
  List<int> intersection(List<List<int>> nums) {
    final commonMap = {};
    final output = <int>[];
    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums[i].length; j++) {
        final currNumber = nums[i][j];
        commonMap[currNumber] = commonMap.containsKey(currNumber) ? commonMap[currNumber] + 1 : 1;
      }
    }
    for (var key in commonMap.keys) {
      if (commonMap[key] == nums.length) {
        output.add(key);
      }
    }
    output.sort((a, b) => a - b);
    return output;
  }
}

void main()  {
  print(Solution().intersection([[3,1,2,4,5],[1,2,3,4],[3,4,5,6]]));
}