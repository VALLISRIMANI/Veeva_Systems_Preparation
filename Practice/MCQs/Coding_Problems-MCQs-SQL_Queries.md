# PART 1 — CODING PROBLEMS

## A. Veeva / general coding problems

### 1. Find the closest number to a target

Given a list/array of numbers, find the number having the smallest absolute difference from `K`.

Examples:

```text
[9, 11, 5, 3, 25, 18], K = 6 → 5
[2, 5, 10, 15], K = 10 → 10
[2, 5, 10, 15], K = 8 → 10
[-15, -10, -5], K = -12 → -10
[5], K = 3 → 5
[10, 20], K = 15 → 20
[1, 5, 9], K = 25 → 9
[10, 15, 20], K = 2 → 10
```



---

### 2. Check whether one array is a subsequence of another

```text
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, -1, 10]
→ true
```

```text
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, 10, -1]
→ false
```



---

### 3. First non-repeating character in a string

Examples:

```text
leetcode       → l / 0
loveleetcode   → v / 2
racecar        → e / 3
aaab           → b / 3
simplest       → i / 1
aabb           → -1
ababab         → -1
aaaa           → -1
a              → a / 0
aaaaaaaaaab    → b / 10
```



---

### 4. Find the number of distinct colors among balls

[LeetCode — Find the Number of Distinct Colors Among the Balls](https://leetcode.com/problems/find-the-number-of-distinct-colors-among-the-balls/description/?utm_source=chatgpt.com)



---

### 5. Sum numeric characters in an alphanumeric string

Examples:

```text
abc123xyz    → 123
10a20b30     → 60
geeks4geeks  → 4
"9"          → 9
abcDEFghj    → 0
12345        → 12345
000abc000    → 0
00abc12ghj   → 12
5 5 5        → 15
```



---

### 6. Find duplicates in an array

Given an array of size `n`, each value is from `1..n` and occurs at most twice. Find all values appearing twice.

```text
[2, 3, 1, 2, 3] → [2, 3]
[3, 1, 2] → []
```



[LeetCode — Find All Duplicates in an Array](https://leetcode.com/problems/find-all-duplicates-in-an-array/?utm_source=chatgpt.com)

---

### 7. Get duplicate objects from an array of objects

Find objects duplicated according to a specified key/composite key.

Example:

```text
{id:1, name:"Amit Kumar", email:"amit@example.com"}
{id:3, name:"Amit Kumar", email:"amit@example.com"}
{id:5, name:"Amit Kumar", email:"amit@example.com"}
```

The objects with IDs `1, 3, 5` are duplicates based on `name + email`.



---

### 8. Longest Increasing Subsequence

[LeetCode — Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/?utm_source=chatgpt.com)

---

### 9. Circular Longest Increasing Subsequence

[Code360 — Longest Increasing Subsequence in Circular Manner](https://www.naukri.com/code360/problems/longest-increasing-subsequence-in-circular-manner_2319034?utm_source=chatgpt.com)



---

### 10. Minimum loss when buying and selling once

Given daily prices, buy and sell only once. Find the minimum loss.

```text
N=5
[6,8,10,4,9] → 1

N=4
[8,9,3,5] → 3
```



---

### 11. Make String a Subsequence Using Cyclic Increments

[LeetCode — Make String a Subsequence Using Cyclic Increments](https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments/?utm_source=chatgpt.com)

---

### 12. Invalid Transactions

[LeetCode — Invalid Transactions](https://leetcode.com/problems/invalid-transactions/?utm_source=chatgpt.com)

---

### 13. Subarrays with K Different Integers

[LeetCode — Subarrays with K Different Integers](https://leetcode.com/problems/subarrays-with-k-different-integers/?utm_source=chatgpt.com)

---

### 14. Shortest Path in Binary Matrix

[LeetCode — Shortest Path in Binary Matrix](https://leetcode.com/problems/shortest-path-in-binary-matrix/?utm_source=chatgpt.com)



---

### 15. Design an LRU Cache

Marked as a **most important problem**, reportedly asked at Veeva Systems and Palantir Technologies.



---

### 16. Check if a sentence is a pangram

Determine whether every English alphabet character `a-z` occurs in the sentence.

[LeetCode — Check if the Sentence Is Pangram](https://leetcode.com/problems/check-if-the-sentence-is-pangram/?utm_source=chatgpt.com)

[HackerRank — Pangrams](https://www.hackerrank.com/challenges/pangrams/problem?utm_source=chatgpt.com)

[CodeChef — Pangram](https://www.codechef.com/practice/course/1-star-difficulty-problems/DIFF1200/problems/MATPAN?utm_source=chatgpt.com)



---

### 17. Sort elements of a HashMap without using a sorting method



---

### 18. Palindrome Linked List — single traversal

Check whether a linked list is a palindrome **in a single traversal and without using another data structure**.



---

### 19. Snake traversal of a binary tree



---

### 20. Shuffle and distribute cards

Use the **Fisher-Yates Shuffle Algorithm** to randomize cards and then distribute them among players using round-robin distribution.



---

### 21. Merge two sorted lists

```text
list1 = [1,2,5]
list2 = [2,4,6]

→ [1,2,2,4,5,6]
```

Also asked: **What is the time complexity?**



---

### 22. Compute standard deviation for multiple lists

Write:

```text
compute_deviation(input)
```

Input contains dictionaries with:

* `key`
* list of integers

Return a dictionary containing the standard deviation for each list.



---

### 23. Frequency of each string in an array

Examples include:

```text
["apple","banana","cherry"]
→ {"apple":1,"banana":1,"cherry":1}

["apple","apple","apple"]
→ {"apple":3}

["apple","banana","apple","cherry","banana","apple"]
→ {"apple":3,"banana":2,"cherry":1}

[]
→ {}

["Apple","apple","APPLE","apple"]
→ {"apple":2,"Apple":1,"APPLE":1}
```

Also test empty strings, whitespace differences, and very long strings.



---

### 24. Valid Parentheses

Given a string containing:

```text
{ } ( ) [ ]
```

Determine whether parentheses are balanced.

```text
{}[]() → Balanced
{[}]   → Not Balanced
```



---

### 25. Palindrome Linked List

Determine whether a singly linked list of integers is a palindrome.

```text
1 → 2 → 3 → 2 → 1 → NULL
→ true
```



---

### 26. Spiral / zigzag level-order traversal of binary tree

Traverse a binary tree level by level, alternating left-to-right and right-to-left.



---

## B. Additional Veeva coding set — July 24

### 27. Product of Array Except Self

Return an output array where every element is the product of all input elements except itself.

**Constraint:** Do not use division.



---

### 28. Longest Substring Without Repeating Characters

[LeetCode — Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/?utm_source=chatgpt.com)

---

### 29. Count and Say

[LeetCode — Count and Say](https://leetcode.com/problems/count-and-say/?utm_source=chatgpt.com)

---

### 30. Min Stack

[LeetCode — Min Stack](https://leetcode.com/problems/min-stack/?utm_source=chatgpt.com)



---

### 31. Group Anagrams

[Jointaro — Group Anagrams, Veeva Systems](https://www.jointaro.com/interviews/questions/group-anagrams/?company=veeva-systems&utm_source=chatgpt.com)

---

### 32. Generate Parentheses

[Jointaro — Generate Parentheses, Veeva Systems](https://www.jointaro.com/interviews/questions/generate-parentheses/?company=veeva-systems&utm_source=chatgpt.com)

---

### 33. Valid Sudoku

[Jointaro — Valid Sudoku, Veeva Systems](https://www.jointaro.com/interviews/questions/valid-sudoku/?company=veeva-systems&utm_source=chatgpt.com)

---

### 34. Top K Frequent Elements

Find the `K` most frequent elements.

```text
nums = [4,4,4,4,5,5,6], k = 1
→ [4]
```



---

### 35. Longest Consecutive Sequence

```text
[0,3,7,2,5,8,4,6,0,1]
→ 9
```



---

### 36. Shortest Path Visiting All Nodes

Given an undirected connected graph, find the shortest path that visits every node. Nodes/edges may be revisited.

```text
graph = [[1],[0,2],[1]]
→ 2
```



---

### 37. Merge Two Sorted Arrays

```text
nums1 = [0], m = 0
nums2 = [1], n = 1

→ [1]
```



---

### 38. Maximum Subarray Sum

```text
[-3,-4,-1,-2]
→ -1
```

Kadane's algorithm is relevant.



---

### 39. Valid Palindrome After Deleting One Character

Determine whether a string can become a palindrome after deleting **at most one** character.

```text
"abc" → false
```



---

### 40. Reverse Nodes in K-Group

```text
head = [1,2,3,4,5], k = 3
→ [3,2,1,4,5]
```



---

### 41. Word Break

Given `s` and a dictionary `wordDict`, determine whether `s` can be segmented into dictionary words.

```text
s = "catsandog"
wordDict = ["cats","dog","sand","and","cat"]

→ false
```



---

### 42. Search a 2D Matrix

Search for a target in a matrix where rows are sorted and the first element of each row is greater than the last element of the previous row.

```text
matrix = [[1,4],[2,5]]
target = 20
→ false
```



---

### 43. Continuous Subarrays Sum Equals K

```text
nums = [1,2,3], k = 3
→ 2
```

The two subarrays are `[1,2]` and `[3]`.



---

### 44. Count Nodes in Complete Binary Tree

```text
root = [1,2,3,4,5,6,7]
→ 7
```



---

### 45. Number of Connected Components

Given an adjacency matrix `isConnected`, find the number of connected components.

```text
[[1,0,0],
 [0,1,0],
 [0,0,1]]
→ 3
```



---

### 46. Valid Word Abbreviation

```text
word = "apple"
abbr = "a2e"
→ false
```



---

### 47. Insert/Merge a New Interval

```text
intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
newInterval = [4,8]

→ [[1,2],[3,10],[12,16]]
```



---

### 48. Trapping Rain Water

```text
height = [4,2,0,3,2,5]
→ 9
```



---

### 49. Combination Sum / Unique Combinations

```text
candidates = [2,4,6]
target = 6

→ [[2,2,2],[2,4],[6]]
```



---

### 50. Add Two Numbers Represented as Strings

Do **not convert the strings into numeric types**, because the strings can represent very large values.

```text
"456" + "77" → "533"
```



---

### 51. Minimum Window Substring

Find the minimum substring of `s` containing every required character of `t`.

Important test cases include:

```text
"ADOBECODEBANC", "ABC" → "BANC"
"a", "a" → "a"
"a", "aa" → ""
"abcde", "xyz" → ""
"bba", "ab" → "ba"
"bba", "bbb" → ""
"AA", "AA" → "AA"
"aaaaaba", "ab" → "ba"
```



---

## C. Flipkart problems shared for additional preparation

These were explicitly shared as previously asked Flipkart coding problems, so I am keeping them because they were part of the group's preparation material.

### 52. Word Ladder

[LeetCode — Word Ladder](https://leetcode.com/problems/word-ladder/?utm_source=chatgpt.com)

### 53. Minimum Number of Refueling Stops

[LeetCode — Minimum Number of Refueling Stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/?utm_source=chatgpt.com)

### 54. Merge Intervals

[LeetCode — Merge Intervals](https://leetcode.com/problems/merge-intervals/?utm_source=chatgpt.com)

### 55. Rotate String

[LeetCode — Rotate String](https://leetcode.com/problems/rotate-string/?utm_source=chatgpt.com)

### 56. Rearrange String with Adjacent Characters at Distance `d`

Rearrange a string so that adjacent equal characters are at least `d` distance apart. If possible, print the resulting string.

### 57. All Nodes Distance K in Binary Tree

[LeetCode — All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/?utm_source=chatgpt.com)

### 58. Maximum Sum With No Adjacent Tree Nodes

Find maximum sum such that no adjacent nodes are selected.

### 59. Minimum Meeting Rooms

Find the minimum number of meeting rooms needed so all meetings can be scheduled.

### 60. Subarray Sum Equals K

Handle:

* non-negative numbers → sliding window
* negative numbers → HashMap/prefix sum

[LeetCode — Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/?utm_source=chatgpt.com)



---

## D. Latest coding links from August 20

### 61. City Lights

[HackerEarth — City Lights](https://www.hackerearth.com/problem/algorithm/citylights/?utm_source=chatgpt.com)

### 62. Two Furthest Houses With Different Colors

[LeetCode — Two Furthest Houses With Different Colors](https://leetcode.com/problems/two-furthest-houses-with-different-colors/?utm_source=chatgpt.com)



---

# PART 2 — JAVA MCQs / OUTPUT QUESTIONS

I have preserved the actual code/output questions rather than reducing them to topics.

## A. OOP / Core Java MCQs

### 1. Interfaces

Which statement about Java interfaces is true?

* A) An interface can contain constructors.
* B) Interfaces support multiple inheritance in Java.
* C) Interfaces can be instantiated directly using `new`.
* D) Interfaces can only contain final and static methods.

### 2. Overloading

When does overloading **not** occur?

* A) Same name, different parameters/signature
* B) Same name, same signature
* C) Same name, same number but different parameter types
* D) Same name, same parameters/type but different signature

### 3. Inheritance

Which is true?

* A) A class can extend multiple classes.
* B) A subclass inherits methods from its superclass.
* C) Inheritance can only be achieved through interfaces.
* D) Constructors are inherited by subclasses.

### 4. `equals()`

What does `equals()` compare?

* A) Object references
* B) Object content
* C) It must be overridden in every class
* D) Class types

### 5. `hashCode()`

Why override `hashCode()` when overriding `equals()`?

* A) Ensure unique identity
* B) Maintain the general contract for hash tables
* C) Optimize memory
* D) Allow method overloading

