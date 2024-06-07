// Given the head of a singly linked list, return the middle node of the linked list.
//
// If there are two middle nodes, return the second middle node.
//
//
//
// Example 1:
//
// Input: head = [1,2,3,4,5]
// Output: [3,4,5]
// Explanation: The middle node of the list is node 3.

// Algos
// 1) Use slow and fast pointers to traverse linked list
// 2) When fast pointer is null, slow pointer is in middle of list

// Key point
// 1) Use fast and slow pointers technique

const middleNode = function(head) {
    let slow = head;
    let fast = head;
    while(fast && fast.next) {
        slow = slow.next;
        fast = fast.next.next;
    }
    // const output = [];
    // while (slow) {
    //     output.push(slow.val);
    //     slow = slow.next;
    // }
    // return output;
    return slow;
}
