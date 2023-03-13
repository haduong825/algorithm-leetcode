class Solution {
  int firstMissingPositive(List<int> nums) {
    final posNums = nums.where((element) => element > 0).toList();
    posNums.sort();
    if (posNums.isEmpty || posNums[0] > 1) {
      return 1;
    }
    if (posNums.length == 1) {
      return posNums[0] + 1;
    }
    for (var i = 0; i < posNums.length; i++) {
      if (i == posNums.length - 1) {
        return posNums.last + 1;
      }
      if (posNums[i + 1] - posNums[i] > 1) {
        return posNums[i] + 1;
      }
    }
    return 0;
  }
}

void main(List<String> arguments) {
  final s = Solution();
  // final result = s.fourSum([1,0,-1,0,-2,2], 0);
  final result = s.firstMissingPositive([2]);
  // final result = s.fourSum([2, 2, 2, 2, 2], 8);
  // final result = s.fourSum([-3,-1,0,2,4,5], 1);
  // final result = s.fourSum([-5, -4, -3, -2, -1, 0, 0, 1, 2, 3, 4, 5], 0);
  print(result);
}
