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

// Algos
// 1) Create base case for traversing => !root return counter
// 2) Increment counter every time we are on the next node
// 3) Get counter for root from left branch and from right, compare them to find where depth is bigger

// Key point: create additional variable counter, which will be returned from left and right branches

const maxDepth = function(root, counter = 0) {
    if (!root) {
        return counter
    }
    counter++;
    const leftCounter = maxDepth(root.left, counter);
    const rightCounter = maxDepth(root.right, counter);
    return Math.max(leftCounter, rightCounter);
}

console.log(maxDepth(three));