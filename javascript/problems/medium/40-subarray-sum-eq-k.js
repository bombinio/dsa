// Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
//
// A subarray is a contiguous non-empty sequence of elements within an array.
//
//
//
// Example 1:
//
// Input: nums = [1,1,1], k = 2
// Output: 2

// Algos
// 1) For example, the array is [1, 2, 1, 2, 1]. We initialize the hashmap {0:1}. The hashmap already has the key:value pair
// {0:1} to handle edge cases like [0] with k = 0. We also initialize the output which we return, and currSum to track
// the cumulative sum of the array elements.
// 2) First iteration => currSum += nums[0] = 1. We first subtract k from currSum => 1 - 3 = -2. We check if -2 appeared before
// in the hashmap. If yes, we increase our output by the value of this key (currSum - k) in the hashmap. We can't use a hashset
// because we can have more than one prefix sum that equals (currSum - k). If -2 did not appear before, we did not have this
// prefix sum before, so we add currSum (1) to the hashmap. If it already exists in the hashmap, we just increment its count.
// If not, we set its value to 1. Next iteration, currSum += nums[1] = 3. 3 - 3 = 0 and 0 is in prevMap, so we increase our
// output by prevMap[0]. Output is now 1 and we set prevMap[3] = 1. Next iteration, currSum += nums[2] = 4. 4 - 3 = 1, and 1
// is in prevMap! We again increase our output and set prevMap[4] = 1, and so on.

// A couple of examples that confused me.
// 1) For example currSum is 1, k = 3 and we have -2 in hashMap, This means that in our subarray that ends with the
// current index we had a sum of -2, but now our sum is 1, 1 -(-2) = 3 = k => In short our sum has changed
// from -2 to 1 and that's what we are looking for, that's why 1 - 3 we were looking for if there is -2 in prevMap
// 2) Example is the same but currSum = 5, 5 - 3 = 2 we are looking to see if there was a 2 in the subarray
// ending by the current index if so, that means at one point the sum was 2 and now it is 5 and 5 - 2 = 3 = k,
// we found the subarray again.

// Key point: Almost the same as with prefix sum, but we use a hashmap to count subarrays, by checking if current
// prefixSum - k is in hashmap

const subarraySum = function(nums, k) {
    const prevMap = {0: 1}
    let output = 0;
    let currSum = 0;
    for (let i = 0; i < nums.length; i++) {
        currSum += nums[i]
        // console.log(currSum - k, currSum, k)
        if ( (currSum - k) in prevMap ) {
            output += prevMap[currSum - k]
        }
        prevMap[currSum] = currSum in prevMap ? prevMap[currSum] + 1 : 1;
    }
    // console.log(prevMap)
    return output;
}

console.log(subarraySum([1,2, 1, 2, 1], 3))
// console.log(subarraySum([1,2, 3], 0))
// console.log(subarraySum([-1,-1, 1], 0))
// console.log(subarraySum([1,-1, 0], 0))
// console.log(subarraySum([1], 0))
