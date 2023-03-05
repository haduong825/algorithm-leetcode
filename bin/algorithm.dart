import 'package:algorithm/swap_node_pair.dart';

void main(List<String> arguments) {
  final s = SwapNodeInPair();
  final result = s.swapPairs(
      ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))));
  print(result);
}
