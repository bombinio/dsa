// Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).
//
// Example 1:
//
// Input: root = [1,3,2,5,3,null,9]
// Output: [1,3,9]

import 'dart:collection';
import 'dart:math';

import 'package:dart/build_tree.dart';

// Algos
// 1) Use BFS to iterate through each level and add new variable maxInRow
// which saves values of max value at each level

// Key point: Use bfs, add variable maxInRow which saves max value at each level

class Solution {
  List<int> largestValues(TreeNode? root) {
    if (root == null) {
      return [];
    }
    final Queue<TreeNode?> q = Queue();
    final List<int> output = [];
    q.add(root);
    while (q.isNotEmpty) {
      int qLen = q.length;
      int? maxInRow;
      for (int i = 0; i < qLen; i++) {
        final node = q.removeFirst();
        if (node != null) {
          if (maxInRow == null) {
            maxInRow = node.val;
          } else {
            maxInRow = max(maxInRow, node.val!);
          }
          if (node.left != null) {
            q.add(node.left);
          }
          if (node.right != null) {
            q.add(node.right);
          }
        }
      }
      output.add(maxInRow!);
    }
    return output;
  }
}

void main() {
  TreeNode? node = buildTree([1,3,2,5,3,null,9]);
  final result = Solution().largestValues(node);
  print(result);
}
