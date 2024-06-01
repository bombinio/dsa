// For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
//
// Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//     I can be placed before V (5) and X (10) to make 4 and 9.
//     X can be placed before L (50) and C (100) to make 40 and 90.
//     C can be placed before D (500) and M (1000) to make 400 and 900.
//
// Given a roman numeral, convert it to an integer.
//
//
//
// Example 1:
//
// Input: s = "III"
// Output: 3
// Explanation: III = 3.

// Algos
// 1) Add all roman numbers to hashmap
// 2) Create base case when to exit recursion => when index >= index of last letter
// 3) Get value of roman number, key is number and value in hashmap represents what value has this roman number
// 4) If number in string is more than current number => 'IV' we subtract 'V' from 'I' and move index twice
// index++ and in function call (..., index + 1, ...)
// 5) return sum when we reached end of string

// Key point: use hash map to fastly check all values of roman numbers, if we have 'IV' subtract highest from lowest
// and increase pointer(index) by 2

function romanToInt(str, index = 0, sum = 0) {
    const map = {'D': 500, 'M': 1000, 'C': 100, 'X': 10, 'L': 50, 'V': 5, 'I': 1}
    if (index >= str.length) {
        return sum;
    }
    let currLetterValue = map[str[index]]
    if (map[str[index + 1]] > currLetterValue) {
        currLetterValue = map[str[index + 1]] - currLetterValue
        index++;
    }
    sum += currLetterValue
    return romanToInt(str, index + 1, sum)
}

console.log(romanToInt('DCVIII'))
console.log(romanToInt('DCCXXVII'))
console.log(romanToInt('MMXXIV'))
console.log(romanToInt('MMDCCLXXVII'))
console.log(romanToInt('MCMXCIV'))