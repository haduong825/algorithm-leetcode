class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class AddTwoSolution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    var result = ListNode(0);
    var currentNode = result;
    var carry = 0;

    // result.next = currentNode;
    while (l1 != null || l2 != null || carry != 0) {
      final val1 = l1?.val ?? 0;
      final val2 = l2?.val ?? 0;
      final total = val1 + val2 + carry;
      carry = total ~/ 10;
      currentNode.next = ListNode(total % 10);
      currentNode = currentNode.next ?? ListNode();
      if (l1 != null) {
        l1 = l1.next;
      }
      if (l2 != null) {
        l2 = l2.next;
      }
    }
    return result.next;
  }
}

// 243
// 564
// 708