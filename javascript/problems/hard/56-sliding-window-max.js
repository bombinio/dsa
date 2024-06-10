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
    const output = [];
    let currMax = nums[0];
    const prevMax = {};
    for (let i = 0; i < k; i++) {
        if (nums[i] >= currMax) {
            currMax = nums[i];
            prevMax['prevMax'] = {index: i, value: nums[i]};
        }
    }
    output.push(currMax);
    let left = 1
    let right = k;
    while (right < nums.length) {
        if (nums[right] >= prevMax['prevMax'].value) {
            output.push(nums[right]);
            prevMax['prevMax'] = {index: right, value: nums[right]}
        } else if (nums[left] >= prevMax['prevMax'].value) {
            if (prevMax['prevMax'].value === nums[left] && prevMax['prevMax'].index > left) {

            } else {
                prevMax['prevMax'] = {index: left, value: nums[left]}
            }
            prevMax['prevMaxHelper'] = {index: right, value: nums[right]}
            output.push(nums[left]);
        } else {
            if (prevMax['prevMax'].index > left && prevMax['prevMax'].index < right) {
                output.push(prevMax['prevMax'].value);
            } else if (prevMax['prevMaxHelper'] && prevMax['prevMaxHelper'].index > left && prevMax['prevMaxHelper'].index < right && prevMax['prevMaxHelper'].value > nums[right]) {
                output.push(prevMax['prevMaxHelper'].value);
            } else {
                output.push(nums[right]);
            }
        }
        left++;
        right++;
    }
    return output;
}

console.log(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3))
console.log(maxSlidingWindow([1,-1], 1))
console.log(maxSlidingWindow([1,3,1,2,0,5], 3))
console.log(maxSlidingWindow([-7,-8,7,5,7,1,6,0], 4))
