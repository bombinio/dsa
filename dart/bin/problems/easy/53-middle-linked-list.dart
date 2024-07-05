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

class ListNode {
  final int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? middleNode(ListNode? head) {
    ListNode? slow = head;
    ListNode? fast = head;
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }
    return slow;
  }
}

void main() {
  ListNode one = ListNode(1);
  ListNode two = ListNode(2);
  ListNode three = ListNode(3);
  ListNode four = ListNode(4);
  one.next = two;
  two.next = three;
  three.next = four;
  four.next = null;
  print(Solution().middleNode(one));
}
