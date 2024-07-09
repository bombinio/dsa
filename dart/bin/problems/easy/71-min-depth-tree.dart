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
// 1) Return 1, only if current node is leaf
// 2) Return 0, if node is null
// 3) compare in end if node is 0, then assign him value of his neighbour
// 4) return min. value from left and right nodes and increment it by one(like in every tree)

// Key point: return value only if we are at the leaf node and give null node value of 0,
// in the end compare nodes with 0, if one of the nodes is 0, assign him value of neighbour
import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int minDepth(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    if (root.left == null && root.right == null) {
      return 1;
    }
    int leftCounter = minDepth(root.left);
    int rightCounter = minDepth(root.right);

    leftCounter == 0 ? rightCounter : leftCounter;
    rightCounter == 0 ? leftCounter : rightCounter;

    return min(leftCounter, rightCounter) + 1;
  }
}

void main() {
  TreeNode three = TreeNode(3);
  TreeNode nine = TreeNode(9);
  TreeNode twenty = TreeNode(20);
  TreeNode seven = TreeNode(7);
  TreeNode fifteen = TreeNode(15);
  three.left = nine;
  three.right = twenty;
  twenty.left = fifteen;
  twenty.right = seven;
  print(Solution().minDepth(three));
}
