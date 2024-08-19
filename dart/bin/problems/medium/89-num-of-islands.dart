// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
//
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
// Example 1:
//
// Input: grid = [
//   ["1","1","1","1","0"],
//   ["1","1","0","1","0"],
//   ["1","1","0","0","0"],
//   ["0","0","0","0","0"]
// ]
// Output: 1

class Solution {
  int numIslands(List<List<String>> grid) {
    int islands = 0;
    Set<String> visited = {};
    void dfs(int row, int col) {
      visited.add('$row,$col');
      if (grid[row][col] == '0') return;
      if ((row + 1) < grid.length &&
          grid[row + 1][col] == '1' &&
          !visited.contains('${row + 1},$col')) {
        dfs(row + 1, col);
      }
      if ((row - 1) >= 0 &&
          grid[row - 1][col] == '1' &&
          !visited.contains('${row - 1},$col')) {
        dfs(row - 1, col);
      }
      if ((col + 1) < grid[row].length &&
          grid[row][col + 1] == '1' &&
          !visited.contains('$row,${col + 1}')) {
        dfs(row, col + 1);
      }
      if ((col - 1) >= 0 &&
          grid[row][col - 1] == '1' &&
          !visited.contains('$row,${col - 1}')) {
        dfs(row, col - 1);
      }
    }

    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == '1' && !visited.contains('$i,$j')) {
          dfs(i, j);
          islands++;
        }
      }
    }
    return islands;
  }
}

void main() {
  print(Solution().numIslands(
    [
      ["1", "1", "1", "1", "0"],
      ["1", "1", "0", "1", "0"],
      ["1", "1", "0", "0", "0"],
      ["0", "0", "0", "0", "0"]
    ],
  ));
  print(Solution().numIslands([
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"]
  ]));
  print(Solution().numIslands(
    [
      ["1", "1", "1"],
      ["0", "1", "0"],
      ["1", "1", "1"]
    ],
  ));
}
