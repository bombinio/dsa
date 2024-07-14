// Given the head of a singly linked list, reverse the list, and return the reversed list.

import 'dart:convert';

class ListNode {
  final int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev;
    ListNode? curr = head;
    while (curr != null) {
      ListNode? nextNode = curr.next;
      curr.next = prev;

      prev = curr;
      curr = nextNode;
    }
    return prev;
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
  print(Solution().reverseList(one));
}

