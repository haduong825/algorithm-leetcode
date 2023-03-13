class Solution {
  int maxScore(List<int> nums) {
    int result = 0;
    nums.sort(((a, b) => b.compareTo(a)));
    int tmp = 0;
    for (var i = 0; i < nums.length; i++) {
      tmp += nums[i];
      if (tmp > 0) {
        result++;
      } else {
        return i;
      }
    }
    return result;
  }
}

void main(List<String> arguments) {
  final s = Solution();
  final result = s.maxScore([2, -1, 0, 1, -3, 3, -3]);
  // final result = s.maxScore([
  //   -687767,
  //   -860350,
  //   950296,
  //   52109,
  //   510127,
  //   545329,
  //   -291223,
  //   -966728,
  //   852403,
  //   828596,
  //   456730,
  //   -483632,
  //   -529386,
  //   356766,
  //   147293,
  //   572374,
  //   243605,
  //   931468,
  //   641668,
  //   494446
  // ]);
  print(result);
}
