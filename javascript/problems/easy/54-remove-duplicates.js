// Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
//
//
//
// Example 1:
//
// Input: head = [1,1,2]
// Output: [1,2]

// Algos
// 1) We know that linked list is sorted, so if we have duplicates we can just change head.next to head.next.next
// And do this until we wont have unique value

// Key point: replace head.next with head.next.next when found duplicate

const deleteDuplicates = function(head) {
    let pointer = head;

    while(pointer && pointer.next) {
        while(pointer.next && pointer.val === pointer.next.val) {
            if (pointer.next.next) {
                pointer.next = pointer.next.next;
            } else {
                pointer.next = null;
            }
        }
        pointer = pointer.next;
    }
    return head
}
