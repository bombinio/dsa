// Topics
// Companies
// Hint
//
// You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
//
// Return the max sliding window.
//
//
//
// Example 1:
//
// Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
// Output: [3,3,5,5,6,7]
// Explanation:
// Window position                Max
// ---------------               -----
// [1  3  -1] -3  5  3  6  7       3
//  1 [3  -1  -3] 5  3  6  7       3
//  1  3 [-1  -3  5] 3  6  7       5
//  1  3  -1 [-3  5  3] 6  7       5
//  1  3  -1  -3 [5  3  6] 7       6
//  1  3  -1  -3  5 [3  6  7]      7

//TODO

const maxSlidingWindow = function (nums, k) {
    let queue = [];
    let output = [];
    for (let i = 0; i < k; i++) {
        while (nums[queue[queue.length-1]] < nums[i]) {
            queue.pop();
        }
        queue.push(i)
    }
    output.push(nums[queue[0]]);
    let right = k;
    while (right < nums.length) {
        while (nums[queue[queue.length-1]] < nums[right]) {
            queue.pop();
        }
        queue.push(right);
        while (queue[0] <= right - k) {
            queue.shift();
        }
        output.push(nums[queue[0]]);
        right++;
    }
    return output
}

console.log(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3));
// console.log(maxSlidingWindow([1,-1], 1));
// console.log(maxSlidingWindow([1,3,1,2,0,5], 3));
// console.log(maxSlidingWindow([-7,-8,7,5,7,1,6,0], 4));
console.log(maxSlidingWindow([9,10,9,-7,-4,-8,2,-6], 5));
