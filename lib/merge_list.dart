class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class MergeListSolution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    var result = ListNode();
    var current = result;
    while (list1 != null || list2 != null) {
      if (list1 == null && list2 != null) {
        current.next = list2;
        break;
      } else if (list2 == null && list1 != null) {
        current.next = list1;
        break;
      } else {
        final val1 = list1!.val;
        final val2 = list2!.val;

        if (val1 < val2) {
          current.next = list1;
          list1 = list1.next;
        } else {
          current.next = list2;
          list2 = list2.next;
        }
        current = current.next ?? ListNode(0);
      }
    }

    return result.next;
  }
}
