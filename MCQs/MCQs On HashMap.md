# MCQs On HashMap

## 1. What is the primary role of the hash function in a HashMap implementation?

A. To encrypt the values for secure storage.  
B. To sort the entries alphabetically by key.  
C. To compute an integer hash code from the key and map it to a valid bucket index. **✅ Correct Answer**  
D. To dynamically resize the underlying array when it becomes full.

**Explanation:** The hash function converts a key into a hash code, which is used to determine the bucket where the entry should be stored.

## 2. Why do many HashMap implementations (like Java's) enforce that the capacity (number of buckets) is always a power of two?

A. It allows fast modulo operations using efficient bitwise AND (`h & (length - 1)`) instead of division. **✅ Correct Answer**  
B. It guarantees that collisions will never occur regardless of the number of elements inserted.  
C. It ensures that all elements are automatically sorted in natural order.  
D. It prevents the load factor from ever exceeding 0.75.

**Explanation:** Power-of-two capacities allow Java's HashMap to efficiently calculate bucket indexes using bitwise operations.

## 3. What happens operationally when a HashMap's size exceeds the threshold (Capacity × Load Factor)?

A. The map throws a CapacityExceededException and stops accepting new keys.  
B. Existing keys are deleted to free up space for new entries.  
C. The load factor is automatically doubled while keeping the capacity the same.  
D. The internal array is resized (usually doubled) and all existing entries are rehashed into the new buckets. **✅ Correct Answer**

**Explanation:** When the threshold is exceeded, HashMap resizes its table and redistributes the entries into the expanded bucket array.

## 4. How does the separate chaining collision resolution strategy manage multiple keys that hash to the same bucket index?

A. By probing adjacent consecutive array indices until an empty slot is found.  
B. By storing colliding entries in a secondary data structure (like a linked list or tree) attached to that specific bucket. **✅ Correct Answer**  
C. By replacing the old entry with the new entry entirely, dropping the old value.  
D. By automatically expanding the total array capacity on every individual collision.

**Explanation:** Separate chaining keeps multiple entries in the same bucket using a linked structure or, in Java 8+, a tree structure when appropriate.

## 5. What is a primary structural difference between separate chaining and open addressing collision handling?

A. Open addressing stores all key-value pairs directly inside the primary array slots, whereas chaining uses auxiliary structures per bucket. **✅ Correct Answer**  
B. Chaining is susceptible to clustering, whereas open addressing completely eliminates any form of collisions.  
C. Open addressing requires linked lists, whereas chaining only works with contiguous memory blocks.  
D. Chaining reduces memory overhead to zero, whereas open addressing requires double the memory of chaining.

**Explanation:** Open addressing keeps entries in the table itself, while separate chaining stores collided entries through a structure associated with a bucket.

## 6. Assuming a good hash function and a well-distributed load factor, what is the average-case time complexity for `get(key)` and `put(key, value)` operations in a HashMap?

A. O(N)  
B. O(log N)  
C. O(1) **✅ Correct Answer**  
D. O(N log N)

**Explanation:** With good hashing and controlled collisions, HashMap lookup and insertion take constant time on average.

## 7. In the worst-case scenario where every single key inserted into a standard HashMap hashes to the same exact bucket index (using linked lists for chaining), what is the time complexity of a lookup operation?

A. O(1)  
B. O(log N)  
C. O(N log N)  
D. O(N) **✅ Correct Answer**

**Explanation:** If all entries are in one linked list, a lookup may need to examine every entry, resulting in O(N).

## 8. Which of the following statements is true about the HashMap class in Java?

A. It maintains the insertion order of the Map interface.  
B. It is synchronized.  
C. It is an implementation of the Map interface. **✅ Correct Answer**  
D. None of these.

**Explanation:** `HashMap` is a concrete class that implements the `Map` interface. It does not guarantee insertion order and is not synchronized.

## 9. Which of the following statements is true about the LinkedHashMap class in Java?

A. It does not allow null keys or values.  
B. It is an implementation of the Map interface. **✅ Correct Answer**  
C. It is an implementation of the HashMap interface.  
D. None of these.

**Explanation:** `LinkedHashMap` implements `Map` and extends `HashMap`, while maintaining a predictable iteration order.

## 10. What is the time complexity of the `get()` method in a HashMap in the worst case?

