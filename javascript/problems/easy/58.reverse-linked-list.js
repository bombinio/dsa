// Given the head of a singly linked list, reverse the list, and return the reversed list.
//
//
//
// Example 1:
//
// Input: head = [1,2,3,4,5]
// Output: [5,4,3,2,1]

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
// 1) Use prev and curr pointers
// 2) Save next node in tmp variable;
// 3) Remove next link for current node and assign it to prev(currently null)
// 4) Nice, we just did small reverse, now we move 'prev' pointer to current node, now prev = curr
// 5) Now move 'curr' pointer to nextNode which we saved before
// 6) Now we repeat the same, we move 'prev' pointer every iteration and assign current Node's next to 'prev' pointer

// Key points: create 'prev' pointer and 'nextNode' pointer and 'curr' pointer and move them every iteration

const reverseList = function(head) {
    let prev = null;
    let curr = head;
    while (curr) {
        let nextNode = curr.next;
        curr.next = prev;

        prev = curr;
        curr = nextNode;
    }
    return prev;
};

console.log(JSON.stringify(reverseList(one)))