// Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.
// Input: head = [1,2,3,4,5], left = 2, right = 4
// Output: [1,4,3,2,5]

class ListNode {
  final int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

// TODO
class Solution {
  ListNode? reverseBetween(ListNode? head, int left, int right) {
    if (left == right) {
      return head;
    }
    ListNode? leftBoundary = head;
    ListNode? leftPrev;
    for (int i = 0; i < left - 1; i++) {
      if (i == (left - 1) - 1) {
        leftPrev = leftBoundary;
      }
      leftBoundary = leftBoundary?.next;
    }
    ListNode? rightBoundary = head;
    for (int i = 0; i < right; i++) {
      rightBoundary = rightBoundary?.next;
    }

    ListNode? curr = leftBoundary;
    ListNode? prev;
    while (curr != rightBoundary) {
      ListNode? nextNode = curr?.next;
      curr?.next = prev;

      prev = curr;
      curr = nextNode;
    }
    if (left == 1) {
      head = prev;
    }
    ListNode? finalCurr = head;
    leftPrev ??= leftBoundary;
    while (finalCurr != leftPrev) {
      finalCurr = finalCurr?.next;
    }
    finalCurr?.next = prev;
    for (int i = 1; i < right; i++) {
      finalCurr = finalCurr?.next;
    }
    finalCurr?.next = rightBoundary;
    return head;
  }
}

void main() {
  ListNode one = ListNode(1);
  ListNode two = ListNode(2);
  // ListNode three = ListNode(3);
  // ListNode four = ListNode(4);
  // ListNode five = ListNode(5);
  one.next = two;
  // two.next = three;
  // three.next = four;
  // four.next = five;
  print(Solution().reverseBetween(one, 1, 2));
}