A. O(1)  
B. O(N) **✅ Correct Answer**  
C. O(N log N)  
D. O(log N)

**Explanation:** In the worst case, many keys may collide into one bucket, requiring a linear search through the bucket structure.

## 11. What is the syntax of creating a HashMap in Java?

A. `HashMap<K, V> map = new HashMap<>();` **✅ Correct Answer**  
B. `map<K, V> = new HashMap<>();`  
C. `HashMap<K, V> map = new HashMap();`  
D. None of these.

**Explanation:** The standard generic declaration is `HashMap<K, V> map = new HashMap<>();`. The diamond operator infers the generic types.

## 12. How is LinkedHashMap declared in Java?

A. `public class LinkedHashMap<K,V>`  
B. `public class LinkedHashMap<K,V> implements Map<K,V>`  
C. `public class LinkedHashMap<K,V> extends HashMap<K,V> implements Map<K,V>` **✅ Correct Answer**  
D. None of these.

**Explanation:** `LinkedHashMap` extends `HashMap` and implements `Map` through its class hierarchy.

## 13. What happens when a key-value pair already exists in the Map and we use `put()` to add a value associated with the same key?

A. It adds one more key-value pair of the same key.  
B. It adds two values for the same key.  
C. It throws an error.  
D. It replaces the pre-existing value. **✅ Correct Answer**

**Explanation:** A Map cannot have duplicate keys. Calling `put()` with an existing key replaces its associated value.

## 14. What is the output of the following code?

```java
import java.util.*;

class HelloWorld {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<String, Integer>();
        m.put("gfg", 10);
        m.put("ide", 16);
        m.put("courses", 25);
        System.out.print(m);
        System.out.print(m.size());

        for (Map.Entry<String, Integer> e : m.entrySet())
            System.out.print(e.getKey() + " " + e.getValue());
    }
}
```

A. `3courses 25gfg 10ide 16`  
B. Error  
C. `{courses=25, gfg=10, ide=16}3courses 25gfg 10ide 16`  
D. None of these. **✅ Correct Answer**

**Explanation:** `HashMap` does not guarantee iteration order, so the exact map/entry order shown in a particular run is not guaranteed. Therefore, none of the fixed-order outputs is universally correct.

## 15. What is the output of the following code?

```java
import java.util.*;

class HelloWorld {
    public static void main(String[] args) {
        HashMap<String, Integer> m = new HashMap<String, Integer>();
        m.put("gfg", 10);
        m.put("ide", 16);
        m.put("courses", 25);

        if (m.containsKey("ide"))
            System.out.println("yes");
        else
            System.out.println("no");

        m.remove("ide");
        System.out.println(m.size());
    }
}
```

A. `no` followed by `3`  
B. `yes` followed by `3`  
C. `yes` followed by `2` **✅ Correct Answer**  
D. `no` followed by `2`

**Explanation:** `"ide"` exists initially, so `containsKey()` prints `yes`. After removing it, two entries remain.

## 16. What is the output of the following code?

```java
import java.util.*;

class HelloWorld {
    public static void main(String[] args) {
        LinkedHashMap<Integer, String> m = new LinkedHashMap<>();

        m.put(10, "gfg");
        m.put(16, "IDE");
        m.put(25, "courses");

        m.remove(25);
        m.put(20, "practice");

        System.out.println(m);
    }
}
```

A. Throws an error  
B. `{10=gfg, 16=IDE, 20=practice}` **✅ Correct Answer**  
C. `{10=gfg, 16=IDE, 25=courses, 20=practice}`  
D. None of these.

**Explanation:** Key `25` is removed before key `20` is added. LinkedHashMap preserves insertion order, so the remaining entries appear as `10`, `16`, `20`.

## 17. What is the purpose of the `equals()` method in HashMap key-value pairs?

A. To compare the values of two keys.  
B. To determine if two keys are equal. **✅ Correct Answer**  
C. To compare the hash codes of two keys.  
D. To establish the order of keys in the HashMap.

**Explanation:** After hash codes identify a possible bucket, `equals()` is used to determine whether two keys are actually equal.

## 18. What is the default initial capacity of a HashMap in Java?

A. 0  
B. 10  
C. 16 **✅ Correct Answer**  
D. It depends on the JVM.

**Explanation:** The commonly documented default initial capacity of Java's HashMap is 16. In modern Java, the internal table is lazily allocated until entries are inserted.

