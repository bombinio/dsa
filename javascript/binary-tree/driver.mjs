"use strict";

import Tree from "./index.mjs";

const prettyPrint = (node, prefix = "", isLeft = true) => {
    if (node === null) {
        return;
    }
    if (node.right !== null) {
        prettyPrint(node.right, `${prefix}${isLeft ? "│   " : "    "}`, false);
    }
    console.log(`${prefix}${isLeft ? "└── " : "┌── "}${node.data}`);
    if (node.left !== null) {
        prettyPrint(node.left, `${prefix}${isLeft ? "    " : "│   "}`, true);
    }
};

// test callback
function addFive(num){
    return num+0;
}

const tree = new Tree()

const arr = [50, 20, 10, 30, 70, 60, 80, 75, 100, 25, 15]

tree.root = tree.buildTree(arr)

console.log(tree.isBalanced()) // true

console.log('levelOrder: \n', tree.levelOrder(addFive))
console.log('preOrder: \n', tree.preOrder(addFive))
console.log('postOrder: \n', tree.postOrder(addFive))
console.log('inOrder: \n', tree.inOrder(addFive))

tree.insert(120) // to unbalance
tree.insert(150)

console.log(tree.isBalanced()) // false

prettyPrint(tree.root)

tree.rebalance()

prettyPrint(tree.root)

console.log(tree.isBalanced()) // true

console.log('levelOrder: \n', tree.levelOrder(addFive))
console.log('preOrder: \n', tree.preOrder(addFive))
console.log('postOrder: \n', tree.postOrder(addFive))
console.log('inOrder: \n', tree.inOrder(addFive))
