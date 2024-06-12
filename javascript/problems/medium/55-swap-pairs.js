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


// Algos
// 1) Create dummy, which points to head, and does not have value, it does not need value
// 2) Create prev variable which referred to dummy, we will use dummy in the end but prev for swapping pairs
// 3) Now create curr variable which points to head and launch 'while' loop with 'curr & curr.next' condition
// 4) For example prev node value is 0 and next is null, we have something like this:
// 0...1->2->3->4; we connect 0 to 2 => prev.next = curr.next, 0 and 1 have next '2'; now we connect 1 to 3 ->
// curr.next = prev.next.next => 0->2...1->3 now we need to link 2 and 1 by doing prev.next.next = curr => we link them
// 5) Currently we have this dummy node => 0->2->1->3->4 and pointers are: prev is 0, curr is 1, how to repeat algos for
// next pairs? We make curr node as previous and move current node to 3, now prev is 1 and curr is 3 and repeat same algos

// Key points: Create dummy node like '0' and prev node variable, use combo: prev.next = curr.next; curr.next=prev.next.next
// prev.next.next = curr;

const swapPairs = function(head) {
    if (!head || !head.next) {
        return head;
    }
    let dummy = {next: null, val: null};
    let curr = head;
    let prev = dummy;
    while(curr && curr.next) {
        prev.next = curr.next;
        curr.next = prev.next.next;
        prev.next.next = curr;

        prev = curr;
        curr = curr.next;
    }
    return dummy.next;
}

console.log(JSON.stringify(swapPairs(one)));