### 6. Object class

Which is true?

* A) All classes inherit from `Object`
* B) Object cannot be subclassed
* C) Object has no methods
* D) Object has no constructors

### 7. Protected visibility

* A) Own package only
* B) Subclasses only
* C) Own package and subclasses
* D) Anywhere

### 8. Private visibility

* A) Anywhere
* B) Same class only
* C) Subclasses
* D) Same package

### 9. Multiple inheritance

Which is true?

* A) A class can implement multiple interfaces
* B) A class can extend multiple classes
* C) Multiple inheritance is allowed for classes and interfaces
* D) A class can inherit multiple abstract classes

### 10. Casting

What happens when attempting to cast an object to a class it does not inherit from?

* A) Compile-time error
* B) Runtime exception
* C) Returns null
* D) Creates new instance

### 11. Serializable

What is the purpose of `Serializable`?

* A) Deep copy
* B) Allow objects to be serialized
* C) Thread safety
* D) Cloning

### 12. Prevent overriding

How do you prevent a method from being overridden?

* A) `final`
* B) `private`
* C) `static`
* D) `abstract`

### 13. Multiple interface inheritance

Which is true?

* A) Allowed in Java
* B) Not allowed
* C) Always ambiguous
* D) Only one interface can be inherited

### 14. Inner class keyword

