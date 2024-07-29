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

// TODO write algos

class Solution {
  TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode? p, TreeNode? q) {
    if (root == null) {
      return null;
    }
    if (root.val == p!.val || root.val == q!.val) {
      return root;
    }
    TreeNode? leftTree =
        lowestCommonAncestor(root.left, p, q);
    TreeNode? rightTree =
        lowestCommonAncestor(root.right, p, q);
    if (leftTree != null && rightTree != null){
      return root;
    }
    if (leftTree != null) {
      return leftTree;
    } else if (rightTree != null) {
      return rightTree;
    }
    return null;
  }
}

void main() {
  final treeValues = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4];
  // final treeValues2 = [1,2];
  // final treeValues3 = [1,2,3,null,4];
  TreeNode? node = buildTree(treeValues);
  // TreeNode? node2 = buildTree(treeValues2);
  // TreeNode? node3 = buildTree(treeValues3);
 TreeNode? result =
      Solution().lowestCommonAncestor(node!, TreeNode(1), TreeNode(0));
  print(result?.val);
  // List<dynamic>? result2 = Solution().lowestCommonAncestor(node, TreeNode(5), TreeNode(4));
  // print(result2[1]?.val);
  // List<dynamic>? result3 = Solution().lowestCommonAncestor(node2!, TreeNode(1), TreeNode(2));
  // print(result3[1]?.val);
  // List<dynamic>? result4 = Solution().lowestCommonAncestor(node3!, TreeNode(4), TreeNode(3));
  // print(result4[1]?.val);
}
