class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

// TODO make helper

class Solution {

  bool isSameTree(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) {
      return true;
    } else if ( (p == null && q != null) || (p != null && q == null) ) {
      return false;
    }
    if (p?.left?.val != q?.left?.val || p?.right?.val != q?.right?.val || p?.val != q?.val) {
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
