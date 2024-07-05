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

import 'dart:developer';

class ListNode {
  final int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode? curr = head;
    while (curr != null) {
      while (curr.next?.val == curr.val) {
        curr.next = curr.next?.next;
      }
      curr = curr.next;
    }
    inspect(head);

    return head;
  }
}

void main() {
  ListNode one = ListNode(1);
  ListNode two = ListNode(2);
  ListNode three = ListNode(2);
  ListNode four = ListNode(4);
  one.next = two;
  two.next = three;
  three.next = four;
  four.next = null;
  print(Solution().deleteDuplicates(one));
}
