// Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.
// Input: head = [1,2,3,4,5], left = 2, right = 4
// Output: [1,4,3,2,5]

class Node {
    constructor(val) {
        this.val = val;
        this.next = null;
    }
}

const one = new Node(1);
const two = new Node(2);
const three = new Node(3);
const four = new Node(4);
const five = new Node(5);

one.next = two;
two.next = three;
three.next = four;
four.next = five;


// Algos
// 1) Use for loop to find left and right nodes
// 2) Reverse list in range [left:right] by comparing (while left !== right.next) or rightBoundaryNode;
// We use rightBoundaryNode because in loop we directly change head node so we have to save node reference before loop
// 3) Now if left === 1, it means we reverse list from the first node, so we can just do head === prev, if left > 1
// we saved before beforeLeftNode, which we can use now, beforeLeftNode.next = prev(reversed list) => now we have
// all correct left nodes and reversed list, now we have to connect right nodes
// 4) Use pointer to find rightNode in head and then do this => pointer.next = rightBoundaryNode, which we saved before

// Key points: Reverse list in range [left:right] and save nodes before left and after right, after all operations
// link before left nodes to reversed list and link nodes after right node

const reverseBetween = function (head, left, right) {
    let leftNode = head, rightNode = head;
    let beforeLeftNode = head;
    for (let i = 1; i < left; i++) {
        if (i < left - 1) {
            beforeLeftNode = beforeLeftNode.next;
        }
        leftNode = leftNode.next;
    }
    for (let i = 1; i < right; i++) {
        rightNode = rightNode.next;
    }
    let rightBoundaryNode = rightNode.next;
    let curr = leftNode;
    let prev = null;
    while (curr !== rightBoundaryNode) {
        let nextNode = curr.next;
        curr.next = prev;

        prev = curr;
        curr = nextNode;
    }
    if (left === 1) {
        head = prev
    } else {
        beforeLeftNode.next = prev;
    }
    let finalCurr = head;
    for (let i = 1; i < right; i++) {
        finalCurr = finalCurr.next;
    }
    finalCurr.next = rightBoundaryNode;
    return head;
}

console.log(JSON.stringify(reverseBetween(one, 2, 4)))
// console.log(JSON.stringify(reverseBetween(one, 1, 2)))
// console.log(JSON.stringify(reverseBetween(one, 3, 3)))

