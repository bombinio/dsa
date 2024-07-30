// Given the root of a binary tree, find the maximum value v for which there exist different nodes a and b where v = |a.val - b.val| and a is an ancestor of b.
//
// A node a is an ancestor of b if either: any child of a is equal to b or any child of a is an ancestor of b.
//
//
//
// Example 1:
//
// Input: root = [8,3,10,1,6,null,14,null,null,4,7,13]
// Output: 7
// Explanation: We have various ancestor-node differences, some of which are given below :
// |8 - 3| = 5
// |3 - 7| = 4
// |8 - 1| = 7
// |10 - 13| = 3
// Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.

import 'dart:math';

class TreeNode {
  int? val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

// TODO remake
TreeNode? buildTree(List<int?> treeValues, [int index = 0]) {
  TreeNode? node;
  if (index < treeValues.length) {
    node = TreeNode(treeValues[index]);
    node.left = buildTree(treeValues, 2 * index + 1);
    node.right = buildTree(treeValues, 2 * index + 2);
  }

  return node;
}

// TODO

class Solution {
  int? maxAncestorDiff(TreeNode? root) {
    List<int>? findMinValue(TreeNode? node) {
      if (node == null) {
        return null;
      }

      if (node.left == null && node.right == null) {
        int difference = 0;
        int maxValue = node.val!;
        return [node.val!, maxValue, difference];
      }

      List<int>? leftSubTree = findMinValue(node.left);
      List<int>? rightSubTree = findMinValue(node.right);

      int? maxDifference;
      int? newMaxValue;
      if (leftSubTree != null) {
        int prevDifference = ((node.val! - leftSubTree[1]).abs());
        newMaxValue = max(leftSubTree[1], node.val!);
        maxDifference = max(prevDifference, leftSubTree[2]);
      }
      if (rightSubTree != null) {
        int prevDifference = ((node.val! - rightSubTree[1]).abs());
        newMaxValue = max(rightSubTree[1], node.val!);
        if (leftSubTree != null) {
          prevDifference = max(maxDifference!, prevDifference);
        }
        maxDifference = max(prevDifference, rightSubTree[2]);
      }
      if (maxDifference != null) {
        return [node.val!, newMaxValue!, maxDifference];
      } else {
        return [node.val!, node.val!, 0];
      }
    }
    List<dynamic>? valuesList = findMinValue(root);
    return valuesList![2];
  }
}

void main() {
  TreeNode? node = buildTree([1,null,2,null,0,3]);

  // print(Solution().maxAncestorDiff(node));
}