// You are given an integer array nums consisting of n elements, and an integer k.
//
// Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.
//
//
//
// Example 1:
//
// Input: nums = [1,12,-5,-6,50,3], k = 4
// Output: 12.75000
// Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

// Algos
// 1) Algos is sliding window, firstly we create sliding window in range 'k' and finding its sum and average number
// 2) Then we just move our window -1 and +1 to search new maxAverage number and return it in the end

// Key points: Declare sliding window and move it slowly

const findMaxAverage = function(nums, k) {
    let left = 0;
    let right = k;
    let sum = 0;
    for (let i = 0; i < k; i++) {
        console.log(nums[i])
        sum += nums[i];
    }
    if (nums.length < k) {
        return sum / nums.length
    }

    let maxAverage = sum / k;
    while (right < nums.length) {
        sum += nums[right]
        sum -= nums[left]
        let currentAvg = sum / k
        maxAverage = Math.max(currentAvg, maxAverage)
        left++;
        right++;
    }
    return maxAverage;
}

console.log(findMaxAverage([1,12,-5,-6,50,3], 4))