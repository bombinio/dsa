// Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.
//
//
//
// Example 1:
//
// Input: temperatures = [73,74,75,71,69,72,76,73]
// Output: [1,1,4,2,1,1,0,0]

// Algos
// 1) Firstly declare stack and output array with 0s
// 2) Now we will use decreasing monotonic stack, so we add only biggest temperatures to the stack
// By comparing curr number with last number in stack, while its bigger we .pop() index from stack and in the end
// we push temperature of new day
// 3) If current day is bigger it means today is warmer than yesterday, as we saved only index in stack, we can
// pop this index and call it 'j' now difference between 'i-j' is exactly our answer

// Key point: use monotonic decreasing stack, which saves only indexes of warmest days

class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    final stackDecreasing = [];
    final output = List.filled(temperatures.length, 0, growable: false);
    for (int i = 0; i < temperatures.length; i++) {
      while (stackDecreasing.isNotEmpty && temperatures[i] > temperatures[stackDecreasing[stackDecreasing.length-1]]) {
        int prevTemperatureIndex = stackDecreasing.removeLast();
        output[prevTemperatureIndex] = i - prevTemperatureIndex;
      }
      stackDecreasing.add(i);
    }
    return output;
  }
}

void main() {
  print(Solution().dailyTemperatures([73,74,75,71,69,72,76,73]));
}