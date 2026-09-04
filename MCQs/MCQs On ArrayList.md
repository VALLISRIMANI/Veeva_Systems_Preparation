# MCQs On ArrayList

## 1. Which of the following is the correct way to get the first value in an ArrayList called `nums`?

A. `nums[0]`  
B. `nums.first()`  
C. `nums.get(0)` **✅ Correct Answer**  
D. `nums.get(1)`

**Explanation:** ArrayList elements are accessed using the `get(index)` method, and indexing starts from `0`.

## 2. Which interface does the ArrayList class implement?

A. Set  
B. Map  
C. List **✅ Correct Answer**  
D. Queue

**Explanation:** `ArrayList` is a concrete implementation of the `List` interface.

## 3. What is the default initial capacity of an ArrayList in Java if it is not specified?

A. 0  
B. 10 **✅ Correct Answer**  
C. 16  
D. 50

**Explanation:** The commonly taught/default initial capacity of ArrayList is 10. Modern Java implementations may allocate the internal array lazily when the first element is added.

## 4. Which statement is true regarding the synchronization of ArrayList?

A. ArrayList is thread-safe and fully synchronized.  
B. ArrayList methods are not synchronized, making it faster than Vector. **✅ Correct Answer**  
C. ArrayList can only be synchronized manually using the synchronized keyword on its reference.  
D. ArrayList automatically locks data during write modifications.

**Explanation:** ArrayList is not synchronized by default. Vector synchronizes its legacy methods, which can introduce synchronization overhead.

## 5. How does an ArrayList behave when its elements exceed its current internal capacity?

A. It throws an `IndexOutOfBoundsException`.  
B. It increases its capacity dynamically by 100%.  
C. It increases its capacity dynamically by roughly 50% of its current capacity. **✅ Correct Answer**  
D. It crashes the Java Virtual Machine (JVM).

**Explanation:** Java's ArrayList grows dynamically. In the standard implementation, its capacity is generally increased by about 50% when more space is required.

## 6. Which method should be used to change an existing element at a specific index in an ArrayList?

A. `add()`  
B. `put()`  
C. `set()` **✅ Correct Answer**  
D. `replaceAll()`

**Explanation:** `set(index, value)` replaces the element currently stored at the specified index.

## 7. What will be the output of the following Java code snippet?

```java
ArrayList<String> list = new ArrayList<>();
list.add("A");
list.add("B");
list.add(1, "C");
System.out.println(list);
```

A. `[A, B, C]`  
B. `[A, C, B]` **✅ Correct Answer**  
C. `[C, A, B]`  
D. `[A, B]`

**Explanation:** `add(1, "C")` inserts `C` at index 1 and shifts `B` to the next position.

## 8. Which utility method from the Java Collections class is used to sort an ArrayList?

A. `Sorter.sort(list);`  
B. `list.sortAll();`  
C. `Arrays.sort(list);`  
D. `Collections.sort(list);` **✅ Correct Answer**

**Explanation:** `Collections.sort(list)` sorts the elements of a List according to their natural ordering or a supplied comparator.

## 9. List is inherited from which interface in Java?

A. Formattable  
B. Serializable  
C. Collection **✅ Correct Answer**  
D. None of these

**Explanation:** `List` extends the `Collection` interface, which is part of the Java Collections Framework.

## 10. Which class/classes among the given are among the main classes which implement the List interface?

A. ArrayList  
B. Vector  
C. LinkedList  
D. All of the above **✅ Correct Answer**

**Explanation:** `ArrayList`, `Vector`, and `LinkedList` are all implementations of the `List` interface.

## 11. What is special about the List's iterator compared to the Collection's iterator?

A. It can be constructed easily.  
B. It can access all the data in the list.  
C. It can traverse backward in the list. **✅ Correct Answer**  
D. None of these

**Explanation:** A `ListIterator` extends `Iterator` and supports bidirectional traversal, including `previous()`.

## 12. What is the syntax to create an ArrayList of integers?

