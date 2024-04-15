"use strict";

import mergeSort from "./merge.mjs";

class Node{
    constructor(data) {
        this.data = data
        this.right = null
        this.left = null
    }
}


export class Tree {
    constructor() {
        this.root = null;
    }

    buildTree(arr){
        arr = mergeSort(arr)

        return this.constructBalanced(arr, 0, arr.length-1)
    }

    constructBalanced(arr, start, end){
        if (start > end){
            return null;
        }

        const mid = Math.floor((start + end) / 2)

        const node = new Node(arr[mid])

        node.left = this.constructBalanced(arr, start, mid - 1)
        node.right = this.constructBalanced(arr, mid+1, end)

        return node
    }

    insert(value, node = this.root) {

        if (node === null) {
            return node = new Node(value)
        }
        if (node.data === value){
            return;
        }
        if (node.data > value){
            if(node.left !== null){
                return this.insert(value, node.left)
            }
            else {
                return node.left = new Node(value)
            }
        } else {
            if(node.right !== null){
                return this.insert(value, node.right)
            }
            else {
                return node.right = new Node(value)
            }
        }
    }
    findSmallest(node, parent){
        if (node.left === null && node.right === null){
            return [node.data, parent]
        }
        else if (node.left === null && node.right !== null){
            return [node.data, parent, node.right]
        }
        return this.findSmallest(node.left, node)
    }
    deleteItem(value, parent = this.root, node=this.root){
        if (node.data === value){
            if (node.data < parent.data){
                if (node.left !== null && node.right !== null) {
                    const [smallest, smallParent, nodeExist] = this.findSmallest(node.right, node)
                    if (nodeExist !== null){
                        node.data = smallest
                        return smallParent.right = nodeExist
                    }
                    node.data = smallest
                    return smallParent.right = null;
                }
                if(node.right !== null){
                    return parent.left = node.right
                }
                else if(node.left !== null){
                    return parent.left = node.left
                }
                return parent.left = null
            }
            else{
                if (node.left !== null && node.right !== null) {
                    const [smallest, smallParent, nodeExist] = this.findSmallest(node.right, node)
                    if (nodeExist !== null){
                        node.data = smallest
                        return smallParent.left = nodeExist
                    }
                    node.data = smallest
                    return smallParent.right = null;
                }
                if (node.right !== null){
                    return parent.right = node.right
                }
                else if (node.left !== null){
                    return parent.right = node.left
                }
                return parent.right = null
            }
        }
        if (node.data < value){
            return this.deleteItem(value, node, node.right)
        }
        else {
            return this.deleteItem(value, node, node.left)
        }

    }

    find(value, node=this.root){
        if (node.data === value){
            return node
        }
        if (node.data > value){
            if (node.left !== null){
                return this.find(value, node.left)
            }
        }
        else if(node.data < value){
            if(node.right !== null){
                return this.find(value, node.right)
            }
        }
        return null
    }

    levelOrder(callback, output = [], q = []){
        if (this.root === null) return;
        q.push(this.root)
        while(q.length > 0){
            for (let i = 0; i < q.length; i++) {
                const node = q.shift()
                node.data = callback(node.data)
                output.push(node.data)
                if (node.left !== null){
                    q.push(node.left)
                }
                if (node.right !== null){
                    q.push(node.right)
                }
            }
        }
        return output
    }
    inOrder(callback, node = this.root, output = []) {
        if (node === null){
            return null;
        }
        if (node.left !== null){
            this.inOrder(callback, node.left, output)
        }
        output.push(callback(node.data))
        if (node.right !== null){
            this.inOrder(callback, node.right, output)
        }
        return output
    }
    preOrder(callback, node = this.root, output = []){
        if (node === null){
            return null
        }
        output.push(callback(node.data))
        if (node.left !== null){
            this.preOrder(callback, node.left, output)
        }
        if (node.right !== null){
            this.preOrder(callback, node.right, output)
        }
        return output
    }
    postOrder(callback, node = this.root, output = []){
        if (node === null){
            return null;
        }
        if (node.left !== null){
            this.postOrder(callback, node.left, output)
        }
        if (node.right !== null){
            this.postOrder(callback, node.right, output)
        }
        output.push(callback(node.data))
        return output
    }

    height(node){
        if (node === null) {
            return -1
        }
        return Math.max(this.height(node.left), this.height(node.right) + 1)
    }

    depth(target, curr = this.root, counter=0){
        if (curr === null ){
            return -1;
        }
        if (curr.data === target) {
            return counter;
        }
        if (target < curr.data){
            return this.depth(target, curr.left, counter+1)
        }
        if (target > curr.data){
            return this.depth(target, curr.right, counter+1)
        }
    }

    isBalanced(){
        const leftSide = this.height(this.root.left)
        const rightSide = this.height(this.root.right)

        if (leftSide > rightSide && leftSide - rightSide > 1){
            return false
        }
        else if (leftSide < rightSide && rightSide - leftSide > 1){
            return false
        }
        return true
    }

    rebalance(){
        const newArr = this.inOrder(addFive)
        this.root = this.buildTree(newArr)
    }


}

// callback
function addFive(num){
    return num+0;
}

export default Tree
