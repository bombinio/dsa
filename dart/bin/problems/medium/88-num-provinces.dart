class Solution {
  int findCircleNum(List<List<int>> isConnected) {
    int provinces = 0;
    Set<int> seen = Set();
    void dfs(List<int> connections, int index) {
      for (int i = 0; i < connections.length; i++) {
        if (i != index && connections[i] == 1 && !seen.contains(i)) {
          seen.add(i);
          dfs(isConnected[i], i);
        }
      }
    }
    for (int i = 0; i < isConnected.length; i++) {
      if (!(seen.contains(i))) {
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
