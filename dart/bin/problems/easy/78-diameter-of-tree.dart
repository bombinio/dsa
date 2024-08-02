// Given the root of a binary tree, return the length of the diameter of the tree.
//
// The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
//
// The length of a path between two nodes is represented by the number of edges between them.
//
// Example 1:
//
// Input: root = [1,2,3,4,5]
// Output: 3
// Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].

import 'dart:math';

import 'package:dart/build_tree.dart';

// TODO calculate maxDepth for each subtree

class Solution {
  int? diameterOfBinaryTree(TreeNode? root) {
    List<int>? helper(TreeNode? node, [int depth = 0]) {
      if (node == null) {
        return null;
      }
      if (node.left == null && node.right == null) {
        int maxDepth = depth;
        return [depth, maxDepth];
      }
      List<int>? leftMax = helper(node.left, depth + 1);
      List<int>? rightMax = helper(node.right, depth + 1);

      int newFinalMaxDepth = ( (leftMax?[0] ?? 0) + (rightMax?[0] ?? 0) );
      if (leftMax != null) {
        newFinalMaxDepth = max(leftMax[1], newFinalMaxDepth);
      }
      if (rightMax != null) {
        newFinalMaxDepth = max(rightMax[1], newFinalMaxDepth);
      }
      if (node.val == -9) {
        print(newFinalMaxDepth);
        print(leftMax![0]);
        print(rightMax![0]);
        print(depth);
      }
      return [depth, newFinalMaxDepth];
    }

    List<int>? result = helper(root);
    return result![1];
  }
}

void main() {
  TreeNode? node = buildTree([1, 2, 3, 4, 5]);
  TreeNode? node2 = buildTree([
    4,
    -7,
    -3,
    null,
    null,
    -9,
    -3,
    9,
    -7,
    -4,
    null,
    6,
    null,
    -6,
    -6,
    null,
    null,
    0,
    6,
    5,
    null,
    9,
    null,
    null,
    -1,
    -4,
    null,
    null,
    null,
    -2
  ]);
  // print(Solution().diameterOfBinaryTree(node));
  print(Solution().diameterOfBinaryTree(node2));
  // List<int>? someNullArray = null;
  // print( (someNullArray?[0] ?? 0) + (someNullArray?[2] ?? 0) );
}
