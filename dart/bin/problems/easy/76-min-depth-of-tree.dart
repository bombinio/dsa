// Given a binary tree, find its minimum depth.
//
// The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
//
// Note: A leaf is a node with no children.
// Input: root = [3,9,20,null,null,15,7]
// Output: 2

import 'dart:math';

class TreeNode {
  int? val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

TreeNode? buildTree(List<int?> treeValues, [int index = 0]) {
  TreeNode? node;
  if (index < treeValues.length) {
    node = TreeNode(treeValues[index]);
    node.left = buildTree(treeValues, 2 * index + 1);
    node.right = buildTree(treeValues, 2 * index + 2);
  }

  return node;
}

// Algos
// 1) If root is null, return 0 and not null
// 2) if root is leaf node return depth
// 3) Check if both subTrees are not 0 and then return min. of them
// 4) otherwise just return left or right nodes if they are not 0

// Key points: return 0, instead of null

class Solution {
  int minDepth(TreeNode? root, [int depth = 1]) {
    if (root == null) {
      return 0;
    }
    if (root.left == null && root.right == null) {
      return depth;
    }

    int leftSubTree = minDepth(root.left, depth + 1);
    int rightSubTree = minDepth(root.right, depth + 1);

    if (leftSubTree != 0 && rightSubTree != 0) {
      return min(leftSubTree, rightSubTree);
    } else if (leftSubTree != 0) {
      return leftSubTree;
    } else if (rightSubTree != 0) {
      return rightSubTree;
    }
    return 0;
  }
}