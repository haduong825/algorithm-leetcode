class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class MergeKListSolution {
  int? findMinNode(List<ListNode?> lists) {
    int? result;
    if (lists.isEmpty) {
      return null;
    }
    var node = lists[0];
    if (node != null) {
      result = 0;
    }
    for (var i = 1; i < lists.length; i++) {
      if (lists[i] == null) {
        continue;
      }
      if (lists[i]!.val < (node?.val ?? 0) || node == null) {
        node = lists[i];
        result = i;
      }
    }
    return result;
  }

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

  ListNode? mergeKLists(List<ListNode?> lists) {
    var result = ListNode();
    if (lists.isEmpty) {
      return null;
    }
    var current = lists[0];
    for (int i = 1; i < lists.length; i++) {
      current = mergeTwoLists(current, lists[i]);
    }
    // while (findMinNode(lists) != null) {
    //   final minIterator = findMinNode(lists);
    //   current.next = lists[minIterator!];
    //   lists[minIterator] = lists[minIterator]?.next;
    //   current = current.next ?? ListNode(0);
    // }
    return current;
  }
}
