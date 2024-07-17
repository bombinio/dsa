// You are given an integer array matches where matches[i] = [winneri, loseri] indicates that the player winneri defeated player loseri in a match.
//
// Return a list answer of size 2 where:
//
//     answer[0] is a list of all players that have not lost any matches.
//     answer[1] is a list of all players that have lost exactly one match.
//
// The values in the two lists should be returned in increasing order.
//
// Note:
//
//     You should only consider the players that have played at least one match.
//     The testcases will be generated such that no two matches will have the same outcome.
//
//
//
// Example 1:
//
// Input: matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
// Output: [[1,2,10],[4,5,7,8]]
// Explanation:
// Players 1, 2, and 10 have not lost any matches.
// Players 4, 5, 7, and 8 each have lost one match.
// Players 3, 6, and 9 each have lost two matches.
// Thus, answer[0] = [1,2,10] and answer[1] = [4,5,7,8].

// Algos
// 1) track wins and losses of each players in hashmap
// 2) If player won, increment wins, otherwise increment losses
// 3) Iterate through hashmap and push to output arrays players with 0 and 1 losses
// 4) sort output arrays

// Key points: Use hashmap to track every player wins and losses

class UserRecord {
  int losses = 0;
  int wins = 0;

}

class Solution {
  List<List<int>> findWinners(List<List<int>> matches) {
    final answer = <List<int>>[[], []];
    final prevMap = <int, UserRecord>{};
    for (int i = 0; i < matches.length; i++) {
      if (prevMap.containsKey(matches[i][1])) {
        prevMap[matches[i][1]]!.losses +=1;
      } else {
        prevMap[matches[i][1]] = UserRecord();
        prevMap[matches[i][1]]!.losses +=1;
      }
      if (prevMap.containsKey(matches[i][0])) {
        prevMap[matches[i][0]]!.wins +=1;
      } else {
        prevMap[matches[i][0]] = UserRecord();
        prevMap[matches[i][0]]!.wins +=1;
      }
    }
    for (var key in prevMap.keys) {
      if (prevMap[key]!.losses == 0) {
        answer[0].add(key);
      } else if (prevMap[key]!.losses == 1) {
        answer[1].add(key);
      }
    }
    answer[0].sort((a,b) => a - b);
    answer[1].sort((a,b) => a - b);
    return answer;
  }
}

void main() {
  print(Solution().findWinners([
    [1, 3],
    [2, 3],
    [3, 6],
    [5, 6],
    [5, 7],
    [4, 5],
    [4, 8],
    [4, 9],
    [10, 4],
    [10, 9]
  ]));
}
