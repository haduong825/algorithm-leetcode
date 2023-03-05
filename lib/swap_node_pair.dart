class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class SwapNodeInPair {
  ListNode? swapPairs(ListNode? head) {
    ListNode result = ListNode();
    var current = result;
    while (head != null) {
      if (head.next != null) {
        final tmp = ListNode(head.next?.val ?? 0, ListNode(head.val));
        current.next = tmp;
        current.next?.next = tmp.next;
        head = head.next?.next;
        current = current.next?.next ?? ListNode();
      } else {
        current.next = head;
        break;
      }
    }
    return result.next;
  }
}

void main(List<String> arguments) {
  final s = SwapNodeInPair();
  final result = s.swapPairs(
      ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))));
  print(result);
}
