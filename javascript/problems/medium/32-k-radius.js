// You are given a 0-indexed array nums of n integers, and an integer k.
//
// The k-radius average for a subarray of nums centered at some index i with the radius k is the average of all elements in nums between the indices i - k and i + k (inclusive). If there are less than k elements before or after the index i, then the k-radius average is -1.
//
// Build and return an array avgs of length n where avgs[i] is the k-radius average for the subarray centered at index i.
//
// The average of x elements is the sum of the x elements divided by x, using integer division. The integer division truncates toward zero, which means losing its fractional part.
//
//     For example, the average of four elements 2, 3, 1, and 5 is (2 + 3 + 1 + 5) / 4 = 11 / 4 = 2.75, which truncates to 2.
// damn solved from first try

// Algos
// 1) Firstly we need to calculate prefix sum at each iteration
// 2) then in second loop, we filter numbers that are not in the range 'i<k' and 'i>=prefix.length - k' so we only
// get legal radius
// 3) if 'i' in legal range, then we calculate: 1) current diameter and difference, that's why we need prefix sum,
// but how to calculate  diameter not including first few number in our calculation? We should just find index of start
// index 'i + k - (k * 2) - 1'and substract prefix sum at this iteration, then we just need divide avgSum to amount of
// number in subarray (k*2 + 1) to find avgNum;

// Key points => use prefix sum

const getAverages = function(nums, k) {
    const prefix = [nums[0]]
    const avgs = []
    for (let i = 1; i < nums.length; i++) {
        prefix.push(nums[i] + prefix[prefix.length-1])
    }
    for (let i = 0; i < prefix.length; i++) {
        if (i < k || i >= (prefix.length - k) ) {
            avgs.push(-1)
        } else {
            const diff = i + k - (k*2) - 1
            let avgSum;
            if (diff < 0) {
                avgSum = prefix[i+k]
            } else {
                avgSum = prefix[i+k] - prefix[diff]
            }
            const avgNum = Math.floor(avgSum / (k * 2 + 1) )
            avgs.push(avgNum)
        }
    }
    console.log(avgs)
    // return JSON.stringify(prefix);
    return avgs;
}

console.log(getAverages([7,4,3,9,1,8,5,2,6], 3))