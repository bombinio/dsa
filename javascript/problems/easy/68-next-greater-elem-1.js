// The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.
//
// You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.
//
// For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.
//
// Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

// Algos: monotonic stack
// 1) Use monotonic decreasing stack to find next greater number and save it in hashmap
// 2) In second loop check if current number in hashmap, if yes then in output array, with current index, put
// value of hashmap with key as current number

// Key point: Use monotonic decreasing stack + hashmap to save current number and his next greater element


const nextGreaterElement = function (nums1, nums2) {
    const stackDecreasing = [];
    const prevMap = {};
    const output = Array.from(nums1).fill(-1);
    for (let i = 0; i < nums2.length; i++) {
        while (nums2[i] > nums2[stackDecreasing[stackDecreasing.length-1]]) {
            let lastNumIndex = stackDecreasing.pop();
            let lastNum = nums2[lastNumIndex];
            prevMap[lastNum] = i;
        }
        stackDecreasing.push(i);
    }
    console.log(prevMap)
    for (let i = 0; i < nums1.length; i++) {
        if (nums1[i] in prevMap) {
            output[i] = nums2[prevMap[nums1[i]]]
        }
    }
    return output;
}

console.log(nextGreaterElement([4,1,2], [1,3,4,2]))
// console.log(nextGreaterElement([4, 1, 2], [1, 2, 3, 4]))
// console.log(nextGreaterElement([2,4], [1,2,3,4]))