## 19. What is the default load factor of a HashMap in Java?

A. 0.25  
B. 0.5  
C. 0.75 **✅ Correct Answer**  
D. 1.0

**Explanation:** Java's HashMap uses a default load factor of 0.75, balancing memory usage and collision frequency.

## 20. What is the time complexity of inserting a key-value pair into a HashMap?

A. O(1) **✅ Correct Answer**  
B. O(log N)  
C. O(N)  
D. O(N log N)

**Explanation:** Insertion is O(1) on average with a good hash function, although resizing or severe collisions can increase the cost.

## 21. What is the time complexity of retrieving a value from a HashMap using its key?

A. O(1) **✅ Correct Answer**  
B. O(log N)  
C. O(N)  
D. O(N log N)

**Explanation:** HashMap retrieval is O(1) on average because hashing directly identifies the relevant bucket.

## 22. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

System.out.println(map.get("two"));
```

A. 1  
B. 2 **✅ Correct Answer**  
C. 3  
D. null

**Explanation:** The key `"two"` is mapped to the value `2`, so `get("two")` returns `2`.

## 23. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("one", 3);

System.out.println(map.get("one"));
```

A. 1  
B. 2  
C. 3 **✅ Correct Answer**  
D. null

**Explanation:** The second `put("one", 3)` replaces the existing value `1` for the same key.

## 24. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.remove("one");

System.out.println(map.containsKey("one"));
```

A. true  
B. false **✅ Correct Answer**  
C. null  
D. An error occurs.

**Explanation:** `remove("one")` deletes the mapping, so `containsKey("one")` returns `false`.

## 25. What is the purpose of the `hashCode()` method in HashMap key-value pairs?

A. To compare the values of two keys.  
B. To determine if two keys are equal.  
C. To generate a unique identifier for each key.  
D. To establish the order of keys in the HashMap.

**Answer:** None of the listed options exactly describes the purpose. **✅ Correct Answer: The `hashCode()` method generates an integer hash code used to help locate a key's bucket.**

**Explanation:** `hashCode()` is used for bucket selection; it does not guarantee a unique identifier. Equal objects must have the same hash code.

## 26. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

System.out.println(map.keySet());
```

A. `[one, two, three]`  
B. `[one, two]`  
C. `[one, three]`  
D. `[two, three]`

**Answer:** No fixed option is guaranteed. **✅ Correct Answer: A set containing `one`, `two`, and `three` in unspecified order.**

**Explanation:** `keySet()` returns all keys, but HashMap does not guarantee their iteration order.

## 27. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

System.out.println(map.values());
```

A. `[1, 2, 3]`  
B. `[1, 2]`  
C. `[1, 3]`  
D. `[2, 3]`

**Answer:** No fixed option is guaranteed. **✅ Correct Answer: A collection containing `1`, `2`, and `3` in unspecified order.**

**Explanation:** `values()` returns all mapped values. Their iteration order is not guaranteed by HashMap.

## 28. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

System.out.println(map.containsKey("four"));
```

A. true  
B. false **✅ Correct Answer**  
C. null  
D. An error occurs.

**Explanation:** `"four"` is not a key in the map, so `containsKey("four")` returns `false`.

## 29. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

System.out.println(map.containsValue(2));
```

A. true **✅ Correct Answer**  
B. false  
C. null  
D. An error occurs.

**Explanation:** The value `2` is present in the map, so `containsValue(2)` returns `true`.

## 30. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

System.out.println(map.size());
```

A. 1  
B. 2  
C. 3 **✅ Correct Answer**  
D. 0

**Explanation:** The map contains three distinct key-value mappings, so `size()` returns `3`.

## 31. What is the output of the following code snippet?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

map.clear();

System.out.println(map.size());
```

A. 0 **✅ Correct Answer**  
B. 1  
C. 2  
D. 3

**Explanation:** `clear()` removes all mappings from the map, so its size becomes `0`.

## 32. What is the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

System.out.println(map.get("two"));
```

A. 2 **✅ Correct Answer**  
B. null  
C. Exception: Key not found  
D. 1

**Explanation:** `"two"` is associated with `2`, so `get("two")` returns `2`.

## 33. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);
map.put("one", 11);

