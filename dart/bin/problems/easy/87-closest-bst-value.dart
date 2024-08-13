// Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target. If there are multiple answers, print the smallest.
//
// Example 1:
//
// Input: root = [4,2,5,1,3], target = 3.714286
// Output: 4

// Algos
// 1) Use BST to not traverse whole tree
// 2) calculate diff at each node, if you are at leaf node => return minDiff
// that was found with corresponding value

// Key point: Use BST features to traverse only in right nodes and add 2 variables
// diff and closestVal, which saves minDiff found and what value had node with
// this value

import 'package:dart/build_tree.dart';

class Solution {
  int? closestValue(TreeNode? root, double target,
      [double? diff, int? closestVal]) {
    if (root == null) {
      return closestVal;
    }
    double currDiff = (root.val - target + 0.01).abs(); // add 0.01 for cases where target ends with .5 => 3.5 to return 3 not 4
    double minDiff = diff ?? currDiff;
    int minVal = closestVal ?? root.val;
    if (currDiff < ( diff ?? double.maxFinite) ) {
      minVal = root.val;
      minDiff = currDiff;
    }

    if (diff != null && root.left == null && root.right == null) {
      if (currDiff < diff) {
        return root.val;
      } else {
        return closestVal;
      }
    }
    int? result;
    if (target > root.val) {
      result = closestValue(root.right, target, minDiff, minVal);
    } else {
      result = closestValue(root.left, target, minDiff, minVal);
    }

    if (result != null) {
      return result;
    }
    return root.val;
  }
}

void main() {
  TreeNode? root = buildTree([4, 2, 5, 1, 3]);
  print(Solution().closestValue(root, 3.5));
}
