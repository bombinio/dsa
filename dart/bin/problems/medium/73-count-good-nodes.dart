import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

// Algos
// 1) Initialise 3 not required variables => currMax(current max value that we met
// on the way to current node), counter(counter of good nodes), depth(depth to
// know when we are at the root node)
// 2) Create Base case -> root == null => return counter;
// 3) If root.val is bigger or equal then currMax we increase currMax and counter
// 4) We call this for left subtree and right subtree to search good nodes there too
// 5) In most cases we return => counter + (leftGoodNodes - counter) + (rightGoodNodes - counter)
// It calculates difference for example counter was 2 but left and right good nodes
// equal 3 it means in both sub tree was met number is bigger then currMax
// but we need to add only 1 from each sub tree so we do in formula above =>
// 2 + (3 - 2) + (3 - 2) = 4
// 6) When stack almost is empty and we returned to first call our depth is 0
// Now we return result of (left sub tree + right) but also -1, because we count
// main root 2 times

class Solution {
  int goodNodes(TreeNode? root, [int? currMax, int counter = 0, depth = 0]) {
    if (root == null) {
      return counter;
    }

    currMax ??= root.val;

    if (root.val >= currMax) {
      currMax = root.val;
      counter++;
    }
    int leftGoodNodes = goodNodes(root.left, currMax, counter, depth+1);
    int rightGoodNodes = goodNodes(root.right, currMax, counter, depth+1);

    if (depth == 0) {
      print(leftGoodNodes);
      print(rightGoodNodes);
      return (leftGoodNodes + rightGoodNodes) - 1;
    }

    return counter + (leftGoodNodes - counter) + (rightGoodNodes - counter) ;
  }
}

void main() {
  // TreeNode node1 = TreeNode(3);
  // TreeNode node2 = TreeNode(1);
  // TreeNode node3 = TreeNode(4);
  // TreeNode node4 = TreeNode(3);
  // TreeNode node5 = TreeNode(1);
  // TreeNode node6 = TreeNode(5);
  // node1.left = node2;
  // node1.right = node3;
  // node2.left = node4;
  // node3.left = node5;
  // node3.right = node6;
  // print(Solution().goodNodes(node1));

  // TreeNode node1 = TreeNode(3);
  // TreeNode node2 = TreeNode(3);
  // TreeNode node3 = TreeNode(4);
  // TreeNode node4 = TreeNode(2);
  // node1.left = node2;
  // node2.left = node3;
  // node2.right = node4;
  // print(Solution().goodNodes(node1));

  // TreeNode node1 = TreeNode(2);
  // TreeNode node2 = TreeNode(2);
  // TreeNode node3 = TreeNode(2);
  // node1.left = node2;
  // node2.left = node3;
  // print(Solution().goodNodes(node1));

  TreeNode node1 = TreeNode(2);
  TreeNode node2 = TreeNode(4);
  TreeNode node3 = TreeNode(10);
  TreeNode node4 = TreeNode(8);
  TreeNode node5 = TreeNode(4);
  node1.right = node2;
  node2.left = node3;
  node2.right = node4;
  node4.left = node5;
  print(Solution().goodNodes(node1));
}
