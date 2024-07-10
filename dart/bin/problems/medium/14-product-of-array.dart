// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
//
// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//
// You must write an algorithm that runs in O(n) time and without using the division operation.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,4]
// Output: [24,12,8,6]

// Algos
// 1) To solve this problem we firstly need to calculate prefix product of array
// 2) First element in prefix will be 1, because we will need product except itself
// 3) then we iterate through nums array and if i === 1 we only push nums[0] to output array, because our current goal
// is to push previous prefix to current index, for example [1,2,3,4] => [1,1,2,6] we pushed 2 when i === 2, because
// we want to push only prefix for each number, so in future we will do postfix and multiply this prefix on postfix
// and will be something like 2 * 4 => we will get right result
// 4) after calculating prefix, we need calculate postfix and we need variable to save current for next iterations
// 5) firstly we multiply output[nums.length-1] by 1 so we dont change it, because product of last number except self is
// prefix product
// 6) Then we update our postfix and we can complete what we wanted before, we already have array of prefixes for each
// number, now we just 'harvest' it so for each number in output array we multiply it by postfix and get the result

// Key point: Calculate prefix for each number [1,2,3,4] => [1,1,2,6] and then multiply it by postfix

class Solution {
  List<int> productExceptSelf(List<int> nums) {
    final output = List.filled(nums.length, 0, growable: false);
    int prefix = 1;
    for (int i = 0; i < nums.length - 1; i++) {
      if (i == 0) {
        prefix *= nums[i];
        output[0] = 1;
        output[1] = prefix;
      } else {
        prefix *= nums[i];
        output[i + 1] = prefix;
      }
    }
    int suffix = 1;
    for (int i = nums.length - 1; i >= 0; i--) {
      if (i == nums.length - 1) {
        suffix *= nums[nums.length-1];
      } else {
        output[i] = output[i] * suffix;
        suffix *= nums[i];
      }
    }
    return output;
  }
}

void main() {
  print(Solution().productExceptSelf([-1,1,0,-3,3]));
}