Which keyword is used to declare an inner class?

* A) `inner`
* B) `static`
* C) `public`
* D) `class`

### 15. `serialVersionUID`

What is `serialVersionUID`?

* A) Unique identifier for a class
* B) Serialization method
* C) Variable holding serialized data
* D) Marker interface

### 16. Marker interface

Purpose?

* A) Provide methods
* B) Mark a class for specific behavior
* C) Prevent multiple inheritance
* D) Enforce type safety

### 17. Static members

Which is true?

* A) Associated with instances
* B) Can be accessed without creating an instance
* C) Cannot be inherited
* D) Can only be private



---

# B. Java Output Questions

### 18. Integer caching

```java
Integer num1 = 100;
Integer num2 = 100;
Integer num3 = 500;
Integer num4 = 500;

System.out.println(num1 == num2);
System.out.println(num3 == num4);
```

Choose the output.

### 19. Byte array to String

```java
byte[] arr = {97,98,99,100,101};
String str2 = new String(arr);
System.out.println(str2);
```

### 20. `charAt()`

```java
String str = "Java Programming";
char ch = str.charAt(2);
System.out.println(ch);
```



---

### 21. Final instance variable

```java
class Test {
    public final int a;
}

class Example {
    public static void main(String[] args) {
        Test obj = new Test();
        System.out.println(obj.a);
    }
}
```

