// Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.
//
// A leaf is a node with no children.
//
//
//
// Example 1:
//
// Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
// Output: true
// Explanation: The root-to-leaf path with the target sum is shown.

function TreeNode(val, left, right) {
    this.val = val;
    this.left = left === undefined ? null : left;
    this.right = right === undefined ? null : right;
}

const nine = new TreeNode(9);
const fifteen = new TreeNode(15);
const seven = new TreeNode(7);

const twenty = new TreeNode(20, fifteen, seven);
const three = new TreeNode(3, nine, twenty);


// TODO

const hasPathSum = function(root, targetSum, tmpSum = 0, output = []) {
    if (!root) return 0;
    if (root) {
        tmpSum += root.val
    }
    output.push(tmpSum)
    hasPathSum(root.left, targetSum, tmpSum, output);
    hasPathSum(root.right, targetSum, tmpSum, output);
    return output.includes(targetSum);
}

console.log(hasPathSum(three, 12))
