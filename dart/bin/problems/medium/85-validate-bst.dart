// Given the root of a binary tree, determine if it is a valid binary search tree (BST).
//
// A valid BST is defined as follows:
//
//     The left
//     subtree
//     of a node contains only nodes with keys less than the node's key.
//     The right subtree of a node contains only nodes with keys greater than the node's key.
//     Both the left and right subtrees must also be binary search trees.
//
// Example 1:
//
// Input: root = [2,1,3]
// Output: true

import 'package:dart/build_tree.dart';

// Algos
// 1) Use in order traversal and return array of node values
// 2) check if array[i-1] is bigger or equal array[i] if yes return false;

// Key point: return array of node values with in-order traversal, then check
// if array[i-1] is bigger or equal array[i] if yes return false;

class Solution {
  bool isValidBST(TreeNode? root) {
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

    List<int?>? output = dfs(root);
    for (int i = 0; i < output!.length; i++) {
      if (i > 0) {
        if (output[i]! <= output[i - 1]!) {
          return false;
        }
      }
    }
    return true;
  }
}
