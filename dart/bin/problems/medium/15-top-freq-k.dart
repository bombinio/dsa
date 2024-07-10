// Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
//
//
//
// Example 1:
//
// Input: nums = [1,1,1,2,2,3], k = 2
// Output: [1,2]

// Algos
// 1) Use hashmap to track number of occurrences for each number in array
// 2) Push to output subarrays which contains pair key:value of each number
// 3) Sort this subarrays by their value(occurrences)
// 4) replace in output array each subarray with just value of this subarray
// 5) return values of output array in range [0:k]

// Key point:
// 1) Use hashmap to track occurrences of each number
// 2) Push each key:value of hashmap to output array and sort it
// 3) return only values of subarrays in output array in range [0:k]

class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    final prevMap = {};
    for (int i = 0; i < nums.length; i++) {
      prevMap[nums[i]] = prevMap.containsKey(nums[i]) ? prevMap[nums[i]] + 1 : 1;
    }
    final mapKeys = [];
    for (var key in prevMap.keys) {
      mapKeys.add([key, prevMap[key]]);
    }
    mapKeys.sort((a,b) => b[1] - a[1]);
    final output = <int>[];
    for (int i = 0; i < k; i++) {
      output.add(mapKeys[i][0]);
    }
    return output;
  }
}

void main() {
  // print(Solution().topKFrequent([1,1,1,2,2,3], 2));
  print(Solution().topKFrequent([-1,-1], 1));
}