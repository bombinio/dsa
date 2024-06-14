// Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.
// Input: head = [1,2,3,4,5], left = 2, right = 4
// Output: [1,4,3,2,5]

class Node {
    constructor(val) {
        this.val = val;
        this.next = null;
    }
}

const one = new Node(3);
const two = new Node(5);
// const three = new Node(3);
// const four = new Node(4);
// const five = new Node(5);

one.next = two;
// two.next = three;
// three.next = four;
// four.next = five;

// TODO

const reverseBetween = function(head, left, right) {
    let leftNode = head;
    for (let i = 1; i < left; i++) {
        leftNode = leftNode.next;
    }
    let rightBoundary = right - left;
    let rightNode = leftNode;
    for (let i = 0; i < rightBoundary; i++) {
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
    // fix this, we should use something other than head;
    let beforeLeftNode = head;
    for (let i = 1; i < left - 1; i++) {
        beforeLeftNode = beforeLeftNode.next;
    }
    beforeLeftNode.next = prev;
    //

    let finalCurr = beforeLeftNode;
    for (let i = 1; i < right; i++) {
        finalCurr = finalCurr.next;
    }
    finalCurr.next = rightBoundaryNode;

    // console.log(beforeLeftNode)
    // console.log('left: ', JSON.stringify(leftNode));
    // console.log('right: ', JSON.stringify(rightNode));
    return beforeLeftNode;
}

// console.log(JSON.stringify(reverseBetween(one, 2, 4)))
console.log(JSON.stringify(reverseBetween(one, 1, 2)))

