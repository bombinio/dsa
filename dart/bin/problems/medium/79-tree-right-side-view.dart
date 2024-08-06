// Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
//
// Example 1:
//
// Input: root = [1,2,3,null,5,null,4]
// Output: [1,3,4]

import 'dart:collection';

import 'package:dart/build_tree.dart';

// Algos
// 1) Use BFS to iterate through each level and add in output only last
// node of level, node with index qLen - 1

// Key point: Use bfs, add only last node at each level

class Solution {
  List<int> rightSideView(TreeNode? root) {
    final Queue<TreeNode?> q = Queue();
    final List<int> output = [];
    q.add(root);
    while (q.isNotEmpty) {
      int qLen = q.length;
      for (int i = 0; i < qLen; i++) {
        final node = q.removeFirst();
        if (node != null) {
          if (node.left != null) {
            q.add(node.left);
          }
          if (node.right != null) {
            q.add(node.right);
          }
          if (i == qLen - 1) {
            output.add(node.val!);
          }
        }
      }
    }
    return output;
  }
}

void main() {
  TreeNode? node = buildTree([1,2,3,null,5,6,null,4]);
  final result = Solution().rightSideView(node);
  print(result);

  final List<int> testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final Queue<int> testQueue = Queue.from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  final stopwatch = Stopwatch()..start();
  while (testArray.isNotEmpty) {
    testArray.removeAt(0);
  }
  // print('It took for array: ${stopwatch.elapsed}');
  stopwatch.reset();
  while (testQueue.isNotEmpty) {
    testQueue.removeFirst();
  }
  // print('It took for queue: ${stopwatch.elapsed}');
}
