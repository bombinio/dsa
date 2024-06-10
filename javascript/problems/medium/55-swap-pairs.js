// Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)
//
//
//
// Example 1:
//
// Input: head = [1,2,3,4]
// Output: [2,1,4,3]

// TODO

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

one.next = two;
two.next = three;
three.next = four;


const swapPairs = function(head) {

}

console.log(JSON.stringify(swapPairs(one)));