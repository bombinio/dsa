// Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].
//
// Example 1:
//
// Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
// Output: 32
// Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.

import 'package:dart/build_tree.dart';

// Algos
// 1) Use BST features to optimize solution -> if root.val < low then there is
// no sense to check left subTree, also if root.val > high -> then there is
// the same but with right subtree
// 2) return sum from each node => sum + (leftSubtreeSum - sum) + (rightSubtreeSum - sum)

// Key point: Use BST, if root.val < low => don't check left, if root.val > high =>
// don't check right;

class Solution {
  // int? rangeSumBST(TreeNode? root, int low, int high, [int sum = 0]) {
    // if (root == null) {
    //   return null;
    // }
    // if (root.val! >= low && root.val! <= high) {
    //   sum += root.val!;
    // }
    // int? leftSum;
    // int? rightSum;
    // if (root.val! > low) {
    //   leftSum = rangeSumBST(root.left, low, high, sum);
    // }
    // if (root.val! < high) {
    //   rightSum = rangeSumBST(root.right, low, high, sum);
    // }
    // int prevSum = sum;
    // if (leftSum != null) {
    //   sum += leftSum - prevSum;
    // }
    // if (rightSum != null) {
    //   sum += rightSum - prevSum;
    // }
    // return sum;

    // -------------

  int rangeSumBST(TreeNode? root, int low, int high) {
    if (root == null) {
      return 0;
    }
    int sum = 0;
    if (root.val! >= low && root.val! <= high) {
      sum += root.val!;
    }
    if (root.val! > low) {
      sum += rangeSumBST(root.left, low, high);
    }
    if (root.val! < high) {
      sum += rangeSumBST(root.right, low, high);
    }
    return sum;
  }
}

void main() {
  final node = buildTree([10,5,15,3,7,null,18]);
  print(Solution().rangeSumBST(node, 7, 15));
}