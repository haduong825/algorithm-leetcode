import 'dart:collection';

class LongestSubStringSolution {
  //Basic
  int lengthOfLongestSubstring(String s) {
    var longestLength = 0;
    for (int i = 0; i < s.length; i++) {
      var countSubStr = 1;
      var visited = s[i];
      for (int j = i + 1; j < s.length; j++) {
        if (s[i] != s[j] && !visited.contains(s[j])) {
          visited += s[j];
          countSubStr += 1;
        } else {
          break;
        }
      }
      if (countSubStr > longestLength) {
        longestLength = countSubStr;
      }
    }
    return longestLength;
  }

  // Sliding Window
  // int lengthOfLongestSubstring2(String s) {
  //   var res = 0;
  //   var left = 0;
  //   var right = 0;
  //   final Map<String, int> strMap = HashMap();
  //   while (right < s.length) {
  //     strMap++;
  //   }
  //   return res;
  // }
}


///aabcdeac