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

const five = new TreeNode(5);

const four = new TreeNode(4, null, five);
const three = new TreeNode(3, null, four);

// Algos
// TODO

// Key point:  TODO

const minDepth = function (root, counter = 0) {
    if (!root) return 0

    if (root && (!root.left && !root.right) ) {
        return counter + 1
    }

    counter++;

    let leftCounter = minDepth(root.left, counter);
    let rightCounter = minDepth(root.right, counter);

    leftCounter = leftCounter === 0 ? 50000 : leftCounter;
    rightCounter = rightCounter === 0 ? 50000 : rightCounter;
    return Math.min(leftCounter, rightCounter);
}

console.log(minDepth(three));
