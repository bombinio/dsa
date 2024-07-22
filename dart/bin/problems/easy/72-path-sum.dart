// Given the root of a binary tree, return its maximum depth.
//
// A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//
//
// Example 1:
//
// Input: root = [3,9,20,null,null,15,7]
// Output: 3

import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

// somehow it solved
// TODO

class Solution {
  bool hasPathSum(TreeNode? root, targetSum, [int currSum = -1, int depth = 0, TreeNode? parent]) {
    if (root == null) {
      return false;
    } else {
      if (depth == 1) {
        currSum = 0;
        currSum += root.val;
        currSum += (parent?.val as int);
      } else if (depth != 0)  {
        currSum += root.val;
      } else if (root.left == null && root.right == null) {
        currSum = max(currSum, 0);
        currSum += root.val;
      }
    }
    if (currSum == targetSum && root.left == null && root.right == null) {
      return true;
    }
    bool leftHalf = hasPathSum(root.left, targetSum, currSum, depth + 1, root);
    bool rightHalf = hasPathSum(root.right, targetSum, currSum, depth + 1, root);
    if (leftHalf == true || rightHalf == true) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  TreeNode three = TreeNode(1);
  TreeNode nine = TreeNode(2);
  // TreeNode twenty = TreeNode(20);
  // TreeNode seven = TreeNode(7);
  // TreeNode fifteen = TreeNode(15);
  three.left = nine;
  // three.right = twenty;
  // twenty.left = fifteen;
  // twenty.right = seven;
  print(Solution().hasPathSum(three, 1));
}
