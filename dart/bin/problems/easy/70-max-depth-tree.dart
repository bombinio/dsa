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

// Algos
// 1) Create base case for traversing => !root return counter
// 2) Increment counter every time we are on the next node
// 3) Get counter for root from left branch and from right, compare them to find where depth is bigger

// Key point: create additional variable counter, which will be returned from left and right branches

import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxDepth(TreeNode? root, [int counter = 0]) {
    if (root == null) {
      return counter;
    }
    counter++;
    int leftCounter = maxDepth(root.left, counter);
    int rightCounter = maxDepth(root.right, counter);
    return max(leftCounter, rightCounter);
  }
}

void main() {
  TreeNode three = TreeNode(3);
  TreeNode nine = TreeNode(20);
  TreeNode twenty = TreeNode(20);
  TreeNode seven = TreeNode(7);
  TreeNode fifteen = TreeNode(15);
  three.left = nine;
  three.right = twenty;
  twenty.left = fifteen;
  twenty.right = seven;
  print(Solution().maxDepth(three));
}