A. `Arraylist<Integer> al = new Arraylist<Integer>();`  
B. `Arraylist<Integer> al = new list[]();`  
C. `Arraylist<Integer> al = new List<Integer>();`  
D. None of these

**Answer:** None of the listed options is exactly correct. **✅ Correct Answer: `ArrayList<Integer> al = new ArrayList<Integer>();`**

**Explanation:** Java class names are case-sensitive, so the correct class name is `ArrayList`, not `Arraylist`. You can also use `new ArrayList<>()`.

## 13. Advantage of ArrayList over a normal array is/are:

A. Rich library functions  
B. Dynamic size  
C. Can access all the data at constant time  
D. All of the above **✅ Correct Answer**

**Explanation:** ArrayList provides many collection methods and dynamic resizing while still offering O(1) average positional access by index.

## 14. How does ArrayList handle data when it is full?

A. Creates a new array with larger capacity and copies old data to this array. **✅ Correct Answer**  
B. Adds space in the pre-existing array.  
C. Cannot allocate memory more than the memory allocated to it.  
D. None of the above.

**Explanation:** When capacity is insufficient, ArrayList creates a larger internal array and transfers the existing elements into it.

## 15. Average time to insert `n+1` items in an ArrayList is:

A. θ(n + 1)  
B. θ(1)  
C. θ(n) **✅ Correct Answer**  
D. θ(n log n)

**Explanation:** The total work for inserting `n+1` elements is linear when considering dynamic resizing through amortized analysis.

## 16. Among the given options, which is/are the methods of ArrayList in Java?

A. `remove()`  
B. `add()`  
C. `contains()`  
D. `lastIndexOf()`  
E. All of the above **✅ Correct Answer**

**Explanation:** ArrayList provides all four methods: `remove()`, `add()`, `contains()`, and `lastIndexOf()`.

## 17. What is the output of the following code?

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

A. `false` followed by `false`  
B. `false` followed by `true` **✅ Correct Answer**  
C. Error  
D. None of the above

**Explanation:** The list initially contains elements, so `isEmpty()` is false. `clear()` removes all elements, making it true afterward.

## 18. What is the time complexity of the `remove()` method of ArrayList?

A. O(1)  
B. O(n) **✅ Correct Answer**  
C. O(log n)  
D. None of the above

**Explanation:** Removing an element by index may require shifting subsequent elements, resulting in O(n) in the general case.

## 19. Which of the following classes implements the List interface?

A. HashMap  
B. ArrayList **✅ Correct Answer**  
C. HashSet  
D. TreeMap

**Explanation:** ArrayList implements the `List` interface, while HashMap and TreeMap implement `Map`, and HashSet implements `Set`.

## 20. What type of data structure is ArrayList based on?

A. Linked List  
B. Doubly Linked List  
C. Dynamic Array **✅ Correct Answer**  
D. Hash Table

**Explanation:** ArrayList is backed by a dynamically resizable array.

## 21. Which of the following statements about Vector is true?

A. It is not synchronized.  
B. It doubles its size when more capacity is needed. **✅ Correct Answer**  
C. It provides better performance than ArrayList in all scenarios.  
D. It does not implement the List interface.

**Explanation:** Traditionally, Vector doubles its capacity when it needs to grow, unless a different capacity increment is specified. Vector is also synchronized and implements List.

## 22. In which scenario would you prefer LinkedList over ArrayList?

A. When you need fast random access to elements.  
B. When frequent insertions and deletions are required. **✅ Correct Answer**  
C. When memory usage needs to be minimized.  
D. When thread safety is a priority.

**Explanation:** LinkedList can be advantageous when insertions and removals are frequent at known node positions, especially near the ends.

## 23. What is the time complexity for accessing an element at a specific index in LinkedList?

A. O(1)  
B. O(n) **✅ Correct Answer**  
C. O(log n)  
D. O(n log n)

**Explanation:** LinkedList must traverse nodes to reach a particular index, so indexed access is O(n).

## 24. Which of the following collections is synchronized?

A. ArrayList  
B. LinkedList  
C. Vector **✅ Correct Answer**  
D. None of the above

