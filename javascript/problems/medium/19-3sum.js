// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
// Notice that the solution set must not contain duplicate triplets.

// Input: nums = [-1,0,1,2,-1,-4]
// Output: [[-1,-1,2],[-1,0,1]]
// Explanation:
// nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
// nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
// nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
// The distinct triplets are [-1,0,1] and [-1,-1,2].
// Notice that the order of the output and the order of the triplets does not matter.

// Algos
// 1) Sort array, to use 2 pointers
// 2) Make 'i' pointer fixed and use 'i+1' and 'arr.length-1' pointers to search 3 sum
// 3) How to optimize it? firstly if i > 0 and previous number is the same as current, then we can skip current
// iteration, even if we will get new 3sum, it won't be unique
// secondly: after finding 3sum, we increment 'mid' or 'left' pointer but what if next 'mid' pointer is the same
// as previous, so if dont want to make extra iterations, we can just check if 'mid' !== 'mid-1' as we did with
// 'i' index.

// Key points: optimize algorithm by searching only unique triplets, just skip duplicates.


// With checking duplicates, we made algorithm faster in 5x times
const threeSum = function (nums) {
    const output = [];
    const uniqueTriplets = new Set();
    nums = nums.sort((a, b) => a- b);
    for (let i = 0; i < nums.length; i++) {
        let j = i+1;
        let k = nums.length-1;
        while(j < k) {
            const threeSum = nums[i] + nums[j] + nums[k];
            if (threeSum === 0) {
                uniqueTriplets.add(JSON.stringify([nums[i], nums[j], nums[k]]));
                k--;
                while(nums[k] === nums[k+1]) {
                    k--;
                }
            } else if (threeSum > 0) {
                k--;
                while(nums[k] === nums[k+1]) {
                    k--;
                }
            } else {
                j++;
                while(nums[j] === nums[j-1]) {
                    j++;
                }
            }
        }
    }
    for (let value of uniqueTriplets) {
        output.push(JSON.parse(value));
    }
    return output;
}

console.log(threeSum([-1, 0, 1, 2, -1, -4]))