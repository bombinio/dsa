// There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
//
// A province is a group of directly or indirectly connected cities and no other cities outside of the group.
//
// You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
//
// Return the total number of provinces.
// Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
// Output: 2

// Algos
// 1) Create Set to save indexes of visited cities
// 2) Go through each city's connections and use dfs if city is not visited yet
// 3) In dfs add current city's index to Set and check if city has connection
// city's connections[index] == 1 and this city is not visited, if true run dfs on this city
// and repeat process

// Key points: Create Set of visited cities and if city is not visited run
// dfs on this city

class Solution {
  int findCircleNum(List<List<int>> isConnected) {
    int provinces = 0;
    Set<int> visited = {};
    void dfs(List<int> connections, int index) {
      visited.add(index);
      for (int i = 0; i < connections.length; i++) {
        if (i != index && connections[i] == 1 && !visited.contains(i)) {
          dfs(isConnected[i], i);
        }
      }
    }
    for (int i = 0; i < isConnected.length; i++) {
      if (!(visited.contains(i))) {
        dfs(isConnected[i], i);
        provinces++;
      }
    }
    return provinces;
  }
}

void main() {
  print(Solution().findCircleNum([
    [1, 1, 0],
    [1, 1, 0],
    [0, 0, 1]
  ]));
  print(Solution().findCircleNum([
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1]
  ]));
  print(Solution().findCircleNum([
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
  ]));
}
