// https://leetcode.com/problems/maximum-number-of-balloons/description/
// Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.
//
// You can use each character in text at most once. Return the maximum number of instances that can be formed.
//
//
//
// Example 1:
//
// Input: text = "nlaebolko"
// Output: 1

// Algos
// 1) Use hashmap to track occurrence of each letter
// 2) Divide letters 'l' and 'o' by two, because in word 'balloon' they are repeat
// 3) Save of values in output array
// 4) Find min value in output array => how many times we can make word 'balloon'

// Key point: use hashmap to track occurrence of each letter in word 'balloon'

const maxNumberOfBalloons = function(text) {
    const balloonObj = {'b': 0, 'a': 0, 'l': 0, 'o': 0, 'n': 0};
    for (let i = 0; i < text.length; i++) {
        if (text[i] in balloonObj) {
            balloonObj[text[i]]++;
        }
    }
    ((balloonObj['l'] = balloonObj['l'] / 2) && (balloonObj['o'] = balloonObj['o'] / 2))
    const output = Object.values(balloonObj);
    return Math.floor(Math.min.apply(Math, output));
    // return Math.floor(Math.min(...output));
}

console.log(maxNumberOfBalloons('loonbalxballpoon'))
console.log(maxNumberOfBalloons('nlaebolko'))
console.log(maxNumberOfBalloons('leetcode'))
console.log(maxNumberOfBalloons('balon'))
