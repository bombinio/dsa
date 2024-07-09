// Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
//
//
// Example 1:
//
// Input: strs = ["eat","tea","tan","ate","nat","bat"]
// Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

// super cool algorithm, by neetcode(https://www.youtube.com/watch?v=vzdNOK2oB2E&t=202s)
// Algos
// 1) we know that all input strings are lowercase words(a-z) we can represent them in numbers, char 'a' is 97 and
// 'z' is 122
// 2) knowing this, we can create matrix with size 26 with zeros, and increment by one index in matrix, when we meet char
// that represents this index
// 3) Then we can save this word in hashmap with matrix as key, if we have same matrix fo different words, it means they
// are anagrams

// Key points: Save in hashmap matrix with size 26, that represents word

// Algos 2
// 1) sort each word and save it as key in hashmap

// Key points: use hashmap and use sorted word as key

extension sortWords on String {
  String sortWord() {
    var wordList = this.split('');
    wordList.sort((a, b) => a.compareTo(b));
    // print('this is $this');
    return wordList.join('');
  }
}

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final prevMap = {};
    for (int i = 0; i < strs.length; i++) {
      var wordList = strs[i].split('');
      wordList.sort((a, b) => a.compareTo(b));
      var sortedWord = wordList.join('');
      // var sortedWord = strs[i].sortWord();
      if (prevMap.containsKey(sortedWord)) {
        prevMap[sortedWord].add(strs[i]);
      } else {
        prevMap[sortedWord] = [strs[i]];
      }
    }
    final List<List<String>> output = [];
    for (var value in prevMap.values) {
      output.add(value);
    }
    print(output);
    return output;
  }
}

void main() {
  Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"]);
}