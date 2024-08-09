// Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.
//
// Example 1:
//
// Input: root = [4,2,6,1,3]
// Output: 1

import 'dart:math';

import 'package:dart/build_tree.dart';

// Algos
// 1) Use in order traversal and return array of node values
// 2) Find min difference in this array

// Key point: return array of node values with in-order traversal, then find
// min difference

class Solution {
  int? getMinimumDifference(TreeNode? root) {
    List<int?>? dfs(TreeNode? node) {
      if (node == null) {
        return null;
      }
      List<int?>? output = [];
      if (node.left == null && node.right == null) {
        return [node.val];
      }
      output = output + (dfs(node.left) ?? []);
      output.add(node.val);
      output = output + (dfs(node.right) ?? []);
      return output;
    }
    int minValue = double.maxFinite.toInt();
    List<int?>? output = dfs(root);
    for (int i = 0; i < output!.length; i++) {
      if (i > 0) {
        int diff = output[i]! - output[i-1]!;
        minValue = min(minValue, diff);
      }
    }
    return minValue;
  }
}

void main () {
  TreeNode? root = buildTree([1,null, 3, 2]);
  print(Solution().getMinimumDifference(root));
}