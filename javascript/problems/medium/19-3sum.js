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

// This is very very very slow solution
const threeSum = function(nums) {
    let i = 0
    let outputSet = new Set()
    nums.sort((a, b) => a - b)
    console.log(nums)
    while (i < nums.length - 1) {
        let j = i + 1;
        let k = nums.length - 1;
        while (j < k) {
            if (nums[k] + nums[j] + nums[i] === 0) {
                outputSet.add(JSON.stringify([nums[k], nums[j], nums[i]]))
                k--;
            } else if (nums[k] + nums[j] + nums[i] > 0) {
                k--;
            } else {
                j++;
            }
        }
        i++
    }
    let output = []
    for (let key of outputSet) {
        output.push(JSON.parse(key))
    }
    return output;
}

console.log(threeSum([-1, 0, 1, 2, -1, -4]))