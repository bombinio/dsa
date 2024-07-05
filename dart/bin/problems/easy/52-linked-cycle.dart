// Given head, the head of a linked list, determine if the linked list has a cycle in it.
//
// There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
//
// Return true if there is a cycle in the linked list. Otherwise, return false.

// Algos
// 1) Initialise slow and fast pointers
// 2) If slow pointer's value === fast pointer's value, then we have cycle in linked list
// 3) If fast pointer finished traversing successfully => we dont have cycle

// Key point: Use fast and slow pointers technique!

class ListNode {
  final int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class Solution {
  bool hasCycle(ListNode head) {
    ListNode slow = head;
    ListNode? fast = head;
    while (fast != null && fast.next != null) {
      slow = slow.next!;
      fast = fast.next?.next;
      if (slow == fast) {
        return true;
      }
    }
    return false;
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
  print(Solution().hasCycle(one));
}