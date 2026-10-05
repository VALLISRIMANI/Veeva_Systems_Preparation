# Java Arrays and ArrayList MCQs

## 1. Array Initialization

### Question

What will be the output of the following code?

```java
class Test1 {
    public static void main(String[] args) {
        int arr[] = {11, 22, 33};

        for (int i = 0; i < arr.length; i++)
            System.out.print(arr[i] + " ");

        System.out.println();

        int arr2[] = new int[3];
        arr2[] = {11, 22, 33};

        for (int i = 0; i < arr2.length; i++)
            System.out.print(arr2[i] + " ");
    }
}
```

### Answer

**Compilation Error**

### Explanation

Array initialization using `{}` can be done only during declaration. After creating `arr2` using `new int[3]`, you cannot write `arr2[] = {...}`.

Correct alternatives:

```java
int[] arr2 = {11, 22, 33};
```

or

```java
arr2 = new int[]{11, 22, 33};
```

---

## 2. String Array

### Question

What will be the output?

```java
String str[] = {"Geeks", "for", "Geeks"};

for (int i = 0; i < str.length; i++)
    System.out.print(str[i]);
```

### Options

A) GeeksforGeeks
B) Error
C) Geeks
D) GfG

### Answer

**A) GeeksforGeeks**

### Explanation

The loop prints all three strings without adding spaces or a newline.

---

## 3. Case Sensitivity

### Question

What will be the output?

```java
int number = 11;
int NUMBER = 22;
int Number = 33;

System.out.print(number + " ");
System.out.print(NUMBER + " ");
System.out.println(Number);
```

### Answer

**11 22 33**

### Explanation

Java is case-sensitive. `number`, `NUMBER`, and `Number` are three different variables.

---

## 4. String Array Concatenation

### Question

What will be the output?

```java
String str[] = {"geeks", "for", "geeks"};
System.out.print(str[0] + str[1] + str[2]);
```

### Answer

**geeksforgeeks**

### Explanation

The `+` operator concatenates the three strings without spaces.

---

## 5. Array Indexing

### Question

What will be the output?

```java
int[] arr = {1, 2, 3, 4, 5};
System.out.println(arr[2]);
```

### Options

A) 1
B) 2
C) 3
D) 4

### Answer

**C) 3**

### Explanation

Array indexing starts from `0`.

```text
Index:  0  1  2  3  4
Value:  1  2  3  4  5
```

Therefore, `arr[2] = 3`.

---

## 6. Default Value of int Array

### Question

What will be the output?

```java
int[] arr = new int[3];
System.out.println(arr[0]);
```

### Options

A) null
B) 0
C) 1
D) undefined

### Answer

**B) 0**

### Explanation

The default value of an `int` array element is `0`.

---

## 7. ArrayIndexOutOfBoundsException

### Question

What will happen?

```java
int[] arr = {1, 2, 3};
System.out.println(arr[3]);
```

### Options

A) 3
B) Throws an exception
C) 0
D) undefined

### Answer

**B) Throws an exception**

### Explanation

Valid indices are `0`, `1`, and `2`. Accessing index `3` causes `ArrayIndexOutOfBoundsException`.

---

## 8. Array Length

### Question

What will be the output?

```java
String[] languages = {"Java", "Python", "C++"};
System.out.println(languages.length);
```

### Options

A) 2
B) 3
C) 4
D) None of the above

### Answer

**B) 3**

### Explanation

There are three elements in the array. `length` returns the number of elements.

---

## 9. Updating an Array Element

### Question

What will be the output?

```java
int[] numbers = {10, 20, 30, 40, 50};
numbers[2] = 60;
System.out.println(numbers[2]);
```

### Options

A) 30
B) 60
C) 20
D) 10

### Answer

**B) 60**

### Explanation

`numbers[2]` originally contains `30`. The statement changes it to `60`.

---

## 10. Array Reference Assignment

### Question

What will be the output?

```java
int[] a = {1, 2, 3};
int[] b = a;

b[0] = 10;

System.out.println(a[0]);
```

### Options

A) 1
B) 10
C) 0
D) 2

### Answer

**B) 10**

### Explanation

`a` and `b` refer to the same array object. Changing the array through `b` also changes what `a` sees.

---

## 11. Character Array

### Question

What will be the output?

```java
char[] arr = {'A', 'B', 'C'};
System.out.println(arr[1]);
```

### Options

A) A
B) B
C) C
D) None of the above

### Answer

**B) B**

### Explanation

Index `1` refers to the second element, which is `'B'`.

---

## 12. Nested Array Indexing

### Question

What will happen?

```java
int[] arr = {7, 8, 9};
System.out.println(arr[arr[1]]);
```

### Options

A) 7
B) 8
C) 9
D) Throws an exception

### Answer

**D) Throws an exception**

### Explanation

First:

```java
arr[1] = 8
```

Therefore the expression becomes:

```java
arr[8]
```

The valid indices are only `0`, `1`, and `2`, so an `ArrayIndexOutOfBoundsException` occurs.

---

## 13. Assigning Array Elements

### Question

What will be the output?

```java
double[] arr = {1.1, 2.2, 3.3};
arr[0] = arr[2];
System.out.println(arr[0]);
```

### Options

A) 1.1
B) 2.2
C) 3.3
D) None of the above

### Answer

**C) 3.3**

### Explanation

`arr[2]` contains `3.3`. Therefore:

```java
arr[0] = 3.3;
```

So the output is `3.3`.

---

## 14. Boolean Array Default Value

### Question

What will be the output?

```java
boolean[] arr = new boolean[5];
System.out.println(arr[3]);
```

### Options

A) true
B) false
C) null
D) Throws an exception

### Answer

**B) false**

