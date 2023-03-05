class ThreeSumSolution {
  List<List<int>> threeSumStupid(List<int> nums) {
    var result = List<List<int>>.empty(growable: true); //[<int>[]];
    final countZero = nums.where((element) => element == 0).length;
    if (countZero >= 3) {
      result.add([0, 0, 0]);
    }

    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (i == j) {
          continue;
        }
        //Add more result
        for (int k = 0; k < nums.length; k++) {
          if (k == i || k == j) {
            continue;
          }
          if ((nums[i] + nums[j] + nums[k] == 0)) {
            //Check duplicate
            var isExist = false;
            for (int h = 0; h < result.length; h++) {
              if (result[h].contains(nums[i]) &&
                  result[h].contains(nums[j]) &&
                  result[h].contains(nums[k])) {
                isExist = true;
                break;
              }
            }
            if (isExist) {
              break;
            }
            result.add([nums[i], nums[j], nums[k]]);
          }
        }
      }
    }
    return result;
  }

  List<List<int>> threeSum(List<int> nums) {
    var result = List<List<int>>.empty(growable: true);
    nums.sort();

    for (int i = 0; i < nums.length; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) {
        continue;
      }
      var l = i + 1;
      var r = nums.length - 1;
      while (l < r) {
        final sum = nums[i] + nums[l] + nums[r];
        if (sum < 0) {
          l++;
        } else if (sum > 0) {
          r--;
        } else {
          result.add([nums[l], nums[i], nums[r]]);
          l++;
          while (nums[l] == nums[l - 1] && l < r) {
            l++;
          }
        }
      }
    }
    return result;
  }
}
