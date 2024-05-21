// Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:
//
//     [4,5,6,7,0,1,2] if it was rotated 4 times.
//     [0,1,2,4,5,6,7] if it was rotated 7 times.
//
// Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].
//
// Given the sorted rotated array nums of unique elements, return the minimum element of this array.
//
// You must write an algorithm that runs in O(log n) time.
//
//
//
// Example 1:
//
// Input: nums = [3,4,5,1,2]
// Output: 1
// Explanation: The original array was [1,2,3,4,5] rotated 3 times.

// Algos
// 1) If our mid number is less then right number, it means we are in sequence and we should move in left direction
// 2) We move our right pointer to the middle-1 like in ordinary binary search, and not to lost current mid
// we compare it with 'currMin' and if first mid number was actually the lowest, we already saved it
// 3) Then we just repeat this 'algo' until left <= right, e.g [5,1], left is 0, mid is 0, right is 1, arr[mid] < arr[right]
// we move left pointer, left = 1, mid = 1 right = 1 => we searched all numbers, time to left from cycle, in the next
// iteration loop will break;

// TODO
const findMin = function(nums) {
    let left = 0
    let right = nums.length - 1;
    let currMin = nums[0];
    while (left <= right) {
        let mid = Math.floor((left + right) / 2);
        currMin = Math.min(currMin, nums[mid])
        if (nums[mid] < nums[right]) { // it means we have sequence in range [mid:right] and we must go only to the left
            right = mid - 1;
        }
        else {
            left = mid + 1;
        }
    }
    return currMin;
}



console.log(findMin([2,3,4,5,1]))
console.log(findMin([4,5,6,7,0,1,2]))
console.log(findMin([3,4,5,6,1,2]))
console.log(findMin([5,1,2,3,4]))
console.log(findMin([7,8,1,2,3,4,5,6]))