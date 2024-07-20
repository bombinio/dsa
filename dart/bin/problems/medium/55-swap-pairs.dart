// Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)
//
//
//
// Example 1:
//
// Input: head = [1,2,3,4]
// Output: [2,1,4,3]

class ListNode {
  final int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null || head.next == null) {
      return head;
    }
    ListNode? curr = head;
    ListNode? prev = ListNode(0);
    ListNode? dummy = prev;
    while (curr != null && curr.next != null) {
      ListNode? nextNode = curr.next?.next;
      prev?.next = curr.next;
      prev?.next?.next = curr;

      curr.next = nextNode;

      prev = curr;
      curr = nextNode;
    }
    return dummy.next;
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
  print(Solution().swapPairs(one));
}