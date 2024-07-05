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

class Solution {
  bool canConstruct(String ransomNote, String magazine) {
    final noteMap = {};
    final magazineMap = {};
    for (int i = 0; i < ransomNote.length; i++) {
      noteMap[ransomNote[i]] = noteMap.containsKey(ransomNote[i]) ? noteMap[ransomNote[i]] + 1 : 1;
    }
    for (int i = 0; i < magazine.length; i++) {
      magazineMap[magazine[i]] = magazineMap.containsKey(magazine[i]) ? magazineMap[magazine[i]] + 1 : 1;
    }
    for (var key in noteMap.keys) {
      if (noteMap[key] > (magazineMap[key] ?? 0) ) {
        return false;
      }
    }
    return true;
  }
}