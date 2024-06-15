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
// const four = new Node(4);
// const five = new Node(5);

one.next = two;
two.next = three;
// three.next = four;
// four.next = five;

// TODO

const reverseBetween = function (head, left, right) {
    let leftNode = head;
    let rightNode = head;

    for (let i = 1; i < left; i++) {
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
    let beforeLeftNode = head;
    if (left > 1) {
        for (let i = 1; i < left-1; i++) {
            beforeLeftNode = beforeLeftNode.next;
        }
        beforeLeftNode.next = prev;
    } else {
        head = prev;
    }

    let finalCurr = head;
    for (let i = 1; i < right; i++) {
        finalCurr = finalCurr.next;
    }
    finalCurr.next = rightBoundaryNode;

    return head;
}

// console.log(JSON.stringify(reverseBetween(one, 2, 4)))
// console.log(JSON.stringify(reverseBetween(one, 1, 2)))
console.log(JSON.stringify(reverseBetween(one, 3, 3)))

