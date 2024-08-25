// There are n cities numbered from 0 to n - 1 and n - 1 roads such that there is only one way to travel between two different cities (this network form a tree). Last year, The ministry of transport decided to orient the roads in one direction because they are too narrow.
//
// Roads are represented by connections where connections[i] = [ai, bi] represents a road from city ai to city bi.
//
// This year, there will be a big event in the capital (city 0), and many people want to travel to this city.
//
// Your task consists of reorienting some roads such that each city can visit the city 0. Return the minimum number of edges changed.
//
// It's guaranteed that each city can reach city 0 after reorder.
//
// Example 1:
//
// Input: n = 6, connections = [[0,1],[1,3],[2,3],[4,0],[4,5]]
// Output: 3
// Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).

class Solution {
  int minReorder(int n, List<List<int>> connections) {
    int reorders = 0;
    Set<String> connectionsInSet = {};
    Set<int> visited = {};
    Map<int, List<int>> adj = {};
    connections.forEach((connection) {
      String connectionInString = "${connection[0]},${connection[1]}";
      connectionsInSet.add(connectionInString);
      if (adj.containsKey(connection[0])) {
        adj[connection[0]]!.add(connection[1]);
      } else {
        adj[connection[0]] = [];
        adj[connection[0]]!.add(connection[1]);
      }
      if (adj.containsKey(connection[1])) {
        adj[connection[1]]!.add(connection[0]);
      } else {
        adj[connection[1]] = [];
        adj[connection[1]]!.add(connection[0]);
      }
    });

    bool isInConnections(int city, int neighbour) {
      String connectionInString = "$neighbour,$city";
      return connectionsInSet.contains(connectionInString);
    }

    void dfs(int city) {
      visited.add(city);
      if (adj[city] != null) {
        adj[city]!.forEach((neighbour) {
          if (isInConnections(neighbour, city) == true && !visited.contains(neighbour)) {
            reorders++;
          }
          if (visited.contains(neighbour) == false) {
            visited.add(neighbour);
            dfs(neighbour);
          }
        });
      }
    }

    dfs(0);

    return reorders;
  }
}

void main() {
  print(Solution().minReorder(6, [
    [0, 1],
    [1, 3],
    [2, 3],
    [4, 0],
    [4, 5]
  ]));
  // print(Solution().minReorder(5, [
  //   [1, 0],
  //   [1, 2],
  //   [3, 2],
  //   [3, 4]
  // ]));
  // print(Solution().minReorder(3, [[1,0],[2,0]]));
  // print(Solution().minReorder(4, [[0,1],[2,0], [3,2]]));
  // print(Solution().minReorder(3, [[1,2],[2,0]]));
  // print(Solution().minReorder(7, [[0,6],[6,3],[1,3],[2,1],[4,0],[4,5]]));
}
