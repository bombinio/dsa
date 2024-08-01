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

import 'dart:collection';
import 'dart:math';

class TreeNode {
  int? val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

// TODO remake
TreeNode? buildTree(List<int?> treeValues) {
  int? value = treeValues.removeAt(0);
  TreeNode root = TreeNode(value);

  List<TreeNode> nodes = [];
  nodes.add(root);

  while (treeValues.isNotEmpty) {
    TreeNode curr = nodes.removeAt(0);

    int? value = treeValues.removeAt(0);
    if (value != null) {
      curr.left = TreeNode(value);
      nodes.add(curr.left!);
    }

    if (treeValues.isNotEmpty) {
      int? value = treeValues.removeAt(0);
      if (value != null) {
        curr.right = TreeNode(value);
        nodes.add(curr.right!);
      }
    }
  }
  return root;
}

// Algos
// 1) Make helper function with returns array of: current node value, minValue
// maxValue and difference, when leaf node was met
// 2) In ordinary nodes just compare results from leaf nodes and override
// values and pass this values in the tree
// 3) In main function return only difference value from result array

// Key point: write helper which returns minValue, maxValue, difference at each
// level in the tree

class Solution {
  int? maxAncestorDiff(TreeNode? root) {
    List<int>? findMaxDifference(TreeNode? node) {
      if (node == null) {
        return null;
      }

      if (node.left == null && node.right == null) {
        int difference = 0;
        int maxValue = node.val!;
        int minValue = node.val!;
        return [node.val!, minValue, maxValue, difference];
      }

      List<int>? leftSubTree = findMaxDifference(node.left);
      List<int>? rightSubTree = findMaxDifference(node.right);

      int? maxDifference;
      int? newMaxValue;
      int? newMinValue;
      if (leftSubTree != null) {
        int prevDifferenceMin = ((node.val! - leftSubTree[1]).abs());
        int prevDifferenceMax = ((node.val! - leftSubTree[2]).abs());
        int prevDifference = max(prevDifferenceMin, prevDifferenceMax);
        newMinValue = min(leftSubTree[1], node.val!);
        newMaxValue = max(leftSubTree[2], node.val!);
        maxDifference = max(prevDifference, leftSubTree[3]);
      }
      if (rightSubTree != null) {
        int prevDifferenceMin = ((node.val! - rightSubTree[1]).abs());
        int prevDifferenceMax = ((node.val! - rightSubTree[2]).abs());
        int prevDifference = max(prevDifferenceMin, prevDifferenceMax);
        if (leftSubTree != null) {
          newMinValue = [newMinValue!, rightSubTree[1], node.val!].reduce(min);
          newMaxValue = [newMaxValue!, rightSubTree[2], node.val!].reduce(max);
          maxDifference = [prevDifference, maxDifference!, rightSubTree[3]].reduce(max);
        } else {
          newMinValue = min(rightSubTree[1], node.val!);
          newMaxValue = max(rightSubTree[2], node.val!);
          maxDifference = max(prevDifference, rightSubTree[3]);
        }
      }
      if (maxDifference != null) {
        print(node.val!);
        print('min is: $newMinValue');
        print('max is: $newMaxValue');
        print('diff is: $maxDifference');
        return [node.val!, newMinValue!, newMaxValue!, maxDifference];
      } else {
        return [node.val!, node.val!, node.val!, 0];
      }
    }

    List<dynamic>? valuesList = findMaxDifference(root);
    return valuesList![3];
  }
}

void main() {
  // TreeNode? node = buildTree([1, null, 2, null, 0, 3]);
  TreeNode? node2 = buildTree([8, 3, 10, 1, 6, null, 14, null, null, 4, 7, 13]);
  TreeNode? node3 = buildTree([2,5,0,null,null,4,null,null,6,1,null,3]);

  // print(Solution().maxAncestorDiff(node));
  // print(Solution().maxAncestorDiff(node2));
  print(Solution().maxAncestorDiff(node3));
}
