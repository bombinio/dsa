// In a linked list of size n, where n is even, the ith node (0-indexed) of the linked list is known as the twin of the (n-1-i)th node, if 0 <= i <= (n / 2) - 1.
//
//     For example, if n = 4, then node 0 is the twin of node 3, and node 1 is the twin of node 2. These are the only nodes with twins for n = 4.
//
// The twin sum is defined as the sum of a node and its twin.
//
// Given the head of a linked list with even length, return the maximum twin sum of the linked list

// Input: head = [5,4,2,1]
// Output: 6
// Explanation:
// Nodes 0 and 1 are the twins of nodes 3 and 2, respectively. All have twin sum = 6.
// There are no other nodes with twins in the linked list.
// Thus, the maximum twin sum of the linked list is 6.

import 'dart:math';

class ListNode {
  final int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}
// Algos
// 1) Using fast and slow pointer technique we are gonna to find middle of linked list
// 2) After we found middle(slow pointer) we can reverse linked list from [middle:end]
// 3) We reversed linked list now we can just find all twin sums ( i + n-1-i) for example head is 'i' and
// middle node is 'i-1-i'

// Key points: use slow-fast pointers and reverse linked list from middle

class Solution {
  int pairSum(ListNode? head) {
    if (head?.next?.next == null) {
      return head!.val + head.next!.val;
    }
    ListNode? slow = head;
    ListNode? fast = head;
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }
    ListNode? curr = slow;
    ListNode? prev2;
    while (curr != null) {
      ListNode? nextNode = curr.next;
      curr.next = prev2;

      prev2 = curr;
      curr = nextNode;
    }
    int sum = 0;
    while (head != slow){
      sum = max(sum, head!.val + prev2!.val);
      head = head.next;
      prev2 = prev2.next;
    }

    return sum;
  }
}

void main() {
  ListNode one = ListNode(5);
  ListNode two = ListNode(4);
  ListNode three = ListNode(2);
  ListNode four = ListNode(1);
  one.next = two;
  two.next = three;
  three.next = four;
  four.next = null;
  print(Solution().pairSum(one));
}
