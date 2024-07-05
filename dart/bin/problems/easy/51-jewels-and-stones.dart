// You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.
//
// Letters are case sensitive, so "a" is considered a different type of stone from "A".
//
//
//
// Example 1:
//
// Input: jewels = "aA", stones = "aAAbbbb"
// Output: 3

// Algos
// 1) Save stones in hashmap
// 2) Iterate through jewels and if jewel is in stones hashmap => increase output by value that has jewel in stones hashmap


// Key point: Use hashmap to save amount of each stone

class Solution {
  int numJewelsInStones(String jewels, String stones) {
    final stonesMap = {};
    int output = 0;
    for (int i = 0; i < stones.length; i++) {
      stonesMap[stones[i]] = stonesMap.containsKey(stones[i]) ? stonesMap[stones[i]] + 1 : 1;
    }
    for (int i = 0; i < jewels.length; i++) {
      if (stonesMap.containsKey(jewels[i])) {
        output += stonesMap[jewels[i]] as int;
      }
    }
    return output;
  }
}