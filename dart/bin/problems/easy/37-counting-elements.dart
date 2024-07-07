// Given an integer array arr, count how many elements x there are, such that x + 1 is also in arr. If there are duplicates in arr, count them separately.
//
//
//
// Example 1:
//
// Input: arr = [1,2,3]
// Output: 2
// Explanation: 1 and 2 are counted cause 2 and 3 are in arr.

// Algos
// 1) save elements in hashmap
// 2) In second loop check, if currNum + 1 is in prevMap, if yes increment result variable

// Key point: use hashmap to fastly check if number is in array

class Solution {
  int countElements(List<int> arr) {
    final prevMap = <int, int>{};
    int output = 0;
    for (int i = 0; i < arr.length; i++) {
      prevMap[arr[i]] = (prevMap[arr[i]] ?? 0) + 1;
    }

    for (int key in prevMap.keys) {
      int nextKey = key + 1;
      if (prevMap.containsKey(nextKey)) {
        output += prevMap[key]!;
        nextKey = nextKey + 1;
      }
    }
    return output;
  }
}