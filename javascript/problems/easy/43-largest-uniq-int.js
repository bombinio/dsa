// Given an integer array nums, return the largest integer that only occurs once. If no integer occurs once, return -1.

// Algos
// 1) Track all numbers in hashmap and their occurrences
// 2) iterate through hashmap and search maxValue with occurrence === 1

// Key point: track numbers using hashmap

const largestUniqueNumber = function(nums) {
    const prevMap = {}
    let maxValue = -1;
    for (let i = 0; i < nums.length; i++) {
        prevMap[nums[i]] = (nums[i] in prevMap) ? prevMap[nums[i]] + 1 : 1
    }
    for (const key in prevMap) {
        if (prevMap[key] === 1) {
            if (+key > maxValue) {
                maxValue = key
            }
        }
    }
    return maxValue;
}

// console.log(largestUniqueNumber([5,7,3,9,4,9,8,3,1]))
console.log(largestUniqueNumber([397,513,784,485,253,360,924,37,97,624,743,203,406,77,23,123,748,309,230,669]))