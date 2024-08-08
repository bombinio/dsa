// Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.
//
// Example 1:
//
// Input: root = [4,2,6,1,3]
// Output: 1

import 'dart:math';

import 'package:dart/build_tree.dart';

// TODO

class Solution {
  int? getMinimumDifference(TreeNode? root) {
    List<int>? findMinDifference(TreeNode? node) {
      if (node == null) {
        return null;
      }

      if (node.left == null && node.right == null) {
        int difference = double.maxFinite.toInt();
        int maxValue = node.val!;
        int minValue = node.val!;
        return [node.val!, minValue, maxValue, difference];
      }

      List<int>? leftSubTree = findMinDifference(node.left);
      List<int>? rightSubTree = findMinDifference(node.right);

      int? minDifference;
      int? newMaxValue;
      int? newMinValue;
      if (leftSubTree != null) {
        int prevDifferenceMin = ((node.val! - leftSubTree[1]).abs());
        int prevDifferenceMax = ((node.val! - leftSubTree[2]).abs());
        int prevDifference = min(prevDifferenceMin, prevDifferenceMax);
        newMinValue = min(leftSubTree[1], node.val!);
        newMaxValue = max(leftSubTree[2], node.val!);
        minDifference = min(prevDifference, leftSubTree[3]);
      }
      if (rightSubTree != null) {
        int prevDifferenceMin = ((node.val! - rightSubTree[1]).abs());
        int prevDifferenceMax = ((node.val! - rightSubTree[2]).abs());
        int prevDifference = min(prevDifferenceMin, prevDifferenceMax);
        if (leftSubTree != null) {
          newMinValue = [newMinValue!, rightSubTree[1], node.val!].reduce(min);
          newMaxValue = [newMaxValue!, rightSubTree[2], node.val!].reduce(max);
          minDifference = [prevDifference, minDifference!, rightSubTree[3]].reduce(min);
        } else {
          newMinValue = min(rightSubTree[1], node.val!);
          newMaxValue = max(rightSubTree[2], node.val!);
          minDifference = min(prevDifference, rightSubTree[3]);
        }
      }
      if (minDifference != null) {
        print(node.val!);
        print('min is: $newMinValue');
        print('max is: $newMaxValue');
        print('diff is: $minDifference');
        return [node.val!, newMinValue!, newMaxValue!, minDifference];
      } else {
        return [node.val!, node.val!, node.val!, 0];
      }
    }

    List<dynamic>? valuesList = findMinDifference(root);
    return valuesList![3];
  }
}

void main () {
  TreeNode? root = buildTree([4,2,6,1,3]);
  print(Solution().getMinimumDifference(root));
}