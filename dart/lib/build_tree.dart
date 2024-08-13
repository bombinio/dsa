class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(int? val) : val  = val ?? 0;
}

TreeNode? buildTree(List<int?> treeValues) {
  int? value = treeValues.removeAt(0);
  TreeNode root = TreeNode(value);

  List<TreeNode> nodes = [];
  nodes.add(root);

  while (treeValues.isNotEmpty) {
    TreeNode curr = nodes.removeAt(0);

    int? value = treeValues.removeAt(0);
    if (value != null) {
      curr.left = TreeNode(value);
      nodes.add(curr.left!);
    }

    if (treeValues.isNotEmpty) {
      int? value = treeValues.removeAt(0);
      if (value != null) {
        curr.right = TreeNode(value);
        nodes.add(curr.right!);
      }
    }
  }
  return root;
}

