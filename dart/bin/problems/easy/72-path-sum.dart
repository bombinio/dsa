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


class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool hasPathSum(TreeNode? root, targetSum, [int currSum = 0]) {
    if (root == null) {
      return false;
    } else {
      currSum += root.val;
    }
    if (currSum == targetSum) {
      return true;
    }
    bool leftHalf = hasPathSum(root.left, targetSum, currSum);
    bool rightHalf = hasPathSum(root.right, targetSum, currSum);
    if (leftHalf == true || rightHalf == true) {
      return true;
    } else {
      return false;
    }
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
  print(Solution().hasPathSum(three, 38));

  // int someValue(int a, int b) {
  //   if (b == 100) {
  //     b += 100;
  //     print(b);
  //     return b;
  //   }
  //   if (a == 50) {
  //     return 20;
  //   }
  //   return someValue(30, 100);
  //   int bValue = someValue(50, 60);
  //   print (b);
  //   return b;
  // }
  // someValue(10, 10);
}