System.out.println(map.get("one"));
```

A. 1  
B. 11 **✅ Correct Answer**  
C. null  
D. Exception: Duplicate key

**Explanation:** The second insertion using the same key replaces `1` with `11`.

## 34. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.remove("one");

System.out.println(map.containsKey("one"));
```

A. true  
B. false **✅ Correct Answer**  
C. null  
D. Exception: Key not found

**Explanation:** The `"one"` mapping is removed, so `containsKey("one")` returns `false`.

## 35. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.keySet().remove("one");

System.out.println(map.get("one"));
```

A. 1  
B. null **✅ Correct Answer**  
C. Exception: Key not found  
D. Exception: Invalid operation

**Explanation:** The key set is backed by the map. Removing a key from `keySet()` also removes its mapping from the map.

## 36. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.clear();

System.out.println(map.isEmpty());
```

A. true **✅ Correct Answer**  
B. false  
C. null  
D. Exception: Map is not empty

**Explanation:** After `clear()`, the map contains no entries, so `isEmpty()` returns `true`.

## 37. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.putIfAbsent("one", 11);

System.out.println(map.get("one"));
```

A. 1 **✅ Correct Answer**  
B. 11  
C. null  
D. Exception: Duplicate key

**Explanation:** `putIfAbsent()` does not replace an existing non-null mapping. Therefore, the value remains `1`.

## 38. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.computeIfAbsent("three", k -> 3);

System.out.println(map.get("three"));
```

A. 3 **✅ Correct Answer**  
B. null  
C. Exception: Key not found  
D. Exception: Invalid key

**Explanation:** Because `"three"` is absent, `computeIfAbsent()` computes and inserts the value `3`.

## 39. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.computeIfPresent("one", (k, v) -> v * 2);

System.out.println(map.get("one"));
```

A. 1  
B. 2 **✅ Correct Answer**  
C. null  
D. Exception: Key not found

**Explanation:** `"one"` is present with value `1`, so the function changes it to `1 * 2 = 2`.

## 40. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.merge("one", 11, Integer::sum);

System.out.println(map.get("one"));
```

A. 12 **✅ Correct Answer**  
B. 11  
C. 1  
D. Exception: Duplicate key

**Explanation:** Since `"one"` already maps to `1`, `merge()` applies `Integer::sum`: `1 + 11 = 12`.

## 41. What will be the output of the following code?

```java
HashMap<String, Integer> map = new HashMap<>();
map.put("one", 1);
map.put("two", 2);

map.replaceAll((k, v) -> v * 2);

System.out.println(map.get("one"));
System.out.println(map.get("two"));
```

A. `2` and `4` **✅ Correct Answer**  
B. `1` and `2`  
C. `null` and `null`  
D. Exception: Invalid operation

**Explanation:** `replaceAll()` applies the function to every mapping, changing `1` to `2` and `2` to `4`.

## 42. What does `getOrDefault()` return when the key is missing?

A. null  
B. The provided default value **✅ Correct Answer**  
C. Throws NullPointerException  
D. The first entry in the map

**Explanation:** If the key is absent, `getOrDefault(key, defaultValue)` returns the supplied default value.

## 43. Which iteration order does HashMap guarantee?

A. Insertion order  
B. Natural key order  
C. No guaranteed order **✅ Correct Answer**  
D. Reverse insertion order

**Explanation:** HashMap does not guarantee any particular iteration order. Use LinkedHashMap for insertion/access-order behavior or TreeMap for sorted-key order.

## 44. How do you create a thread-safe HashMap alternative?

A. `Collections.synchronizedMap(new HashMap<>())`  
B. `new Hashtable<>()`  
C. `new ConcurrentHashMap<>()`  
D. All of the above **✅ Correct Answer**

**Explanation:** All three approaches provide thread-safe map alternatives, although they have different concurrency and API characteristics. `ConcurrentHashMap` is generally preferred for modern concurrent applications.

## 45. What happens when two keys have the same `hashCode()` but are not equal?

A. One replaces the other.  
B. They go to the same bucket with `equals()` used to distinguish them. **✅ Correct Answer**  
C. Map throws an exception.  
D. Map discards both entries.

**Explanation:** Equal hash codes do not imply equal keys. HashMap uses `equals()` to distinguish different keys that share a bucket.

## 46. Which method copies mappings from another Map?

A. `put()`  
B. `putAll()` **✅ Correct Answer**  
C. `merge()`  
D. `clone()`

