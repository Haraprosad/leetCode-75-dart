void main() {
  DateTime now = DateTime.now();
  print(gcdOfStrings('ABCABC', 'ABC'));
  print(gcdOfStrings('ABABAB', 'ABAB'));
  print(gcdOfStrings('LEET', 'CODE'));
  print('Time taken: ${DateTime.now().difference(now).inMicroseconds}µs');
}

String gcdOfStrings(String str1, String str2) {
 // If str1 + str2 != str2 + str1, there's no valid GCD
  if (str1 + str2 != str2 + str1) return '';
  
  // Use Euclidean algorithm on the lengths
  int a = str1.length;
  int b = str2.length;
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  
  // Return the substring of length a (which is the GCD of the lengths)
  return str1.substring(0, a);
}