Options include:

* `0`
* Garbage value
* Compile-time error: variable not initialized
* Runtime error

### 22. Method that looks like constructor

```java
class Example {
    private int x;

    public static void main(String args[]) {
        Example obj = new Example();
    }

    public void Example(int x) {
        System.out.println(x);
    }
}
```

### 23. Constructor vs method

```java
class Example {
    private int x;

    public static void main(String args[]) {
        Example obj = new Example(5);
    }

    public Example(int x) {
        System.out.println("x = " + x);
    }

    public void Example(int x) {
        System.out.println(x);
    }
}
```

### 24. String `==` vs `equals()`

```java
String str1 = new String("Hello World");
String str2 = new String("Hello World");

String str3 = "Hello World";
String str4 = "Hello World";
```

Determine values of `a`, `b`, and `c` for:

```java
str3 == str4
str1.equals(str3)
str1 == str4
```

### 25. How many String objects?

Using the same String example above, determine the number of objects created.

### 26. HashMap duplicate key

```java
Map<String,String> hashMap = new HashMap<>();
hashMap.put(new String("a"), "audi");
hashMap.put(new String("a"), "ferrari");
System.out.println(hashMap);
```

### 27. IdentityHashMap

```java
Map<String,String> identityHashMap = new IdentityHashMap<>();
identityHashMap.put(new String("a"), "audi");
identityHashMap.put(new String("a"), "ferrari");
System.out.println(identityHashMap);
```



---

# C. Java MCQs posted July 12

### 28. String concatenation

```java
System.out.print(10 + 20 + "Java" + 10 + 20);
```

### 29. Integer cache

```java
Integer num1 = 100;
Integer num2 = 100;
Integer num3 = 150;
Integer num4 = 150;

System.out.print((num1 == num2) + " " + (num3 == num4));
```

### 30. Finally return

```java
public static int getValue() {
    try {
        return 1;
    } catch (Exception e) {
        return 2;
    } finally {
        return 3;
    }
}
```

What is printed?

### 31. Overloading with null

```java
testMethod(Object o)
testMethod(String s)

testMethod(null);
```

Which method is selected?

### 32. Character arithmetic

```java
System.out.println('j' + 'a' + 'v' + 'a');
```

### 33. Integer comparison outside cache

```java
Integer num1 = 400;
Integer num2 = 400;

if(num1 == num2)
    System.out.println(0);
else
    System.out.println(1);
```

### 34. Unary operators

```java
int i = 20 + +9 - -12 + +4 - -13 + +19;
System.out.println(i);
```

### 35. String concatenation

```java
System.out.println(10 + 20 + "Java");
System.out.println("Java" + 10 + 20);
```

### 36. `System.exit()` and finally

```java
try {
    System.out.println("Inside try block");
    System.exit(0);
} catch(Exception e) {
    System.out.println("Inside catch block");
} finally {
    System.out.println("Inside finally block");
}
```

### 37. Division by zero

```java
System.out.println(1.0 / 0);
System.out.println(0.0 / 0);
System.out.println(0 / 0);
```

### 38. Arithmetic + String

```java
System.out.println(10 * 20 + "Hello");
System.out.println("Hello" + 10 * 20);
```

### 39. String immutability

```java
String s = "abc";
s.toUpperCase();
System.out.println(s);
```

### 40. Null overload

```java
method(Object o)
method(String s)

method(null);
```

### 41. String object + arithmetic

```java
String s = new String("5");
System.out.println(1 + 10 + s + 1 + 10);
```

### 42. Static block / instance block / constructor

```java
class A {
    static {
        System.out.print("1");
    }

    {
        System.out.print("2");
    }

    public A() {
        System.out.print("3");
    }
}

A a1 = new A();
A a2 = new A();
```

### 43. Overload with `null`

```java
new Test().print(null);

print(Object o)
print(String s)
```

### 44. Floating-point comparison

```java
double a = 0.1 + 0.2;
System.out.println(a == 0.3);
System.out.println(a);
```

### 45. try/catch/finally

```java
try {
    System.out.println("A");
    throw new RuntimeException("Test");
} catch(RuntimeException e) {
    System.out.println("B");
} finally {
    System.out.println("C");
}
```

### 46. Varargs vs wrapper overload

```java
print(int... numbers)
print(Integer i1, Integer i2)

print(1,2,3);
```



---

# D. Java Collections MCQs

### 47. PriorityQueue

Given:

