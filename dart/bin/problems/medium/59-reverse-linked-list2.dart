// Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.
// Input: head = [1,2,3,4,5], left = 2, right = 4
// Output: [1,4,3,2,5]

class ListNode {
  final int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}
// Algos
// 1) Use for loop to find left and right nodes
// 2) Reverse list in range [left:right] by comparing (while left !== right.next) or rightBoundaryNode;
// We use rightBoundaryNode because in loop we directly change head node so we have to save node reference before loop
// 3) Now if left === 1, it means we reverse list from the first node, so we can just do head === prev, if left > 1
// we saved before beforeLeftNode, which we can use now, beforeLeftNode.next = prev(reversed list) => now we have
// all correct left nodes and reversed list, now we have to connect right nodes
// 4) Use pointer to find rightNode in head and then do this => pointer.next = rightBoundaryNode, which we saved before

// Key points: Reverse list in range [left:right] and save nodes before left and after right, after all operations
// link before left nodes to reversed list and link nodes after right node

class Solution {
  ListNode? reverseBetween(ListNode? head, int left, int right) {
    if (left == right) {
      return head;
    }
    ListNode? leftBoundary = head;
    ListNode? leftPrev;
    for (int i = 1; i < left; i++) {
      if (i == (left - 1)) {
        leftPrev = leftBoundary;
      }
      leftBoundary = leftBoundary?.next;
    }
    ListNode? rightBoundary = head;
    for (int i = 1; i < right; i++) {
      rightBoundary = rightBoundary?.next;
    }
    ListNode? rightBoundaryNode = rightBoundary?.next;
    ListNode? curr = leftBoundary;
    ListNode? prev;
    while (curr != rightBoundaryNode) {
      ListNode? nextNode = curr?.next;
      curr?.next = prev;

      prev = curr;
      curr = nextNode;
    }
    if (left == 1) {
      head = prev;
    } else {
      leftPrev?.next = prev;
    }
    ListNode? finalCurr = head;
    for (int i = 1; i < right; i++) {
      finalCurr = finalCurr?.next;
    }
    finalCurr?.next = rightBoundaryNode;
    return head;
  }
}

void main() {
  ListNode one = ListNode(1);
  ListNode two = ListNode(2);
  ListNode three = ListNode(3);
  ListNode four = ListNode(4);
  ListNode five = ListNode(5);
  one.next = two;
  two.next = three;
  three.next = four;
  four.next = five;
  print(Solution().reverseBetween(one, 2, 4));
}
