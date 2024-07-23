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

// Algos
// 1) Create extra variables: currSum, depth of node, parent node
// 2) If depth == 1 -> this node is child of main root node => then we increase
// currSum by current node value and main root value, also if depth is not 1, but
// bigger then 0(2,3,4...) we increase just by current value, and if none of them
// for example just tree with 1 node we increase it by current value node
// 3) Check if current sum is equal target and also current node is leaf node
// 4) Use recursion to check left branch and right


// Key points: Extra variables: currSum to track sum of nodes, depth and parent to
// add value of root node

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
