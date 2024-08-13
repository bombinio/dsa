// You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
//
// Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
//
// Example 1:
//
// Input: root = [4,2,7,1,3], val = 5
// Output: [4,2,7,1,3,5]

import 'package:dart/build_tree.dart';

// Algos
// 1) As we know that tree is BST, search in tree root which will have
// node with target value by checking if 'val' is > or < then current root value
// 2) When root == null => we create node with value 'val' and then as we saved
// parent node before in 'parent' we can assign this new node to parent

// Key point: use bst to find 'parent' node for future node with value 'val'
// if root == null => create and assign this node to parent

class Solution {
  TreeNode? insertIntoBST(TreeNode? root, int val, [TreeNode? parent]) {
    if (root == null && parent == null) {
      return TreeNode(val);
    }
    if (root == null) {
      root = TreeNode(val);
      if (val > parent!.val) {
        parent.right = root;
      } else {
        parent.left = root;
      }
      return null;
    }

    if (val > root.val) {
      insertIntoBST(root.right, val, root);
    } else {
      insertIntoBST(root.left, val, root);
    }

    return root;
  }
}

void main() {
  TreeNode? root = buildTree([40,20,60,10, 30,50,70]);

  TreeNode? result = Solution().insertIntoBST(root, 25);

}