```java
PriorityQueue<Integer> queue = new PriorityQueue<>();

queue.add(11);
queue.add(10);
queue.add(22);
queue.add(5);
queue.add(12);
queue.add(2);

while(!queue.isEmpty())
    System.out.printf("%d ", queue.remove());
```

Determine output.

### 48. TreeSet ordering

Add:

```text
Geeks
For
Geeks
GeeksforGeeks
```

What is printed by iterating the `TreeSet`?

### 49. LinkedList `removeAll()`

```java
list1 = [Geeks, For, Geeks, GFG, GeeksforGeeks]
list2 = [Geeks]

list1.removeAll(list2);
```

What is printed?

### 50. HashSet duplicate elements

```java
HashSet<String> hashSet = new HashSet<>();

hashSet.add("Geeks");
hashSet.add("For");
hashSet.add("Geeks");
hashSet.add("GeeksforGeeks");
```

What is printed?

### 51. Wrong Iterator generic type

```java
List<String> list = new LinkedList<>();
...
Iterator<Integer> iter = list.iterator();
```

Determine whether the result is:

* Correct output
* Runtime error
* Compilation error

### 52. ArrayList remove overload

```java
ArrayList<Integer> arr = new ArrayList<>();

arr.add(11);
arr.add(2);
arr.add(3);
arr.add(5);
arr.add(7);

arr.remove(new Integer(7));
arr.remove(2);
```

What remains?



---

# E. Constructors / inheritance / nested classes / threads

### 53. Private constructor

Can another class instantiate a class having a private constructor?

### 54. Runnable / Thread code

Determine the output/order of:

```java
Test obj = new Test();
Thread thread = new Thread(obj);
thread.start();
System.out.printf("GFG");
```

### 55. Factory method with private constructor

```java
Temp obj = Temp.create(20);
obj.myMethod();
```

Determine output.

### 56. Constructor chaining

Three overloaded constructors print:

```text
1
2
3
4
5
```

Determine final output.

### 57. `super()` position

```java
public Derived() {
    System.out.printf("2");
    super();
}
```

Determine whether this compiles and what happens.

### 58. Static nested class accessing outer members

Determine whether the nested class can access:

```java
temp1
temp2
temp3
temp4
temp5
```

### 59. Local inner class

Determine output of a local inner class containing its own `data` field.

### 60. Anonymous inner class

Determine output when:

```java
Anonymous inner = new Anonymous() {
    int data = 5;
    ...
};
```

### 61. Non-static inner class

Determine output involving:

```java
Outer outer = new Outer();
Outer.Inner inner = outer.new Inner();
```

### 62. Nested interfaces

A class implements both:

```java
OuterInterface
OuterInterface.InnerInterface
```

What happens?

### 63. Thread `join()`

```java
thread.start();
System.out.printf("%d", 1);
thread.join();
System.out.printf("%d", 2);
```

Thread prints `3`. Determine possible output.

### 64. Nested class accessing instance field

Determine whether this compiles:

```java
static class Nested {
    private void display() {
        System.out.println(temp + s + value);
    }
}
```



---

# F. More Java output questions

### 65. Method overriding with `IOException`

```java
class Test {
    public void display() throws IOException
}

class Derived extends Test {
    public void display() throws IOException
}
```

What is printed?

### 66. `run()` vs `start()`

```java
Test test = new Test();
test.run();
test.start();
```

What is printed?

### 67. Nested interface access modifier

```java
public interface Test {
    public int calculate();

    protected interface NestedInterface {
        public void nested();
    }
}
```

Is this legal?

### 68. Constructor declaration

Which constructor statement is true?

* Constructors can be `final`.
* Constructors can be surrounded by try/catch.
* Constructors cannot throw exceptions.
* Constructors can contain synchronized code.

### 69. Basic inheritance

```java
Super i = new Super();
i.show();
```

Where `Super.show()` prints `"Base"` and `Sub.show()` prints `"Derived"`.

What is output?

### 70. Static method hiding

```java
Parent obj = new Child();
obj.display();
```

Both `Parent` and `Child` have static `display()` methods.

What is output?



---

# G. Collections / constructor questions — July 23

### 71. `Arrays.sort()`

```java
String a[] = {"Sa","nf","ou","nd","ry"};
Arrays.sort(a);
```

What is printed?

### 72. `Collections.shuffle()`

A LinkedList contains:

```text
Sanfoundry
10
20
30
```

After `Collections.shuffle()`, what can the output be?

### 73. `Collections.reverse()`

Reverse:

```text
S a n f o u n d r y
```

### 74. LinkedList characters

Build a `LinkedList` from `"Sanfoundry"` character-by-character. What does printing the list produce?

### 75. LinkedList remove by index

```java
l = [1,2,4,5,3]
l.remove(3)
```

What remains?

### 76. `retainAll()`

Retain only:

```text
S, f, n, o
```

from `"Sanfoundry"`.

### 77. `contains()`

Does a LinkedList containing `"Sanfoundry"` characters contain `'S'`?

### 78. Iterator search

Find `"n"` in:

```text
S a n f o u n d r y
```

How many times is `"Found 'n'"` printed?

### 79. `size()` and `clear()`

List contains `0..9`.

Print size before and after:

```java
l.clear();
```

### 80. LinkedList `hashCode()`

Determine hashCode before and after clearing:

```java
l.add("Sanfoundry");
l.clear();
l.add("SANFOUNDRY");
l.clear();
```

