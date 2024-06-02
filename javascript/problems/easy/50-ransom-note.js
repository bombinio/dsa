// Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
//
// Each letter in magazine can only be used once in ransomNote.
//
//
//
// Example 1:
//
// Input: ransomNote = "a", magazine = "b"
// Output: false

// Algos
// 1) Save letters from both string in hashmap
// 2) If magazine does not have letter from ransomNote return false, else if it has, but value is less than in ransomNote
// it means this letter repeats less times and we cant build the same word => return false
// 3) return true it we did not return false :)

// Key point: use hashmap for both strings, check occurrences of each letter using hashmap

const canConstruct = function(ransomNote, magazine) {
    const ransomNoteMap = {};
    const magazineMap = {};
    for (let i = 0; i < ransomNote.length; i++) {
        ransomNoteMap[ransomNote[i]] = (ransomNote[i] in ransomNoteMap) ? ransomNoteMap[ransomNote[i]] + 1 : 1
    }
    for (let i = 0; i < magazine.length; i++) {
        magazineMap[magazine[i]] = (magazine[i] in magazineMap) ? magazineMap[magazine[i]] + 1 : 1
    }
    for (const ransomNoteKey in ransomNoteMap) {
        if (!magazineMap[ransomNoteKey] || ransomNoteMap[ransomNoteKey] > magazineMap[ransomNoteKey]) {
            return false
        }
    }
    return true;
}

console.log(canConstruct('a', 'b'))
console.log(canConstruct('aa', 'ab'))
console.log(canConstruct('aa', 'aab'))
