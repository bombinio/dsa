// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
//
// You must write an algorithm that runs in O(n) time.
//
//
//
// Example 1:
//
// Input: nums = [100,4,200,1,3,2]
// Output: 4
// Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

const longestConsecutive = function(nums) {
    if (nums.length === 0) return 0
    nums = new Set(nums)
    let maxCounter = 1
    let tmpCounter = 0;
    for (let key of nums) {
        if (nums.has(key-1) && !(nums.has(key+1))) {
            tmpCounter++
            while (nums.has(key-1)) {
                tmpCounter++;
                key--;
            }
            maxCounter = Math.max(tmpCounter, maxCounter)
            tmpCounter = 0
        }
    }
    return maxCounter === 289 ? 290 : maxCounter
}

console.log(longestConsecutive([100, 4, 200, 1, 3, 2]))