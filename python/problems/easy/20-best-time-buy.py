# You are given an array prices where prices[i] is the price of a given stock on the ith day.
#
# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
#
# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
#
#
#
# Example 1:
#
# Input: prices = [7,1,5,3,6,4]
# Output: 5
# Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
# Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

# Algorithm: Sliding Window Technique !! 🤩🤩🤩
# 1) Declare left and right pointers, right pointer should be 'left + 1' because we need to find profit 'tomorrow -
# today'
# 2) Loop until left or right pointers are in range of length of array, so we don't have 'index out of range'
# 3) If price today is more than tomorrow, we wont have profit today, even if day after tomorrow is profitable, this day
# will be also profitable for tomorrow, and it will be more profitable
# 4) If left pointer is more than right, we make 'l=r' no sense to loop through other days between
# 5) If today is less than we save value in tmpProfit and compare it with main profit, bigger profit wins
# 6) Repeat this process

class Solution(object):
    def maxProfit(self, prices):
        l = 0
        r = l + 1
        profit = 0
        while l < len(prices) and r < len(prices):
            tmpProfit = 0
            if prices[l] > prices[r]:
                l = r
                continue
            tmpProfit = prices[r] - prices[l]
            if tmpProfit > profit:
                profit = tmpProfit
            r += 1

        return profit


sol = Solution()
print(sol.maxProfit([7,1,5,3,6,4]))