**Explanation:** Vector's legacy methods are synchronized, whereas ArrayList and LinkedList are not synchronized by default.

## 25. Which operation has a time complexity of O(1) in ArrayList?

A. Inserting an element at a specific index  
B. Removing an element from the middle  
C. Accessing an element by index **✅ Correct Answer**  
D. Both A and B

**Explanation:** ArrayList provides constant-time positional access using `get(index)`, assuming the index is valid.

## 26. What will happen if you exceed the initial capacity of an ArrayList?

A. An error will be thrown.  
B. The size remains fixed.  
C. It will resize by increasing its capacity. **✅ Correct Answer**  
D. It will automatically convert to a Vector.

**Explanation:** ArrayList dynamically increases its internal capacity when the current capacity is insufficient.

## 27. Which of the following is true about the LinkedList class?

A. It uses a fixed-size array.  
B. It can efficiently add and remove elements from both ends. **✅ Correct Answer**  
C. It requires less memory than ArrayList.  
D. It is faster than Vector for random access.

**Explanation:** LinkedList supports efficient insertion and removal at both ends through operations such as `addFirst()` and `removeLast()`.

## 28. How does the growth of an ArrayList compare to that of a Vector when resizing?

A. ArrayList grows by 50%, Vector grows by 100%. **✅ Correct Answer**  
B. ArrayList grows by 100%, Vector grows by 50%.  
C. Both grow by 50%.  
D. Both grow by 100%.

**Explanation:** The commonly taught Java behavior is approximately 50% growth for ArrayList and doubling for Vector. Exact implementation details can vary by Java version.

## 29. Which operation in a Vector is synchronized?

A. Add  
B. Remove  
C. Get  
D. All of the above **✅ Correct Answer**

**Explanation:** Vector's public methods such as adding, removing, and retrieving elements are synchronized.

## 30. Which data structure would you choose for implementing a queue?

A. ArrayList  
B. Vector  
C. LinkedList **✅ Correct Answer**  
D. Both A and B

**Explanation:** LinkedList provides queue-oriented operations such as `offer()`, `poll()`, and `peek()`. In production code, `ArrayDeque` is often preferred for a standard queue.

## 31. What is the default initial capacity of an ArrayList?

A. 5  
B. 10 **✅ Correct Answer**  
C. 15  
D. 20

**Explanation:** The commonly taught default initial capacity is 10, although modern Java implementations can allocate the backing array lazily.

## 32. Which of the following would be the best choice for a multi-threaded application requiring a list?

A. ArrayList  
B. Vector **✅ Correct Answer**  
C. LinkedList  
D. Both A and C

**Explanation:** Among these choices, Vector provides built-in synchronization. For modern applications, other concurrent list strategies may be preferable depending on the use case.

## 33. What is the primary disadvantage of using Vector compared to ArrayList?

A. It is not ordered.  
B. It is not resizable.  
C. It is synchronized and thus slower. **✅ Correct Answer**  
D. It does not implement the List interface.

**Explanation:** Vector's synchronization adds overhead when thread-safe operations are not required.

## 34. Which of the following collections allows fast access to elements by index?

A. LinkedList  
B. Vector  
C. ArrayList  
D. Both B and C **✅ Correct Answer**

**Explanation:** Both ArrayList and Vector use array-based storage and provide O(1) positional access by index.

## 35. Which of the following is an advantage of using LinkedList over ArrayList?

A. Faster access time for random elements.  
B. Less memory overhead.  
C. Better performance for insertions and deletions. **✅ Correct Answer**  
D. More straightforward implementation.

**Explanation:** LinkedList can insert or remove nodes efficiently when the relevant position/node is already known, without shifting subsequent elements.

## 36. In an ArrayList, how is the time complexity affected when an element is added at the end?

A. It is always O(1).  
B. It can be O(n) in the worst case. **✅ Correct Answer**  
C. It is always O(n).  
D. It is O(log n).

**Explanation:** Appending is O(1) amortized, but can become O(n) when resizing requires copying existing elements.

