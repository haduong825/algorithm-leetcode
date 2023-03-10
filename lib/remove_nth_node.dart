class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    var result = ListNode();
    var currentNode = result;
    var current = head;
    var count = 0;
    while (current != null) {
      count++;
      current = current.next;
    }
    for (var i = 0; i < count; i++) {
      if (head == null) {
        break;
      }

      if (i == count - n) {
        currentNode.next = head.next;
        head = head.next?.next;
      } else {
        currentNode.next = head;
        head = head.next;
      }

      currentNode = currentNode.next ?? ListNode();
    }
    return result.next;
  }
}

void main(List<String> arguments) {
  final s = Solution();
  // final result = s.removeNthFromEnd(
  //     ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), 3);
  // final result = s.removeNthFromEnd(ListNode(1), 1);
  final result = s.removeNthFromEnd(
      ListNode(1, ListNode(2)), 1);
  print(result);
}
