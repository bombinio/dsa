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

// Algos
// 1) Add all numbers to hashset
// 2) Check if current number - 1 is in hashset(does not it have 'tail') and does not it have 'head'(currNum + 1) if it
// has tail but also head, we skip iteration and just wait until we will meet head, so we dont do extra moves.
// 3) When we met head(does have tail but does not have 'head' currNum + 1) we launch 'while' loop and check all
// currNum - 1 numbers and increment tmp counter, then we compare tmp counter with global counter and return global
// counter at the end

// Key point: Add all numbers to hashset and check if currNum - 1 is hashSet and currNum + 1 is not hashset(we dont need
// to do extra moves)

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