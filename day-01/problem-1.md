# Problem 1: Merge Strings Alternately

## Problem Statement
LeetCode 1768: You are given two strings `word1` and `word2`. Merge the strings by adding letters in alternating order, starting with `word1`. If a string is longer than the other, append the additional letters onto the end of the merged string.

Return the merged string.

## Examples

1. Input: word1 = "abc", word2 = "pqr"
   Output: "apbqcr"

2. Input: word1 = "ab", word2 = "pqrs"
   Output: "apbqrs"

3. Input: word1 = "abcd", word2 = "pq"
   Output: "apbqcd"

## Constraints

- 1 <= word1.length, word2.length <= 100
- word1 and word2 consist of lowercase English letters.

## My Solution

```dart
String mergeAlternately(String word1, String word2) {
  int firstWordLength = word1.length;
  int secondWordLength = word2.length;
  int maxLength = firstWordLength > secondWordLength ? firstWordLength : secondWordLength;
  String expectedString = "";
  int oddCount = 0;
  int evenCount = 0;
  for(int i=0; i<maxLength*2; i++){
    String firstWordChar = "";
    String secondWordChar = "";
    if(i%2 == 0){
        firstWordChar = evenCount<firstWordLength ? word1[evenCount] : "";
        evenCount++;
    }else {
        secondWordChar = oddCount<secondWordLength ? word2[oddCount] : "";
        oddCount++;
    }
    expectedString = "$expectedString$firstWordChar$secondWordChar";
  }
  return expectedString;
}
```

Execution Time: 396 microseconds

## Optimal Solution

```dart
String mergeAlternately(String word1, String word2) {
    int length1 = word1.length;
    int length2 = word2.length;
    int maxLength = length1 > length2 ? length1 : length2;
    StringBuffer result = StringBuffer();
    for (int i = 0; i < maxLength; i++) {
      if (i < length1) result.write(word1[i]);
      if (i < length2) result.write(word2[i]);
    }
    return result.toString();
}
```

Execution Time: 151 microseconds

## Analysis

### Time Complexity
Both solutions have O(n) time complexity, where n is the length of the longer string. However, the optimal solution is more efficient in practice.

### Space Complexity
Both solutions use O(n) extra space to store the result.

### Why is the optimal solution better?
1. **Use of StringBuffer**: The optimal solution uses `StringBuffer` instead of string concatenation. In Dart, `StringBuffer` is more efficient for building strings incrementally.
2. **Simplified Logic**: It eliminates the need for separate counters and conditional checks by using a single loop and direct index access.
3. **Conciseness**: The optimal solution is more concise and easier to read, which can lead to fewer bugs and easier maintenance.

### What did I learn? How can I improve?
1. Always consider using `StringBuffer` for string building operations in Dart, especially when dealing with loops.
2. Look for ways to simplify logic by leveraging the problem's structure. Here, the alternating nature of the merge allowed for a simpler loop structure.
3. Be mindful of the performance implications of string concatenation in loops.
4. Practice more problems involving string manipulation to become more familiar with efficient techniques.

## Related Concepts
- String manipulation
- Two-pointer technique (conceptually, although not directly applied here)
- Time and space complexity analysis