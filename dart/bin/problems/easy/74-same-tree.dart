class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

// Algos
// 1) Compare p.val and q.val, if they are not the same return false

// Key point: compare each nodes

class Solution {

  bool isSameTree(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) {
      return true;
    } else if ( (p == null && q != null) || (p != null && q == null) ) {
      return false;
    }
    if (p?.val != q?.val) {
      return false;
    }
    bool leftSubTrees = isSameTree(p?.left, q?.left);
    bool rightSubTrees = isSameTree(p?.right, q?.right);

    if (leftSubTrees == false || rightSubTrees == false) {
      return false;
    }
    return true;
  }
}
