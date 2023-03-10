class FourSumSolution {
  List<List<int>> fourSum(List<int> nums, int target) {
    var result = List<List<int>>.empty(growable: true);
    nums.sort();
    for (var i = 0; i < nums.length - 3; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) {
        continue;
      }
      for (var j = i + 1; j < nums.length - 2; j++) {
        if (j > i + 1 && nums[j] == nums[j - 1]) {
          continue;
        }
        for (var k = nums.length - 1; k > j; k--) {
          if (k < nums.length - 1 && nums[k] == nums[k + 1]) {
            continue;
          }
          final totalThree = nums[i] + nums[j] + nums[k];
          if (totalThree > target) {
            for (var h = k - 1; h > j; h--) {
              if (h < k - 1 && nums[h] == nums[h + 1]) {
                continue;
              }
              final total = nums[i] + nums[j] + nums[k] + nums[h];
              if (total == target) {
                result.add([nums[i], nums[j], nums[k], nums[h]]);
                break;
              } else if (total < target) {
                break;
              }
            }
          } else if (totalThree == target) {
            if ((j + 1 < k - 1 &&
                    nums.sublist(j + 1, k).contains(
                        0) /*(nums[j + 1] == 0 || nums[k - 1] == 0)*/) ||
                ((j + 1 == k - 1) && nums[j + 1] == 0)) {
              result.add([nums[i], nums[j], nums[k], 0]);
            }
          } else {
            for (var h = j + 1; h < k; h++) {
              if (h > j + 1 && nums[h] == nums[h - 1]) {
                continue;
              }
              final total = nums[i] + nums[j] + nums[k] + nums[h];
              if (total == target) {
                result.add([nums[i], nums[j], nums[k], nums[h]]);
                break;
              } else if (total > target) {
                break;
              }
            }
          }
        }
      }
    }
    return result;
  }
}

void main(List<String> arguments) {
  final s = FourSumSolution();
  // final result = s.fourSum([1,0,-1,0,-2,2], 0);
  final result = s.fourSum([-1, 0, -5, -2, -2, -4, 0, 1, -2], -9);
  // final result = s.fourSum([2, 2, 2, 2, 2], 8);
  // final result = s.fourSum([-3,-1,0,2,4,5], 1);
  // final result = s.fourSum([-5, -4, -3, -2, -1, 0, 0, 1, 2, 3, 4, 5], 0);
  print(result);
}
