import 'dart:math';

class ThreeSumClosestSolution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    int minDistance = 9999;
    int result = 0;
    if ((nums[0] >= target && target > 0) || nums.length == 3) {
      return nums[0] + nums[1] + nums[2];
    }
    for (int i = 0; i < nums.length; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) {
        continue;
      }
      var l = i + 1;
      var r = nums.length - 1;
      while (l < r) {
        final total = nums[l] + nums[i] + nums[r];
        print("total $total");
        final tmpDis = (target - total).abs();
        if (tmpDis > minDistance) {
          if (total - target < 0) {
            l++;
          } else if (total - target > 0) {
            r--;
          } else {
            return total;
          }
        } else if (tmpDis <= minDistance) {
          if (total - target < 0) {
            l++;
          } else if (total - target > 0) {
            r--;
          } else {
            return total;
          }
          minDistance = tmpDis;
          result = total;
        }
      }
    }
    return result;
  }
}
