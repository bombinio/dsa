// The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.
//
// You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.
//
// For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.
//
// Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

// TODO

const nextGreaterElement = function(nums1, nums2) {
    let stackIncreasing = [];
    let output = Array.from(nums1).fill(-1);
    for (let i = 0; i < nums2.length; i++) {
        while(nums2[i] < nums2[stackIncreasing[stackIncreasing.length-1]]) {
            stackIncreasing.pop();
        }
        stackIncreasing.push(i);
    }
    for (let i = 0; i < nums1.length; i++) {
        if (nums1[i] < nums2[stackIncreasing[stackIncreasing.length-1]]) {
            output[i] = stackIncreasing[stackIncreasing.length-1]
        }
    }
    return output;
};

console.log(nextGreaterElement([4,1,2], [1,3,4,2]))
console.log(nextGreaterElement([2,4], [1,2,3,4]))