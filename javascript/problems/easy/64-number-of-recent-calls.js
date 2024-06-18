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

const RecentCounter = function () {
    this.queue = [];
}

RecentCounter.prototype.ping = function (t) {
    this.queue.push(t);
    let diff = t - 3000;
    while (diff > this.queue[0]) {
        this.queue.shift();
    }
    return this.queue.length;
}

const recentCounter = new RecentCounter();

recentCounter.ping(642);
recentCounter.ping(1849);
const result = recentCounter.ping(4921);
console.log(result);
