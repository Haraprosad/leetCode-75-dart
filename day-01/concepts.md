# Day 01 Concepts

## 1. Two Pointers

The Two Pointers technique is a common approach used in solving problems involving arrays or strings, particularly when searching for pairs or subarrays with specific properties.

### Where applicable:
- Problems involving arrays or strings
- Searching for pairs or subarrays with specific properties

### Step-by-Step Process:
1. **Understand the Problem:**
   - Identify if the problem can be solved using the two-pointer technique.
   - Determine what conditions or properties you're looking for.

2. **Determine the Pointer Initialization:**
   - Decide the initial positions of the two pointers.
   - Typically, start one pointer at the beginning (left) and the other at the end (right) of the array.

3. **Define the Loop Condition:**
   - Set up a loop that continues as long as the two pointers do not cross each other.
   - For example: `while (left < right)`

4. **Process the Elements at the Pointers:**
   - Within the loop, evaluate the elements at the two pointers.
   - Check if they meet the problem's condition (e.g., their sum equals the target).

5. **Adjust the Pointers:**
   - Depending on the result of the evaluation, adjust the pointers:
     - If the condition is met, perform the required action (e.g., return the indices).
     - If the condition is not met, decide which pointer to move to potentially meet the condition.
     - Typically, move the left pointer right (`left++`) if you need a larger value, or move the right pointer left (`right--`) if you need a smaller value.

6. **Edge Cases:**
   - Consider any edge cases, such as empty arrays or arrays with fewer elements than required to meet the condition.

### Example Problem: Find Two Numbers in a Sorted Array That Sum Up to a Target

```dart
List<int>? findTwoSum(List<int> arr, int target) {
  int left = 0;
  int right = arr.length - 1;
  while (left < right) {
    int sum = arr[left] + arr[right];
    if (sum == target) {
      return [arr[left], arr[right]];
    } else if (sum < target) {
      left++;
    } else {
      right--;
    }
  }
  return null; // Return null if no pair is found
}
```

## 2. String

Strings are fundamental in programming and are used to represent text. In Dart, strings have various methods and operations to manipulate and analyze them.

### Basics of Strings in Dart:
- **String Initialization:**
  - Single quotes: `'Hello, Dart!'`
  - Double quotes: `"Hello, Dart!"`
  - Triple quotes for multi-line strings:
    ```dart
    '''
    This is a
    multi-line string
    in Dart.
    '''
    ```

- **String Interpolation:**
  - Use `$variable` or `${expression}` to embed expressions inside strings.
  ```dart
  String name = 'Alice';
  String greeting = 'Hello, $name!';
  int age = 30;
  String details = 'Age: ${age + 5}';
  ```

### String Methods:
- `length`: Returns the number of characters in the string.
- `substring(start, [end])`: Returns a substring from start to end.
- `contains(pattern)`: Checks if the string contains a pattern.
- `startsWith(pattern)`: Checks if the string starts with a pattern.
- `endsWith(pattern)`: Checks if the string ends with a pattern.
- `indexOf(pattern)`: Returns the first index of the pattern in the string.
- `toUpperCase()`, `toLowerCase()`: Converts the string to upper or lower case.
- `split(pattern)`: Splits the string into a list of substrings based on a pattern.
- `replaceAll(from, replace)`: Replaces all occurrences of 'from' with 'replace'.

### String Algorithms:
1. **Palindrome Check:**
   ```dart
   bool isPalindrome(String s) {
     int left = 0;
     int right = s.length - 1;
     while (left < right) {
       if (s[left] != s[right]) {
         return false;
       }
       left++;
       right--;
     }
     return true;
   }
   ```

2. **Anagram Check:**
   ```dart
   bool areAnagrams(String s1, String s2) {
     if (s1.length != s2.length) return false;
     List<int> charCount = List.filled(26, 0);
     int aCode = 'a'.codeUnitAt(0);
     for (int i = 0; i < s1.length; i++) {
       charCount[s1[i].codeUnitAt(0) - aCode]++;
       charCount[s2[i].codeUnitAt(0) - aCode]--;
     }
     for (int count in charCount) {
       if (count != 0) return false;
     }
     return true;
   }
   ```

3. **String Reversal:**
   ```dart
   String reverseString(String s) {
     List<String> chars = s.split('');
     int left = 0;
     int right = chars.length - 1;
     while (left < right) {
       String temp = chars[left];
       chars[left] = chars[right];
       chars[right] = temp;
       left++;
       right--;
     }
     return chars.join('');
   }
   ```

## 3. Math

Mathematical operations and algorithms are crucial in many programming problems. Dart provides various built-in operations and a math library for more advanced functions.

### Basic Mathematical Operations in Dart:
```dart
void main() {
  int a = 10;
  int b = 5;
  print(a + b);  // Addition: 15
  print(a - b);  // Subtraction: 5
  print(a * b);  // Multiplication: 50
  print(a / b);  // Division: 2.0
  print(a % b);  // Modulus: 0
  print(a ~/ b); // Integer Division: 2
}
```

### Math Library:
Dart's `dart:math` library provides more advanced mathematical functionalities:

```dart
import 'dart:math';

void main() {
  double x = 8.0;
  print(sqrt(x));       // Square root: 2.828427124746190
  print(pow(x, 3));     // Power: 512.0
  print(max(10, 20));   // Max: 20
  print(min(10, 20));   // Min: 10
  print(sin(pi / 2));   // Sine: 1.0
  print(cos(pi));       // Cosine: -1.0
}
```

### Random Number Generation:
```dart
import 'dart:math';

void main() {
  Random random = Random();
  int randomNumber = random.nextInt(100); // Random integer between 0 and 99
  double randomDouble = random.nextDouble(); // Random double between 0.0 and 1.0
  print(randomNumber);
  print(randomDouble);
}
```

