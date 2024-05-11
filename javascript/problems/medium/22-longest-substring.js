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