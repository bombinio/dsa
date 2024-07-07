// Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.
//
// Implement the MovingAverage class:
//
//     MovingAverage(int size) Initializes the object with the size of the window size.
//     double next(int val) Returns the moving average of the last size values of the stream.
//
//
//
// Example 1:
//
// Input
// ["MovingAverage", "next", "next", "next", "next"]
// [[3], [1], [10], [3], [5]]
// Output
// [null, 1.0, 5.5, 4.66667, 6.0]

// Algos
// 1) Use a queue data structure (DS)
// 2) Push the current value to the queue and check if the queue length is within 'this.size' range. If not,
// it means we have to remove first element from queue by .shift()
// 3) When queue.length is less than this.size we can calculate average value and return it

// Key point: use queue (DS)

class MovingAverage {
  int sum = 0;
  final int size;
  final queue = <int>[];

  MovingAverage(this.size);

  double next(int val) {
    if (queue.length >= size) {
      int firstEl = queue.removeAt(0);
      sum -= firstEl;
    }
    sum += val;
    queue.add(val);
    return sum / queue.length;
  }
}


