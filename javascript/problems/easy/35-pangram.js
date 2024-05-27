// A pangram is a sentence where every letter of the English alphabet appears at least once.
//
// Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.
//
//
//
// Example 1:
//
// Input: sentence = "thequickbrownfoxjumpsoverthelazydog"
// Output: true
// Explanation: sentence contains at least one of every letter of the English alphabet.

// Algos
// 1) WE know amount of letters = 26, so we can create matrix of size 26 with zeros
// 2) If we met letter we increment matrix with index of this letter in alphabet
// 3) AFter all we check if matrix has element with value zero, if yes, some letter did not appear in string

// Key point: Declare matrix with size 26

const checkIfPangram = function (sentence) {
    const letters =  []
    for (let i = 0; i < 26; i++) {
        letters.push(0)
    }
    for (let i = 0; i < sentence.length; i++) {
        const index = sentence.charCodeAt(i) - 'a'.charCodeAt(0)
        letters[index]++;
    }
    for (let i = 0; i < letters.length; i++) {
        if (letters[i] === 0) return false
    }
    return true;
}

console.log(checkIfPangram('thequickbrownfoxjumpsoverthelazydog'))