## 37. Which of the following has the best performance for inserting elements at the beginning of the list?

A. ArrayList  
B. Vector  
C. LinkedList **✅ Correct Answer**  
D. None of the above

**Explanation:** Adding at the beginning of an ArrayList or Vector requires shifting elements, while LinkedList can add at the front in O(1).

## 38. Which of the following collections is not recommended for use in a single-threaded environment?

A. ArrayList  
B. LinkedList  
C. Vector **✅ Correct Answer**  
D. None of the above

**Explanation:** Vector's synchronization can add unnecessary overhead in a single-threaded application, where ArrayList is commonly preferred.

## 39. Which collection has the lowest memory overhead per element?

A. ArrayList **✅ Correct Answer**  
B. Vector  
C. LinkedList  
D. All have the same overhead

**Explanation:** ArrayList generally has lower per-element memory overhead because it stores references in a contiguous array, whereas LinkedList requires node objects and links.

## 40. Which collection would you choose if you require frequent traversal through the elements?

A. ArrayList  
B. Vector  
C. LinkedList  
D. Both A and B **✅ Correct Answer**

**Explanation:** Both ArrayList and Vector provide efficient sequential traversal over array-backed storage. ArrayList is generally preferred when synchronization is unnecessary.

## 41. What is the primary difference in default resizing strategy between ArrayList and Vector?

A. ArrayList increases by 50%, Vector by 100%. **✅ Correct Answer**  
B. ArrayList decreases by 50%, Vector increases by 50%.  
C. Both increase by 100%.  
D. Both increase by 50%.

**Explanation:** Traditionally, ArrayList grows by about 50%, while Vector doubles its capacity when additional space is needed.

## 42. Which of the following can contain duplicate elements?

A. ArrayList only  
B. Vector only  
C. LinkedList only  
D. All of the above **✅ Correct Answer**

**Explanation:** ArrayList, Vector, and LinkedList all implement List, and List collections allow duplicate elements.

## 43. In terms of performance for random access, which collection is the slowest?

A. ArrayList  
B. Vector  
C. LinkedList **✅ Correct Answer**  
D. All are equal

**Explanation:** LinkedList requires traversal to reach an indexed element, making random access O(n), unlike ArrayList and Vector.

## 44. Which of the following is true regarding iterators in these collections?

A. ArrayList and LinkedList iterators are fail-fast.  
B. Vector iterator is fail-safe.  
C. All three iterators are fail-fast. **✅ Correct Answer**  
D. None of the iterators are fail-fast.

**Explanation:** The standard iterators of ArrayList, LinkedList, and Vector are generally fail-fast and may throw `ConcurrentModificationException` after an unsupported structural modification.

## 45. Which of the following would be most efficient for implementing a stack?

A. ArrayList  
B. Vector  
C. LinkedList **✅ Correct Answer**  
D. None of the above

**Explanation:** LinkedList supports efficient insertion and removal at an end, making it suitable for stack operations. In modern Java, `ArrayDeque` is generally preferred for a stack.

## 46. Which collection is more likely to waste memory due to over-allocation?

A. ArrayList  
B. Vector **✅ Correct Answer**  
C. LinkedList  
D. All waste memory equally

**Explanation:** Vector's default doubling strategy can result in a larger unused capacity after resizing compared with ArrayList's typical ~50% growth.

## 47. In which scenario would using Vector be a bad choice?

A. In a single-threaded application **✅ Correct Answer**  
B. In a multi-threaded application  
C. When frequent resizing is expected  
D. When a fixed-size list is needed

**Explanation:** Vector's synchronization can add unnecessary overhead in single-threaded applications where thread safety is not required.

## 48. Which of the following collections does not maintain the order of insertion?

A. ArrayList  
B. Vector  
C. LinkedList  
D. None of the above **✅ Correct Answer**

**Explanation:** ArrayList, Vector, and LinkedList preserve the order in which elements are inserted. Hash-based collections such as HashSet and HashMap do not guarantee insertion order.
