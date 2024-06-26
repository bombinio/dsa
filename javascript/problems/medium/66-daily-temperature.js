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

const dailyTemperatures = function(temperatures) {
    const stackDecreasing = [];
    const output = Array.from(temperatures).fill(0);
    for (let i = 0; i < temperatures.length; i++) {
        while (temperatures[i] > temperatures[stackDecreasing[stackDecreasing.length-1]]) {
            let indexOfLastTemperature = stackDecreasing.pop();
            output[indexOfLastTemperature] = i - indexOfLastTemperature;
        }
        stackDecreasing.push(i);
    }

    return  output;
};

console.log(dailyTemperatures([34,35,40, 31, 32, 33, 50]))