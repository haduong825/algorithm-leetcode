class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool checkEqual(TreeNode? left, TreeNode? right) {
    if ((left != null && right == null) || (left == null && right != null)) {
      return false;
    }
    if (left?.val != right?.val) {
      return false;
    }
    if (left?.left == null &&
        left?.right == null &&
        right?.left == null &&
        right?.right == null) {
      return true;
    } else {
      return checkEqual(left?.left, right?.left) &&
          checkEqual(left?.right, right?.right);
    }
  }

  bool checkMirror(TreeNode? left, TreeNode? right) {
    if ((left != null && right == null) || (left == null && right != null)) {
      return false;
    }
    if (left?.val != right?.val) {
      return false;
    }
    if (left?.left == null &&
        left?.right == null &&
        right?.left == null &&
        right?.right == null) {
      return true;
    } else {
      return checkMirror(left?.left, right?.right) &&
          checkMirror(left?.right, right?.left);
    }
  }

  bool isSymmetric(TreeNode? root) {
    var result = false;
    result = checkMirror(root?.left, root?.right);
    return result;
  }
}

void main(List<String> arguments) {
  final s = Solution();
  final result = s.isSymmetric(TreeNode(
      1,
      TreeNode(2, TreeNode(3), TreeNode(4)),
      TreeNode(2, TreeNode(4), TreeNode(3))));
      // final result = s.isSymmetric(TreeNode(
      // 1,
      // TreeNode(2, null, TreeNode(3)),
      // TreeNode(2, null, TreeNode(3))));
  // final result = s.isSymmetric(TreeNode(1));
  print(result);
}
