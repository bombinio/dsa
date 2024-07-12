// Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of strings.
//
// Please implement encode and decode
//
// Example 1:
//
// Input: ["neet","code","love","you"]
//
// Output:["neet","code","love","you"]

// 1) To encode string, firstly put length of word at the start and '#' symbol after length, it will help to decode it
// 2) To decode it, we use i and j pointers to find length of word, firstly i = 0 and j = 1, while j won't meet
// '#' it means we are still in range of 'length of word', if str[j] is '#' that means range [i:j] is length of word
// so we can concatenate it variable wordLength and convert it to number, now we have index where word start ('j+1') and
// length of word, we just need again 'cut' it from string and put to array => str.slice(j+1, wordLen + j + 1) and then
// put 'i' index to the end of word, to find new words

// Key point: encode every word as 'word.length#word'

class Solution {
  String encode(List<String> words) {
    String output = '';
    for (int i = 0; i < words.length; i++) {
      output += '${words[i].length}#${words[i]}';
    }
    return output;
  }

  List<String> decode(String words) {
    var output = <String>[];
    for (int i = 0; i < words.length; i++) {
      int j = i + 1;
      while (j < words.length - 1 && words[j] != '#') {
        j++;
      }
      String wordLengthString = '';
      for (int k = i; k < j; k++) {
        wordLengthString += words[k];
      }
      int wordLength = int.parse(wordLengthString);
      String targetWord = words.substring(j + 1, j + 1 + wordLength);
      output.add(targetWord);
      i = (j + 1 + wordLength) - 1;
    }
    return output;
  }
}

void main() {
  // print(Solution().encode(['neet', 'code']));
  // print(Solution().decode('4#neet4#code'));
  // print(Solution().encode(['hello', 'world']));
  // print(Solution().decode('5#hello5#world'));
  print(Solution().encode(['veryverybigword', 's', '', 'code']));
  print(Solution().decode('15#veryverybigword1#s0#4#code'));
  // print(Solution().encode(['']));
  // print(Solution().decode('0#'));
}