### 81. Stack

```java
Stack<String> stack = new Stack<>();
stack.push("A");
stack.push("B");
stack.pop();
```

What does the iterator print?

### 82. ArrayList iterator

```java
ArrayList<String> list = new ArrayList<>();
list.add("A");
Iterator itr = list.iterator();
```

What is printed?

### 83. Method named same as class

```java
class Constructor {
    int x;

    public void Constructor() {
        x = 5;
    }
}
```

What does `new Constructor().x` produce?

### 84. Static variable constructor

```java
static int x = 1;

Constructor() {
    x = 5;
}
```

Output?

### 85. Parameterized constructor

```java
static int x = 1;

Constructor(int n) {
    x = n;
}
```

Called with `4`. Output?

### 86. Instance variable update in constructor

```java
int x = 1;

Constructor(int n) {
    x = x + n;
}
```

Called with `3`. Output?

### 87. Final variable assignment

```java
final int x = 1;

Constructor(int n) {
    x = x + n;
}
```

Compilation result?

### 88. Private constructor inside same class

Determine output when the private constructor is called from the class's own `main()`.

### 89. Private constructor from another class

Determine compilation result when another class attempts:

```java
new Constructor();
```

### 90. Parameterized constructor

```java
Name ob = new Name("Dravid");
```

What is printed?

### 91. Default constructor

```java
String str = "abc";

Name() {
    System.out.println(str);
}
```

Output?

### 92. `this.x`

```java
int x = 5;

Main() {
    this.x = 7;
}
```

Output?

### 93. `this.x = x`

```java
int x = 10;

Main() {
    this.x = x;
}
```

Output?

### 94. Constructor overload

```java
Main(int x) {
    this.x = x;
    System.out.print(x+" ");
}
```

Called with `15`. What is output?

### 95. Two overloaded constructors

```java
new Main(5);
new Main();
```

Determine output order.

### 96. Method instead of constructor

```java
public void Constructor(int x)
```

instead of an actual constructor. What happens?



---

# H. Java Collections — July 24

### 97. Deque descending iterator

```java
dq.offerFirst(1);
dq.offerFirst(2);
dq.offerFirst(3);
dq.offerLast(4);
```

Use `descendingIterator()`.

Determine output.

### 98. TreeSet reverse order

Create:

```java
new TreeSet<>(Collections.reverseOrder())
```

with:

```text
1,2,3,3,5,6,7,1,4
```

Determine output.

### 99. LinkedHashSet + Stack

Insert `0..5` into LinkedHashSet, push into Stack, then pop.

Determine output.

### 100. LinkedHashMap ordering

Insert:

```text
John → 1
Ron → 2
George → 3
Ray → 4
```

Determine iteration order.

### 101. HashMap → TreeMap

Insert:

```text
Karan → 1
Deepak → 2
Aman → 3
Ayan → 4
```

Copy into a `TreeMap`. Determine ordering.

### 102. Empty Stack condition

```java
while(s1.isEmpty())
    q.add(s1.pop());
```

What happens?

### 103. HashSet removals

Insert:

```text
1,2,2,3,6,4,4,0,7,5
```

Remove:

```text
1,2,4
```

What remains?

### 104. TreeSet `first()` and `last()`

Insert:

```text
101,76,89,7
```

Print first, remove 7, print last and first.

### 105. Deque + Stack

```java
dq.addFirst(10);
dq.addFirst(20);
dq.addLast(30);
dq.addFirst(40);
```

Move deque values into Stack and pop.

Determine output.



---

# I. More Java / language questions

### 106. Protected fields

```java
class Test {
    protected int x,y;
}

Test t = new Test();
System.out.println(t.x + " " + t.y);
```

### 107. Invalid `for` condition

```java
for(int i = 0; 1; i++)
```

Does it compile?

### 108. Valid infinite `for`

```java
for(int i = 0; true; i++) {
    System.out.println("Hello");
    break;
}
```

What is output?

### 109. Instance method from static context

```java
System.out.println(fun());
```

where:

```java
int fun() {
    return 20;
}
```

Does it compile?

### 110. Static local variable

```java
static int fun() {
    static int x = 0;
    return ++x;
}
```

Is this valid Java?



---

# J. Garbage Collection questions

### 111. Object eligible for GC

```java
String str = new String("GeeksForGeeks");
str = null;
System.gc();
Thread.sleep(1000);
System.out.println("end of main");
```

Predict output involving `finalize()`.

### 112. Exception inside `finalize()`

An object becomes eligible for GC, and its `finalize()` executes:

```java
System.out.println("finalize method called");
System.out.println(10/0);
```

Predict behavior.

### 113. Object resurrection

A `finalize()` method does:

```java
count++;
t = this;
```

Then GC is called twice.

Determine:

```text
finalize method called X times
```

### 114. Objects eligible after method returns

```java
static void m1() {
    Test t1 = new Test();
    Test t2 = new Test();
}
```

After:

```java
m1();
```

How many objects are eligible for garbage collection?



---

# PART 3 — SQL QUESTIONS

There are **many SQL questions**, including the complex set explicitly described by the instructor as **7 difficult SQL queries**. 

## 1. Second-highest salary in Engineering

Given:

