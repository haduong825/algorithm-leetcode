class Solution {
  int vowelStrings(List<String> words, int left, int right) {
    var result = 0;
    final vowel = ['a', 'e', 'i', 'o', 'u'];
    var checked = List<String>.empty(growable: true);
    for (int i = left; i <= right; i++) {
      if (checked.contains(words[i])) {
        result++;
        continue;
      }
      final first = words[i][0];
      final last = words[i][words[i].length - 1];
      if (vowel.contains(first) && vowel.contains(last)) {
        result++;
      }
    }
    return result;
  }
}

void main(List<String> arguments) {
  final s = Solution();
  final result = s.vowelStrings(["are", "amy", "u", "are", "amy", "u"], 0, 5);
  // final result = s.vowelStrings(["hey", "aeo", "mu", "ooo", "artro"], 1, 4);
  print(result);
}
