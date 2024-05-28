// Given a string s, find the length of the longest
// substring
// without repeating characters.
//
//
//
// Example 1:
//
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.

// Algos: sliding window
// 1) Declare two pointers, left(first letter, 0) right(second letter, 1) and hashset
// 2) Hashset helps us to track letters that repeats, but just doing .has(letter) we check if it is in substring
// If it is, we shrink our window, but before of course we compare current size of window(right - left) with output,
// previous max window
// 3) If letter repeats, we shrink window and delete tail of our window
// 4) if letter does not repeat our window only grows

// Key point: sliding window, hashset to track repeating letters

const lengthOfLongestSubstring = function(s) {
    if (s.length === 0) return 0;
    let left = 0;
    let right = 1;
    let output = 1;
    let prevSet = new Set(s[0]);
    while (right < s.length) {
        if (prevSet.has(s[right])){
            output = Math.max(output, (right-left) )
            while (prevSet.has(s[right])) {
                prevSet.delete(s[left])
                left++;
            }
        } else {
            prevSet.add(s[right])
            right++;
            output = Math.max(output, (right - left))
        }
    }
    return output;
}

console.log(lengthOfLongestSubstring('abcabcbb'))