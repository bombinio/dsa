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

// Algo
// 1) Check first index of array, if it's less than 0+1 and arr.length - 1, it means it's lowest number
// 2) Otherwise i = arr.len - 1, now check arr.len - 1 - 1, if it's bigger than i, then i is the lowest number
// 3) Otherwise we search in range [1:arr.len-1-1] like in ordinary binary search

// TODO
const findMin = function(nums) {
    let left = 0;
    let right = nums.length - 1;
    let minValue = nums[0];
    while (left <= right) {
        if (nums[left] < nums[right]){
            minValue =  Math.min(minValue, nums[left])
            break;
        }
        let mid = Math.floor((left + right) / 2)
        minValue = Math.min(minValue, nums[mid])
        if (nums[mid] > nums[right]) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return minValue;
}



console.log(findMin([2,3,4,5,1]))
console.log(findMin([4,5,6,7,0,1,2]))
console.log(findMin([3,4,5,6,1,2]))
console.log(findMin([5,1,2,3,4]))
console.log(findMin([7,8,1,2,3,4,5,6]))