**Explanation:** `putAll()` copies all mappings from the specified map into the current map.

## 47. What is the default value returned by `remove(key)` when the key is absent?

A. false  
B. null **✅ Correct Answer**  
C. 0  
D. Empty Optional

**Explanation:** `remove(key)` returns the value previously associated with the key, or `null` if there was no mapping.

## 48. What does `clear()` do on a HashMap?

A. Removes all entries **✅ Correct Answer**  
B. Shrinks capacity to zero  
C. Removes half the entries  
D. Throws UnsupportedOperationException

**Explanation:** `clear()` removes all key-value mappings from the map. It does not necessarily reduce the internal table capacity to zero.

## 49. Which method checks for both key and expected value before removing?

A. `remove(key)`  
B. `remove(key, value)` **✅ Correct Answer**  
C. `compute()`  
D. `replaceAll()`

**Explanation:** `remove(key, value)` removes the mapping only when the specified key is currently mapped to the specified value.

## 50. What is the result of `putIfAbsent()` when the key already exists?

A. Replaces the value  
B. Leaves the map unchanged and returns the existing value **✅ Correct Answer**  
C. Removes the key  
D. Throws IllegalStateException

**Explanation:** If the key already has a non-null value, `putIfAbsent()` keeps it unchanged and returns the existing value.

## 51. Which interface do HashMap keys and values generically implement?

A. Serializable  
B. Cloneable  
C. No interface is required; any Object works **✅ Correct Answer**  
D. Comparable

**Explanation:** HashMap keys and values do not have to implement a particular interface. Objects used as keys should correctly implement `equals()` and `hashCode()`.

## 52. What does `size()` return?

A. Current capacity  
B. Number of entries **✅ Correct Answer**  
C. Load factor  
D. Hash bucket count

**Explanation:** `size()` returns the number of key-value mappings currently stored in the HashMap.

## 53. Which method replaces a value only if it is currently mapped?

A. `replace(key, value)` **✅ Correct Answer**  
B. `put(key, value)`  
C. `merge(key, value, fn)`  
D. `computeIfAbsent(key, fn)`

**Explanation:** `replace(key, value)` changes the value only when the specified key is already associated with a value.

## 54. How do you iterate over both keys and values at once?

A. `for (String k : map.keySet())`  
B. `for (Map.Entry<String, Integer> e : map.entrySet())` **✅ Correct Answer**  
C. `map.iterator()`  
D. `map.stream()`

**Explanation:** `entrySet()` provides each key-value mapping as a `Map.Entry`, allowing both key and value to be accessed together.

## 55. Which call returns a Set of all keys?

A. `map.values()`  
B. `map.entrySet()`  
C. `map.keySet()` **✅ Correct Answer**  
D. `map.keys()`

**Explanation:** `keySet()` returns a Set view containing all keys in the map.

## 56. Which statement is true about fail-fast iterators of HashMap?

A. They never throw exceptions.  
B. They throw `ConcurrentModificationException` on structural change. **✅ Correct Answer**  
C. They automatically synchronize modifications.  
D. They reorder entries to avoid conflicts.

**Explanation:** HashMap iterators are generally fail-fast and may throw `ConcurrentModificationException` if the map is structurally modified during iteration outside the iterator's supported operations.

## 57. What does `containsValue()` check?

A. Presence of a specific key  
B. Presence of a specific value **✅ Correct Answer**  
C. Both key and value  
D. Only null values

**Explanation:** `containsValue(value)` checks whether at least one mapping contains the specified value.

## 58. What is returned by `clone()` on a HashMap?

A. Deep copy of keys/values  
B. Shallow copy of the map structure **✅ Correct Answer**  
C. Empty map  
D. Immutable copy

**Explanation:** `clone()` creates a shallow copy of the HashMap. The keys and values themselves are not recursively cloned.

## 59. Which statement about nulls is true for HashMap?

A. Allows one null key and multiple null values **✅ Correct Answer**  
B. Forbids null keys but allows null values  
C. Forbids all nulls  
D. Allows unlimited null keys

**Explanation:** A HashMap permits one `null` key and can contain multiple `null` values.

## 60. Which operation can trigger a resize?

A. Adding entries beyond the threshold **✅ Correct Answer**  
B. Calling `size()`

**Explanation:** When the number of entries exceeds the resize threshold (`capacity × load factor`), HashMap can increase its internal table capacity.
