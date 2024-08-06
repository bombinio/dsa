import 'dart:collection';

import 'package:dart/build_tree.dart';

// Algos
// 1) Use BFS to iterate through each level and add new variable sumAtLevel
// which calculates sum at each level and return value of it

// Key point: Use bfs, add variable sumAtLevel which calculates sum at each level

class Solution {
  int deepestLeavesSum(TreeNode? root) {
    final Queue<TreeNode?> q = Queue();
    q.add(root);
    int sumAtLevel = 0;
    while (q.isNotEmpty) {
      int qLen = q.length;
      sumAtLevel = 0;
      for (int i = 0; i < qLen; i++) {
        final node = q.removeFirst();
        if (node != null) {
          sumAtLevel += node.val!;
          if (node.left != null) {
            q.add(node.left);
          }
          if (node.right != null) {
            q.add(node.right);
          }
        }
      }
    }
    return sumAtLevel;
  }
}

void main() {
  TreeNode? node = buildTree([1,3,2,5,3,null,9]);
  final result = Solution().deepestLeavesSum(node);
  print(result);
}
