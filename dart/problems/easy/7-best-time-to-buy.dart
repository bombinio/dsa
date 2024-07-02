// You are given an array prices where prices[i] is the price of a given stock on the ith day.
//
// You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
//
// Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
//
//
//
// Example 1:
//
// Input: prices = [7,1,5,3,6,4]
// Output: 5
// Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
// Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

/*
------------------------------------------------------------------------------------------------------------------------
 */
// Algo 2 pointers
// 1) Init. 2 pointers => today and tomorrow
// 2) If today profit is less than tomorrow, move to the next day, and increase previous tomorrow to current tomorrow
// 3) Otherwise calculate current profit, and move 'tomorrow' pointer to search for bigger profit
// 4) Repeat this process

// Key points: ...


import 'dart:math';

class Solution {
  int maxProfit(List<int> prices) {
    int left = 0;
    int right = 1;
    int maxProfit = 0;
    while (right < prices.length) {
      while (prices[left] > prices[right]) {
        left = right;
        right++;
      }
      maxProfit = max(maxProfit, prices[right] - prices[left]);
      right++;
    }
    return maxProfit;
  }
}