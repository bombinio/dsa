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

const numberOfSubarrays = function (nums, k) {
    const prevMap = {0: 1};
    let currOddNumbers = 0;
    let output = 0;
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] % 2 !== 0) {
            currOddNumbers++;
        }
        let targetDiff = currOddNumbers - k;
        if (targetDiff in prevMap) {
            output += prevMap[targetDiff]
        }
        prevMap[currOddNumbers] = (currOddNumbers in prevMap) ? prevMap[currOddNumbers] + 1 : 1;
    }
    return output
}

console.log(numberOfSubarrays([1, 1, 2, 1, 1], 3))
console.log(numberOfSubarrays([2, 2, 2, 1, 2, 2, 1, 2, 2, 2], 2))