### Explanation

The default value of every element in a `boolean` array is `false`.

---

# ArrayList

## 15. ArrayList isEmpty() and clear()

### Question

What is the output?

```java
import java.util.*;

class HelloWorld {
    public static void main(String[] args) {
        ArrayList<Integer> al = new ArrayList<Integer>();

        al.add(10);
        al.add(20);
        al.add(30);
        al.add(40);
        al.add(50);

        System.out.println(al.isEmpty());

        al.clear();

        System.out.println(al.isEmpty());
    }
}
```

### Options

A)

```text
false
false
```

B)

```text
false
true
```

C) Error

D) None of the above

### Answer

**B**

### Explanation

Initially the list contains elements, so `isEmpty()` returns `false`. After `clear()`, the list has no elements, so it returns `true`.

---

## 16. Time Complexity of ArrayList remove()

### Question

What is the time complexity of the `remove()` method of `ArrayList`?

### Options

A) O(1)
B) O(n)
C) O(log n)
D) None of the above

### Answer

**B) O(n)**

### Explanation

Removing an element from an ArrayList can require shifting subsequent elements. Therefore, the general worst-case complexity is **O(n)**.

> Note: `remove(int index)` and `remove(Object)` are both generally O(n).

---

## 17. Average Time for ArrayList Insertion

### Question

What is the average/amortized time complexity of inserting an element into an `ArrayList`?

### Options

A) θ(n + 1)
B) θ(1)
C) θ(n)
D) θ(n log n)

### Answer

**B) θ(1) amortized**

### Explanation

Most insertions at the end take constant time. Occasionally, resizing requires copying elements, but averaged over many insertions, the amortized cost is **O(1)**.

---

## 18. ArrayList Methods

### Question

Which of the following are methods of `ArrayList`?

A) Remove
B) Add
C) Contains
D) LastIndexOf
E) All of the above

### Answer

**E) All of the above**

### Explanation

`ArrayList` provides methods such as:

```java
add()
remove()
contains()
lastIndexOf()
```

---

## 19. ArrayList Resizing

### Question

How does `ArrayList` handle data when its internal array becomes full?

### Options

A) Creates a new larger array and copies the old data
B) Adds space to the existing array
C) Cannot allocate more memory
D) None of the above

### Answer

**D) None of the above**

### Explanation

`ArrayList` creates a **new larger internal array** and copies the existing elements into it. However, Java does not guarantee that the new array is exactly double the size, so option A is not generally correct.

---

## 20. Creating an ArrayList

### Question

What is the correct syntax to create an ArrayList of integers?

### Options

A)

```java
Arraylist<Integer> al = new Arraylist<Integer>();
```

B)

```java
Arraylist<Integer> al = new list[]();
```

C)

```java
Arraylist<Integer> al = new List<Integer>();
```

D) None of these

### Answer

**D) None of these**

### Explanation

Java is case-sensitive. The correct class name is `ArrayList`, not `Arraylist`.

Correct syntax:

```java
ArrayList<Integer> al = new ArrayList<Integer>();
```

or:

```java
ArrayList<Integer> al = new ArrayList<>();
```

---

## 21. Advantages of ArrayList over Arrays

### Question

What are the advantages of `ArrayList` over a normal array?

A) Rich library functions
B) Dynamic size
C) Constant-time random access
D) All of the above

### Answer

**D) All of the above**

### Explanation

`ArrayList` provides many built-in methods, dynamically grows as needed, and supports O(1) average random access using an index.

---

## 22. ListIterator

### Question

What is special about a List's iterator compared to a Collection's iterator?

### Options

A) It can be constructed easily
B) It can access all the data in the list
C) It can traverse backward in the list
D) None of these

### Answer

**C) It can traverse backward in the list**

### Explanation

`ListIterator` supports both forward and backward traversal.

For example:

```java
listIterator.next();
listIterator.previous();
```

A normal `Iterator` primarily supports forward traversal.

---

## 23. List Interface Hierarchy

### Question

`List` is inherited from which interface in Java?

### Options

A) Formattable
B) Serializable
C) Collection
D) None of these

### Answer

**C) Collection**

### Explanation

The hierarchy is:

```text
Collection
    ↓
   List
```

`List` extends the `Collection` interface.

---

## 24. Classes Implementing List

### Question

Which of the following classes implement the `List` interface?

A) ArrayList
B) Vector
C) LinkedList
D) None of these

### Answer

**A, B and C**

### Explanation

All three classes implement `List`:

```text
List
├── ArrayList
├── LinkedList
└── Vector
```

Therefore, if the MCQ had an **"All of the above"** option, that would be the correct choice.

---

# Quick Revision

| Topic                      | Key Point                              |
| -------------------------- | -------------------------------------- |
| Array indexing             | Starts from 0                          |
| `array.length`             | Number of elements                     |
| Invalid array index        | `ArrayIndexOutOfBoundsException`       |
| int array default          | `0`                                    |
| boolean array default      | `false`                                |
| char array default         | `'\u0000'`                             |
| String array default       | `null`                                 |
| Array assignment           | Two references can point to same array |
| ArrayList                  | Dynamic array                          |
| ArrayList random access    | O(1)                                   |
| ArrayList insertion at end | O(1) amortized                         |
| ArrayList removal          | O(n) generally                         |
| ArrayList search           | O(n)                                   |
| ArrayList `contains()`     | O(n)                                   |
| `clear()`                  | Removes all elements                   |
| `isEmpty()`                | Checks whether size is 0               |
| `List` extends             | `Collection`                           |
| List implementations       | ArrayList, LinkedList, Vector          |
| Iterator                   | Forward traversal                      |
| ListIterator               | Forward + backward traversal           |