```text
employees
---------
id
first_name
last_name
salary
department_id

departments
-----------
id
name
```

Find the **second-highest salary in Engineering**.

If multiple employees share the highest salary, select the next distinct highest salary.



---

## 2. Three-day rolling average of deposits

Given:

```text
bank_transactions
-----------------
user_id
created_at
transaction_value
```

Positive values are deposits and negative values are withdrawals.

Find the **total three-day rolling average for deposits by day**.

Date output format:

```text
%Y-%m-%d
```

Expected format:

```text
dt          rolling_three_day
2019-01-01  30
2019-01-02  40
2019-01-03  30
2019-01-04  30
```



---

## 3. Customers with >3 transactions in both 2019 and 2020

Tables:

```text
transactions
------------
id
user_id
created_at
product_id
quantity

users
-----
id
name
```

Find customers who placed **more than three transactions in 2019 AND more than three in 2020**.

Expected customers include:

```text
Om Crosby
Nishat Goodman
```



---

## 4. Histogram of comments per user — January 2020

Tables:

```text
users
-----
id
name
created_at
neighborhood_id
mail

comments
--------
user_id
body
created_at
```

Create a histogram of number of comments per user during **January 2020**.

Use bucket intervals of one.

Comments outside January 2020 count toward the **0 bucket**.

Output:

```text
comment_count
frequency
```



---

## 5. Top 3 departments by percentage earning >100K

Given employees and departments.

Select the **top 3 departments** that have at least 10 employees.

Rank according to the percentage of employees earning more than `$100K`.

Output:

```text
percentage_over_100k
department_name
number_of_employees
```



---

# 6. Closest SAT scores

Table:

```text
scores
------
id
student
score
```

Find the two students having the closest test scores and the score difference.

If multiple pairs have the same minimum difference, select the student-name combination that is higher alphabetically.

Example:

```text
Jack   1700
Alice  2010
Miles  2200
Scott  2100
```

Expected:

```text
Alice  Scott  90
```



---

# 7. Overlapping subscription date ranges

Table:

```text
subscriptions
-------------
user_id
start_date
end_date
```

Determine whether each user's completed subscription overlaps another completed subscription.

A completed subscription has a non-null `end_date`.

Expected:

```text
user_id  overlap
1        1
2        1
3        1
4        0
```



---

# 8. Top 3 salaries per department

Given employees and departments.

Return up to the **top 3 highest-paid employees per department**.

If a department has fewer than 3 employees, return all employees.

Output:

```text
employee_name
department_name
salary
```

Sort:

1. department ascending
2. salary descending



---

# 9. Upsold customers

Given product purchases:

```text
transactions
------------
id
user_id
created_at
product_id
quantity
```

Find the number of customers who bought additional products **after their first purchase**.

Important:

> If two products were purchased on the same day, it does not count as an upsell.

Expected:

```text
num_of_upsold_customers
3
```



---

# 10. Monthly sales report for 2020

Tables:

```text
transactions
products
users
```

Return for each month in 2020:

```text
month
num_customers
num_orders
order_amt
```

Calculate:

* number of customers
* number of transactions/orders
* total order amount



---

# 11. First-touch attribution

Tables:

```text
attribution
-----------
session_id
channel
conversion

user_sessions
-------------
session_id
created_at
user_id
```

A converted user has `conversion = true`.

Find the **first-touch attribution channel** for every converted user.

First touch means the channel associated with the user's earliest discovered session.



---

# 12. Employees who didn't complete any projects

Tables:

```text
employees
---------
id
salary

projects
--------
employee_id
project_id
Start_dt
End_dt
```

An unfinished project has:

```sql
End_dt IS NULL
```

Find the **sum of salaries of employees who were assigned at least one project and none of their projects were completed**.

Output:

```text
total_slack_salary
```



---

# 13. Cumulative distribution of comments per user

Tables:

```text
users
comments
```

Create a cumulative distribution of the number of comments per user.

Bucket interval = 1.

Output:

```text
frequency
cum_total
```



---

# 14. Average downloads: free vs paying users by day

Tables:

```text
accounts
--------
account_id
paying_customer

downloads
---------
account_id
download_date
downloads
```

Find average downloads per day separately for:

* free customers
* paying customers

Only include accounts that have had **at least one download**.

Round to **2 decimal places**.

Output:

```text
download_date
paying_customer
average_downloads
```



---

# PART 4 — CODECHEF GRAPH PRACTICE LINKS

These were explicitly posted for graph preparation. They should be included in your practice list even though the chat sometimes says "just run it/read it."

### Graph MCQs / concepts

