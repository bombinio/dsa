// You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
//
// Return the length of the longest substring containing the same letter you can get after performing the above operations.
//
//
//
// Example 1:
//
// Input: s = "ABAB", k = 2
// Output: 4
// Explanation: Replace the two 'A's with two 'B's or vice versa.

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algo
// 1) Initialise left and right pointers, they will represent size of window
// 2) Traverse string and add each char to visited hashMap
// 3) Compare current char value in hashMap with maxCount, if repeatings of char is bigger, maxCount replaces with this value
// 4) If our windowSize - maxCount char > k => it means we can't replace more characters, so we need to shrink window
// 5) we remove very first character, by doing visited[s[left]]-- and incrementing left pointer and right too
// 6) Now we got our maxWindow size and it wont shrink anymore, only grow if it will be possible
// 7) for Example 'AACABBAAAAA', k = 1, first window is 'AACA' then we just more left and right pointer and kinda have fixated
// window, until we have this window 'BAAA' from this point our window will only grow, in the end, right pointer will be
// 10 and left pointer will be 5, size of window is 10-5 + 1 = 6, windowSize(6) - maxCount(5) is not bigger then k(1),
// so window is valid, after right++, right === string.length, so loop ends, we return window length

// Key points: 1) Find first minimum max window size, and then just move both pointers to find bigger window

const characterReplacement = function(s, k) {
    let left = 0;
    let right = 0;
    let maxChar = 0;
    let prevMap = {};
    while (right < s.length) {
        if (s[right] in prevMap) {
            prevMap[s[right]]++
        } else {
            prevMap[s[right]] = 1
        }
        maxChar = Math.max(prevMap[s[right]], maxChar)
        while ( right - left + 1 - maxChar > k  ) {
            prevMap[s[left]]--;
            left++
        }
        right++
    }
    return right - left;
}

console.log(characterReplacement('ABAB', 2))
console.log(characterReplacement('AABABBA', 1))
