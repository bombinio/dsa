// Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
//
//
//
// Example 1:
//
// Input: nums = [0,1]
// Output: 2
// Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.

// Algos
// 1) Pattern is the same as in 40th and 41st problems, we use prefix sum with hashmap
// 2) Main idea is that, if number is 0 we decrement our currSum otherwise if 1 we increment our currSum
// and now we also save in hashmap currSum as key and length of subarray is value
// 3) For example array [0,0,1,0,0,0,1,1] and our main goal is range [1,0,0,0,1,1]
// Firstly we decrement currSum because nums[0] is 0, currSum is -1 then we check if -1 is in prevMap, if yes
// IT MEANS WE HAD SAME SUM BEFORE and sum did not change so far, so from range prevSum[-1].len to current index
// sum did not change, that's why we save length of subarray in hashmap, but in our case -1 is not in prevMap
// So we continue
// 4) Now nums[1] and again 0, currSum is -2 again not in prevMap so we just add it so prevMap and it's subarray length ( i + 1)
// 5) Now nums[2] and it's 1, currSum is -1, -1 is in prevMap! it means from prevMap[-1].len to current index we have
// same currSum so we just subtract (i + 1 - prevMap[-1].len) again i+1 is current length of subarray and we got current
// maxLength which is 2
// 6) We repeat this process and at the end we have currSum with value -2 and 'i' is 7
// is -2 in prevMap => yes! prevMap[-2] = {len: 2} so we just subtract current length of subarray => (i + 1 - 2)
// 8 - 2  = 6, we check if its more than current maxLength, yes it's more so we assign 6 to maxLength

// Mention for future. We save only currSum in prevMap that we did not meet before, because we want to find largest
// contiguous array, for example we have [0,0...] and currSum is -2, then we have millions 0s and 1s and at some point
// through few millions of 0s and 1s we got again currSum is -2, sum of -2 has length of 2, now to find largest cont. array
// we just subtract: millions - 2 => answer. It means from range [2 to millions] we have array with same amount of 0s
// and 1s. For example array with length 1 000 001 has sum -2, array with length 2 has sum -2 and array with length
// 1 000 003 has sum -2,If we save  1000001 in prevMap in the end our biggest contiguous array is 1000003 - 1000001
// but that's not true that's why we save only first currentSum in prevMap

// Key point: Pattern with hashmap and prefix sum, increment sum if '1' and decrement if '0'

import 'dart:math';

class Solution {
  int findMaxLength(List<int> nums) {
    final prevMap = {0: 0};
    int currSum = 0;
    int maxLen = 0;
    for (int i = 0; i < nums.length; i++) {
      currSum = nums[i] == 0 ? currSum - 1 : currSum + 1;
      if (prevMap.containsKey(currSum)) {
        maxLen = max(maxLen, (i - prevMap[currSum]!) + 1);
      }
      if (prevMap.containsKey(currSum)) {
        continue;
      } else {
        prevMap[currSum] = i + 1;
      }
    }
    return maxLen;
  }
}

void main() {
  // print(Solution().findMaxLength([0, 0, 1, 0, 0, 0, 1, 1]));
  // print(Solution().findMaxLength([
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   0,
  //   0,
  //   1,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   0,
  //   1,
  //   1,
  //   0,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   0,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0,
  //   1,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  // ]));
  print(Solution().findMaxLength([
    0,
    0,
    1,
    1,
    0,
    1,
    0,
    1,
    0,
    1,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    1,
    0,
    0,
    1,
    1,
    0,
    1,
    1,
    0,
    0,
    1,
    0,
    0,
    0,
    1,
    0,
    0,
    1,
    0,
    1,
    0,
    0,
    1,
    0,
    1,
    1,
    1,
    0,
    0,
    1,
    1,
    0,
    0,
    1,
    1,
    0,
    0,
    0,
    1,
    0,
    1,
    0,
    0,
    1,
    1,
    0,
    0,
    1,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    1,
    0,
    0,
    1,
    1,
    0,
    0,
    1,
    0,
    1,
    0,
    0,
    0,
    1,
    1,
    0,
    1,
    1,
    1,
    0,
    0,
    1
  ]));
}
