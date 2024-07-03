// You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
//
// Return the max sliding window.
//
// Example 1:
//
// Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
// Output: [3,3,5,5,6,7]
// Explanation:
// Window position                Max
// ---------------               -----
// [1  3  -1] -3  5  3  6  7       3
//  1 [3  -1  -3] 5  3  6  7       3
//  1  3 [-1  -3  5] 3  6  7       5
//  1  3  -1 [-3  5  3] 6  7       5
//  1  3  -1  -3 [5  3  6] 7       6
//  1  3  -1  -3  5 [3  6  7]      7

// Algos
// 1) Firstly declare queue and output array
// 2) Now we will use decreasing monotonic queue, so we add only biggest numbers to the queue
// By comparing curr number with last number in queue, while its bigger we .pop() index from queue and in the end
// we push index of new number to monotonic queue
// 3) in first while loop we check, if number is greater than last number in queue, if yes we .pop() last numbers from queue
// So we add only biggest numbers to queue but we also add this number to queue in the end, even if its the smallest one
// 4) Then in our queue first element is the largest, so we can push it to output array, but firstly we have to check, if
// this number in window range, by comparing queue[0] < right - k + 1, if it's less we shift this number from queue

// Key point: use monotonic decreasing queue, which saves only indexes of biggest numbers, if index is less than
// right - k + 1 => it means number is outside of window, so we have to .shift() it

class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k ) {
    final output = <int>[];
    final queue = [];
    for (int i = 0; i < k; i++) {
      while (nums[i] > nums[queue[queue.length-1]]) {
        queue.removeLast();
      }
      queue.add(i);
    }
    output.add(nums[queue[0]]);
    int right = k;
    while (right < nums.length) {
      while (nums[right] > nums[queue[queue.length-1]]) {
        queue.removeLast();
      }
      queue.add(right);
      while (queue[0] < right - k + 1) {
        queue.removeAt(0);
      }
      output.add(queue[0]);
    }
    return output;
  }
}