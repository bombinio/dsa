//You have a RecentCounter class which counts the number of recent requests within a certain time frame.
//
// Implement the RecentCounter class:
//
//     RecentCounter() Initializes the counter with zero recent requests.
//     int ping(int t) Adds a new request at time t, where t represents some time in milliseconds, and returns the number of requests that has happened in the past 3000 milliseconds (including the new request). Specifically, return the number of requests that have happened in the inclusive range [t - 3000, t].
//
// It is guaranteed that every call to ping uses a strictly larger value of t than the previous call.
//
//
//
// Example 1:
//
// Input
// ["RecentCounter", "ping", "ping", "ping", "ping"]
// [[], [1], [100], [3001], [3002]]
// Output
// [null, 1, 2, 3, 3]

// Algos
// 1) Use a queue data structure (DS)
// 2) Push the current call to the queue and calculate the difference between this call time and 3 seconds (3000 milliseconds)
// 3) Check if the first call in the queue is within this time difference range. If not, it means this call was
// made more than 3 seconds before, so we should remove the first element from the queue using .shift()

// Key point: use queue (DS)

class arrayObject {
  final int counter;
  final int t;

  const arrayObject({
    required this.counter,
    required this.t,
  });
}

class RecentCounter {
  final queue = <arrayObject>[];

  RecentCounter();

  int ping(int t) {
    int timeDiff = queue.isNotEmpty ? t - queue[0].t : 0;
    while (queue.isNotEmpty && timeDiff > 3000) {
      queue.removeAt(0);
      timeDiff = queue.isNotEmpty ? t - queue[0].t : 0;
    }
    queue.add(arrayObject(counter: queue.length, t: t));
    return queue.length;
  }
}


void main() {
  RecentCounter inst1 = RecentCounter();
  RecentCounter inst2 = RecentCounter();
  inst1.queue.add(arrayObject(counter: 1, t: 500));
  inst2.queue.add(arrayObject(counter: 2, t: 1000));
  print(inst1.queue[0].t);
  // print(inst1.queue[1].t);
  print(inst2.queue[0].t);
  // print(inst2.queue[1].t);
}


