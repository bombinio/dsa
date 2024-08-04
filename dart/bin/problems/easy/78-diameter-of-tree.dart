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

// Algos
// 1) Create helper with additional parameter => depth
// 2) Helper has to return list of diameter for current subTree and maxDepth
// for current node, for example node has leftSubTree with leaf node on depth 4
// and rightSubTree with leaf node on depth 3, it will return 4
// 3) calculate diameter for each subTree => maxDepth for leftSubTree + maxDepth
// for rightSubTree and minus (curr node depth * 2) because depth starts from 0
// from main root, but some subTrees has bigger diameter then main root node
// so we have to calculate diameter for every node in tree with depth 2, 3, 4...

// Key point: make helper with returns list of diameter and maxDepth
// diameter = (maxDepth of node.left + maxDepth of node.right) - (node.depth * 2)

class Solution {
  int? diameterOfBinaryTree(TreeNode? root) {
    List<int>? helper(TreeNode? node, [int depth = 0]) {
      if (node == null) {
        return null;
      }
      if (node.left == null && node.right == null) {
        int diameter = depth;
        int maxDepth = depth;
        return [diameter, maxDepth];
      }
      List<int>? leftMax = helper(node.left, depth + 1);
      List<int>? rightMax = helper(node.right, depth + 1);

      int diameter = ( (leftMax?[1] ?? 0) + (rightMax?[1] ?? 0) )  - (depth * 2);
      int maxDepth = depth;
      if (leftMax != null) {
        maxDepth = max(maxDepth, leftMax[1]);
        diameter = max(diameter, leftMax[0]);
      }
      if (rightMax != null) {
        maxDepth = max(maxDepth, rightMax[1]);
        diameter = max(diameter, rightMax[0]);
      }

      return [diameter, maxDepth];
    }

    List<int>? result = helper(root);
    return result![0];
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
