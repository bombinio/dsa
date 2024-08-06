import 'dart:collection';

import 'package:dart/build_tree.dart';

// Algos
// 1) Add new variable depth, and increase it after each level
// 2) If depth % 2 != 0 then reverse 'level' array and add to output

// Key point: use depth variable, if variable % 2 != 0 => reverse level array
// and add to output array

class Solution {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    if (root == null) {
      return [];
    }
    final Queue<TreeNode?> q = Queue();
    final List<List<int>> output = [];
    q.add(root);
    int depth = 0;
    while (q.isNotEmpty) {
      int qLen = q.length;
      final List<int> level = [];
      for (int i = 0; i < qLen; i++) {
        final node = q.removeFirst();
        if (node != null) {
          level.add(node.val!);
          if (node.left != null) {
            q.add(node.left);
          }
          if (node.right != null) {
            q.add(node.right);
          }
        }
      }
      // print(level);
      // print('depth: $depth');
      if (depth % 2 != 0) {
        output.add(level.reversed.toList());
      } else {
        output.add(level);
      }
      depth++;
    }

    return output;
  }
}

void main() {
  // TreeNode? node = buildTree([3,9,20,null,null,15,7]);
  TreeNode? node2 = buildTree([1, 2, 3, 4, null, null, 5]);
  final result = Solution().zigzagLevelOrder(node2);
  print(result);
}
