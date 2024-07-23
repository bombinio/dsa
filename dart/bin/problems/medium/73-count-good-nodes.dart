import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

// TODO

class Solution {
  int goodNodes(TreeNode? root, [int currMax = 0, int counter = 0]) {
    if (root == null) {
      return counter;
    }
    if (root.val >= currMax) {
      currMax = root.val;
      counter++;
    }
    int leftGoods = goodNodes(root.left, currMax, counter);
    int rightGoods = goodNodes(root.right, currMax, counter);
    return max(leftGoods, rightGoods);
  }
}

void main() {
  TreeNode node1 = TreeNode(3);
  TreeNode node2 = TreeNode(1);
  TreeNode node3 = TreeNode(4);
  TreeNode node4 = TreeNode(3);
  TreeNode node5 = TreeNode(1);
  TreeNode node6 = TreeNode(5);
  node1.left = node2;
  node1.right = node3;
  node2.left = node4;
  node3.left = node5;
  node3.right = node6;
  print(Solution().goodNodes(node1)); print(Solution().goodNodes(node1));

  // TreeNode node1 = TreeNode(3);
  // TreeNode node2 = TreeNode(3);
  // TreeNode node3 = TreeNode(4);
  // TreeNode node4 = TreeNode(2);
  // node1.left = node2;
  // node1.right = node3;
  // node2.left = node4;
  // node3.left = node5;
  // node3.right = node6;
  // print(Solution().goodNodes(node1)); print(Solution().goodNodes(node1));
}