### Common Mathematical Algorithms:

1. **Greatest Common Divisor (GCD):**
   ```dart
   int gcd(int a, int b) {
     while (b != 0) {
       int temp = b;
       b = a % b;
       a = temp;
     }
     return a;
   }
   ```

2. **Least Common Multiple (LCM):**
   ```dart
   int lcm(int a, int b) {
     return (a * b) ~/ gcd(a, b);
   }
   ```

3. **Prime Number Check:**
   ```dart
   bool isPrime(int n) {
     if (n <= 1) return false;
     for (int i = 2; i <= sqrt(n); i++) {
       if (n % i == 0) return false;
     }
     return true;
   }
   ```

## 4. Array

In Dart, arrays are represented by the List class. Lists are ordered collections of objects and are fundamental to many algorithms.

### Creating a List:
```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers); // Output: [1, 2, 3, 4, 5]
}
```

### Accessing Elements:
```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers[0]); // Output: 1
  print(numbers[3]); // Output: 4
}
```

### Modifying Elements:
```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers[2] = 10;
  print(numbers); // Output: [1, 2, 10, 4, 5]
}
```

### Adding Elements:
```dart
void main() {
  List<int> numbers = [1, 2, 3];
  numbers.add(4); // Adds 4 at the end
  print(numbers); // Output: [1, 2, 3, 4]
  numbers.insert(1, 5); // Inserts 5 at index 1
  print(numbers); // Output: [1, 5, 2, 3, 4]
}
```

### Removing Elements:
```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.remove(3); // Removes the first occurrence of 3
  print(numbers); // Output: [1, 2, 4, 5]
  numbers.removeAt(2); // Removes the element at index 2
  print(numbers); // Output: [1, 2, 5]
}
```

### Common Array Algorithms:

1. **Finding the Maximum Element:**
   ```dart
   int findMax(List<int> numbers) {
     int max = numbers[0];
     for (int num in numbers) {
       if (num > max) {
         max = num;
       }
     }
     return max;
   }
   ```

2. **Reversing an Array:**
   ```dart
   List<int> reverseArray(List<int> numbers) {
     int start = 0;
     int end = numbers.length - 1;
     while (start < end) {
       int temp = numbers[start];
       numbers[start] = numbers[end];
       numbers[end] = temp;
       start++;
       end--;
     }
     return numbers;
   }
   ```

3. **Sorting an Array:**
   Dart provides a built-in method for sorting lists:
   ```dart
   void main() {
     List<int> numbers = [3, 1, 4, 1, 5, 9];
     numbers.sort();
     print(numbers); // Output: [1, 1, 3, 4, 5, 9]
   }
   ```

   For custom sorting, you can provide a comparator function:
   ```dart
   void main() {
     List<int> numbers = [3, 1, 4, 1, 5, 9];
     numbers.sort((a, b) => b.compareTo(a)); // Sort in descending order
     print(numbers); // Output: [9, 5, 4, 3, 1, 1]
   }
   ```

## 5. Greedy

A Greedy algorithm is a problem-solving approach that makes the best choice at each step with the hope of finding the global optimum. It builds up a solution piece by piece, always choosing the next piece that offers the most immediate benefit or profit.

### Characteristics of Greedy Algorithms:
- **Greedy Choice Property:** A global optimum can be arrived at by selecting a local optimum.
- **Optimal Substructure:** A problem has an optimal substructure if an optimal solution to the problem contains optimal solutions to the subproblems.

### Steps for Greedy Algorithm:
1. **Initialize:** Start with an empty solution.
2. **Iterate:** At each step, make the locally optimal choice.
3. **Check:** Verify if the current solution is valid.
4. **Build:** Add the chosen element to the solution.
5. **Repeat:** Repeat the process until the solution is complete.

### Examples of Greedy Algorithms:

1. **Coin Change Problem:**
   Given a set of coin denominations and an amount, find the minimum number of coins needed to make the amount.

   ```dart
   List<int> coinChange(List<int> coins, int amount) {
     coins.sort((a, b) => b.compareTo(a)); // Sort coins in descending order
     List<int> result = [];
     for (int coin in coins) {
       while (amount >= coin) {
         amount -= coin;
         result.add(coin);
       }
     }
     return result;
   }
   ```

2. **Activity Selection Problem:**
   Given a set of activities with their start and end times, select the maximum number of activities that can be performed without overlapping.

   ```dart
   class Activity {
     int start;
     int end;
     Activity(this.start, this.end);
   }

   List<Activity> activitySelection(List<Activity> activities) {
     activities.sort((a, b) => a.end.compareTo(b.end)); // Sort activities by end time
     List<Activity> result = [];
     int currentTime = 0;
     for (Activity activity in activities) {
       if (activity.start >= currentTime) {
         result.add(activity);
         currentTime = activity.end;
       }
     }
     return result;
   }
   ```

### Advantages and Disadvantages of Greedy Algorithms:
**Advantages:**
- Simple and easy to implement.
- Efficient for problems where the greedy choice property and optimal substructure hold.

**Disadvantages:**
- Not suitable for all problems; may not provide the optimal solution in some cases.
- Requires careful analysis to ensure the greedy choice leads to an optimal solution.

### When to Use Greedy Algorithms:
Greedy algorithms are suitable when:
- The problem has the greedy choice property.
- The problem has an optimal substructure.
- You need an efficient solution.

Remember, the key to successfully applying greedy algorithms is to carefully analyze the problem to ensure that making locally optimal choices leads to a globally optimal solution.