[CodeChef — GRAPHMCQ1](https://www.codechef.com/learn/course/graphs/GRAPHTERMS/problems/GRAPHMCQ1?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ2](https://www.codechef.com/learn/course/graphs/GRAPHTERMS/problems/GRAPHMCQ2?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ3](https://www.codechef.com/learn/course/graphs/GRAPHTYPES/problems/GRAPHMCQ3?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ4](https://www.codechef.com/learn/course/graphs/GRAPHTYPES/problems/GRAPHMCQ4?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ5](https://www.codechef.com/learn/course/graphs/GRAPHTYPES/problems/GRAPHMCQ5?utm_source=chatgpt.com)

### Graph representation

[CodeChef — Graph Adjacency Matrix](https://www.codechef.com/learn/course/graphs/GRAPHREP/problems/GRAPHADJM?utm_source=chatgpt.com)

[CodeChef — Graph Adjacency List](https://www.codechef.com/learn/course/graphs/GRAPHREP/problems/GRAPHADJL?utm_source=chatgpt.com)

### More Graph MCQs

[CodeChef — GRAPHMCQ6](https://www.codechef.com/learn/course/graphs/GRAPHREP/problems/GRAPHMCQ6?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ7](https://www.codechef.com/learn/course/graphs/GRAPHREP/problems/GRAPHMCQ7?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ8](https://www.codechef.com/learn/course/graphs/GRAPHREP/problems/GRAPHMCQ8?utm_source=chatgpt.com)

### DFS / BFS

[CodeChef — Graph DFS](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/GRAPHDFS?utm_source=chatgpt.com)

[CodeChef — Graph BFS](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/GRAPHBFS?utm_source=chatgpt.com)

[CodeChef — DFS Reorganization](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/DFSREORG?utm_source=chatgpt.com)

[CodeChef — BFS Reorganization](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/BFSREORG?utm_source=chatgpt.com)

[CodeChef — DAA109](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/DAA109?utm_source=chatgpt.com)

[CodeChef — CHEFSERVER](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/CHEFSERVER?utm_source=chatgpt.com)

[CodeChef — CHEFDIST](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/CHEFDIST?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ9](https://www.codechef.com/learn/course/graphs/GRAPHTRAVERS/problems/GRAPHMCQ9?utm_source=chatgpt.com)

### Connected Components

[CodeChef — GRAPHMCQ10](https://www.codechef.com/learn/course/graphs/GRAPHCOMP/problems/GRAPHMCQ10?utm_source=chatgpt.com)

[CodeChef — GRAPHMCQ11](https://www.codechef.com/learn/course/graphs/GRAPHCOMP/problems/GRAPHMCQ11?utm_source=chatgpt.com)

[CodeChef — Connected Components DFS](https://www.codechef.com/learn/course/graphs/GRAPHCOMP/problems/CONCOMPDFS?utm_source=chatgpt.com)

[CodeChef — CHEFSCOUNTRY](https://www.codechef.com/learn/course/graphs/GRAPHCOMP/problems/CHEFSCOUNTRY?utm_source=chatgpt.com)

[CodeChef — GALACTICNW](https://www.codechef.com/learn/course/graphs/GRAPHCOMP/problems/GALACTICNW?utm_source=chatgpt.com)

These links were posted together on July 3 as graph preparation. 

---

# Final Master Checklist

For your actual preparation, the chat gives you roughly this structure:

| Section                         | What you need to complete                                                                                                                         |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Arrays / Hashing**            | Closest number, subsequence, duplicates, frequency, product except self, Top K, longest consecutive                                               |
| **Strings**                     | First non-repeating, numeric character sum, pangram, longest substring, Count & Say, palindrome deletion, word break, minimum window, add strings |
| **Sliding Window / Prefix Sum** | Subarray Sum K, K distinct, Minimum Window                                                                                                        |
| **Two Pointers**                | Palindrome deletion, merge arrays, rainwater                                                                                                      |
| **Linked List**                 | Palindrome, merge lists, reverse K-group                                                                                                          |
| **Stack / Queue**               | Valid parentheses, Min Stack, PriorityQueue, Deque, Stack                                                                                         |
| **Trees**                       | Distance K, no-adjacent maximum sum, snake traversal, spiral traversal, complete-tree count                                                       |
| **Graphs**                      | BFS, DFS, connected components, shortest path visiting all nodes, graph MCQs                                                                      |
| **Intervals**                   | Merge intervals, insert interval, meeting rooms                                                                                                   |
| **Greedy / Heap**               | Refueling stops, Top K, rearrange string, meeting rooms                                                                                           |
| **DP / Backtracking**           | LIS, Circular LIS, Word Break, Combination Sum                                                                                                    |
| **System/LLD**                  | **LRU Cache**                                                                                                                                     |
| **Java OOP**                    | Inheritance, overriding, overloading, interfaces, abstract classes, constructors                                                                  |
| **Java Strings**                | `==`, `equals()`, immutability, String pool                                                                                                       |
| **Java Collections**            | ArrayList, LinkedList, HashSet, TreeSet, HashMap, TreeMap, LinkedHashMap, Stack, Queue, Deque, PriorityQueue                                      |
| **Java Exceptions**             | try/catch/finally, `System.exit`, return in finally                                                                                               |
| **Java Threads**                | Thread, Runnable, `start()`, `run()`, `join()`                                                                                                    |
| **Java Inner Classes**          | Static nested, non-static inner, local, anonymous                                                                                                 |
| **Java Memory**                 | Integer cache, object creation, garbage collection, `finalize()`                                                                                  |
| **SQL Aggregation**             | Group By, Having, conditional aggregation                                                                                                         |
| **SQL Window Functions**        | Ranking, rolling average, cumulative distribution                                                                                                 |
| **SQL Joins**                   | Employee/department, transactions/users, attribution                                                                                              |
| **SQL Dates**                   | Year/month/day filtering, rolling periods                                                                                                         |
| **SQL Advanced**                | Second highest, overlaps, upsell, attribution, top-N per group                                                                                    |

