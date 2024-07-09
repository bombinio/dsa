// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

// Algos
// 1) Use queue DS
// 2) Save current length of Q in variable, e.g qLength;
// 3) in range [0...qLength] run loop and remove first element from queue
// if node is not null, add this root's val to 'level' array and check if
// left and right nodes are null, if not add them to queue and continue algos

// Key point: use queue and save queue length at every iteration

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    if (root == null) {
      return [];
    }
    final queue = [];
    final List<List<int>> output = [];
    queue.add(root);
    while (queue.isNotEmpty) {
      final level = <int>[];
      int currQLength = queue.length;
      for (int i = 0; i < currQLength; i++) {
        final node = queue.removeAt(0);
        if (node != null) {
          level.add(node.val);
        }
        if (node?.left != null) {
          queue.add(node.left);
        }
        if (node?.right != null) {
          queue.add(node.right);
        }
      }
      output.add(level);
    }
    return output;
  }
}
