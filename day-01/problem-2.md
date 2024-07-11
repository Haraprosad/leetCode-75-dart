# 1071. Greatest Common Divisor of Strings

For two strings `s` and `t`, we say "`t` divides `s`" if and only if `s = t + ... + t` (i.e., `t` is concatenated with itself one or more times).

Given two strings `str1` and `str2`, return the largest string `x` such that `x` divides both `str1` and `str2`.

## Examples

### Example 1:

Input: str1 = "ABCABC", str2 = "ABC"
Output: "ABC"

### Example 2:

Input: str1 = "ABABAB", str2 = "ABAB"
Output: "AB"

### Example 3:

Input: str1 = "LEET", str2 = "CODE"
Output: ""

## Constraints:

- 1 <= str1.length, str2.length <= 1000
- str1 and str2 consist of English uppercase letters.

## Solutions

### 1. Euclidean Algorithm Approach

This approach uses the Euclidean algorithm to find the GCD of the lengths of the strings, then checks if the substring of that length is the GCD of the strings.

#### Complexity Analysis
- Time Complexity: O(n1 + n2), where n1 and n2 are the lengths of str1 and str2.
- Space Complexity: O(1)

```dart
String gcdOfStrings(String str1, String str2) {
  if (str1 + str2 != str2 + str1) return '';
  
  int a = str1.length;
  int b = str2.length;
  
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  
  return str1.substring(0, a);
}
```

### 2. Recursive Approach

This approach recursively reduces the problem by removing the shorter string from the beginning of the longer string until both strings are equal or no common divisor is found.

#### Complexity Analysis
- Time Complexity: Potentially higher due to repeated substring operations.
- Space Complexity: O(1) for the actual storage, but O(min(n1, n2)) for the call stack due to recursion.

```dart
String gcdOfStrings(String str1, String str2) {
  int n1 = str1.length;
  int n2 = str2.length;
  
  if (n1 < n2) {
    return gcdOfStrings(str2, str1);
  }
  
  if (str1 == str2) {
    return str1;
  }
  
  if (str1.startsWith(str2)) {
    return gcdOfStrings(str1.substring(n2), str2);
  }
  
  return '';
}
```

## Analysis

1. **Euclidean Algorithm Approach**:
   - More efficient due to fewer string operations.
   - Uses the mathematical principle that if a string is divisible by another, their lengths will also be divisible.
   - The initial check `str1 + str2 != str2 + str1` quickly eliminates cases where no common divisor exists.

2. **Recursive Approach**:
   - More intuitive and easier to understand at first glance.
   - May be less efficient for large strings due to repeated substring operations.
   - The base cases handle situations where strings are equal or no common divisor exists.

Both solutions correctly solve the problem, but the Euclidean Algorithm approach is generally more efficient, especially for larger strings. The recursive approach, while elegant, might face performance issues or stack overflow for very long strings due to the depth of recursion.