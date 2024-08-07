// Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.
//
// Example 1:
//
// Input: root = [4,2,6,1,3]
// Output: 1

import 'package:dart/build_tree.dart';

// TODO

class Solution {
  int getMinimumDifference(TreeNode? root) {

  }
}

void main () {
  TreeNode? root = buildTree([4,2,6,1,3]);
  print(Solution().getMinimumDifference(root));
}