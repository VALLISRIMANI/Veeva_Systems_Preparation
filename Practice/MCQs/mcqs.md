## Java MCQs with Correct Answers & Explanations

### 1. How is encapsulation primarily achieved in Java?

A. By using public variables and public methods
**B. By using private variables and public getter/setter methods** ✅
C. By using abstract classes only
D. By utilizing multiple inheritance

**Answer:** **B**

**Explanation:**
Encapsulation means hiding the internal state of an object. This is achieved by declaring instance variables as `private` and providing controlled access through `public` getter and setter methods.

---

### 2. Which of the following statements about interfaces in Java is correct?

A. An interface can contain constructors.
**B. Interfaces support multiple inheritance in Java.** ✅
C. Interfaces can be instantiated directly using the `new` keyword.
D. Interfaces can only contain final and static methods.

**Answer:** **B**

**Explanation:**
A class can implement multiple interfaces, allowing Java to support multiple inheritance of type while avoiding the ambiguity of multiple class inheritance.

---

### 3. When does overloading **not** occur?

A. More than one method with the same name but different parameter list.
**B. More than one method with the same name and same parameter list (same signature).** ✅
C. Same name, same number of parameters but different parameter types.
D. Same name, same parameter types but different signature.

**Answer:** **B**

**Explanation:**
Method overloading requires the methods to have **different parameter lists**. Changing only the return type does **not** overload a method.

Example:

```java
void display(int a) {}
void display(int a) {}   // Compile-time error
```

---

### 4. In Java, which statement about inheritance is true?

A. A class can extend multiple classes.
**B. A subclass inherits methods from its superclass.** ✅
C. Inheritance can only be achieved through interfaces.
D. Constructors are inherited by subclasses.

**Answer:** **B**

**Explanation:**
A subclass inherits accessible fields and methods from its superclass. Constructors are **not** inherited.

---

### 5. What is the result of using the `equals()` method in Java?

A. It compares object references.
**B. It compares object content.** ✅
C. It must be overridden in every class.
D. It compares class types.

**Answer:** **B**

**Explanation:**
`equals()` is used for **logical/content equality**.

Example:

```java
String s1 = new String("Java");
String s2 = new String("Java");

System.out.println(s1 == s2);      // false
System.out.println(s1.equals(s2)); // true
```

---

### 6. Why is it important to override the `hashCode()` method when overriding `equals()`?

A. To ensure unique object identity.
**B. To maintain the general contract for hash tables.** ✅
C. To optimize memory usage.
D. To allow method overloading.

**Answer:** **B**

**Explanation:**
If two objects are equal according to `equals()`, they **must** return the same hash code. Otherwise, collections like `HashMap` and `HashSet` won't work correctly.

---

### 7. Which of the following is true about the `Object` class in Java?

**A. All classes inherit from Object.** ✅
B. Object class cannot be subclassed.
C. Object class provides no methods.
D. Object class has no constructors.

**Answer:** **A**

**Explanation:**
Every Java class directly or indirectly extends the `Object` class.

---

### 8. In Java, what is the visibility of a `protected` attribute?

A. Accessible only within its own package.
B. Accessible only within subclasses.
**C. Accessible within its own package and subclasses.** ✅
D. Accessible from anywhere.

**Answer:** **C**

**Explanation:**
`protected` members are accessible:

* Within the same package.
* In subclasses, even if they are in different packages.

---

### 9. What is the visibility of `private` attributes in Java?

A. Accessible from anywhere.
**B. Accessible only within the same class.** ✅
C. Accessible from subclasses.
D. Accessible within its own package.

**Answer:** **B**

**Explanation:**
`private` members cannot be accessed outside their own class.

---

### 10. Which of the following statements is true about multiple inheritance in Java?

**A. A class can implement multiple interfaces.** ✅
B. A class can extend multiple classes.
C. Multiple inheritance is allowed for classes and interfaces.
D. A class can inherit from multiple abstract classes.

**Answer:** **A**

**Explanation:**
Java does not support multiple inheritance of classes but allows implementing multiple interfaces.

---

### 11. Output of the following program

```java
public class Demo {
    public static void main(String[] arr) {
        Integer num1 = 100;
        Integer num2 = 100;
        Integer num3 = 500;
        Integer num4 = 500;

        if(num1 == num2)
            System.out.println("num1 == num2");
        else
            System.out.println("num1 != num2");

        if(num3 == num4)
            System.out.println("num3 == num4");
        else
            System.out.println("num3 != num4");
    }
}
```

A.

```
num1 == num2
num3 == num4
```

**B.**

```
num1 == num2
num3 != num4
```

✅

C.

```
num1 != num2
num3 == num4
```

D.

```
num1 != num2
num3 != num4
```

**Answer:** **B**

**Explanation:**
Java caches `Integer` objects in the range **-128 to 127**.

* `100` is cached → same object → `==` returns `true`.
* `500` is not cached → different objects → `==` returns `false`.

Output:

```
num1 == num2
num3 != num4
```

---

### 12. Output of the following program

```java
class Demo3 {
    public static void main(String args[]) {
        byte[] arr = {97, 98, 99, 100, 101};
        String str2 = new String(arr);

        System.out.println(str2);
    }
}
```

**Answer:** **abcde** ✅

**Explanation:**
The byte values represent ASCII characters:

* 97 → a
* 98 → b
* 99 → c
* 100 → d
* 101 → e

Output:

```
abcde
```

---

### 13. Output of the following program

```java
class Demo4 {
    public static void main(String args[]) {
        String str = "Java Programming";
        char ch = str.charAt(2);
        System.out.println(ch);
    }
}
```

**Answer:** **v** ✅

**Explanation:**

String indexing:

```
J  a  v  a     P  r  o  g ...
0  1  2  3
```

`charAt(2)` returns `'v'`.

Output:

```
v
```

---

### 14. When a class implements an interface, which of the following must be implemented?

A. Only abstract methods
B. Only non-abstract methods
C. Both abstract and non-abstract methods
D. Only static methods

**Answer:** **A** ✅

**Explanation:**
A class implementing an interface must provide implementations for all its **abstract methods**, unless the class itself is declared `abstract`.

---

### 15. What happens if a method in a subclass has the same name and parameters as a method in its superclass?

A. The superclass method is executed
**B. The subclass method is executed** ✅
C. A compile-time error occurs
D. The program fails to run

**Answer:** **B**

**Explanation:**
This is called **method overriding**. At runtime, Java uses **dynamic method dispatch**, so the subclass version of the method is executed.

---

### 16. Which of the following correctly describes a Java interface?

A. It can have method implementations.
B. It can contain instance variables.
C. It can extend multiple classes.
**D. It can only contain abstract methods.** ✅

**Answer:** **D**

**Explanation:**
Traditionally, interfaces contained only abstract methods. Since Java 8, interfaces can also have `default` and `static` methods, and since Java 9, `private` methods. However, for standard MCQs, the expected answer is that interfaces primarily define abstract methods.

---

### 17. What is the purpose of the `Serializable` interface in Java?

A. To create a deep copy of an object.
**B. To allow objects to be serialized.** ✅
C. To enable thread safety.
D. To implement cloning.

**Answer:** **B**

**Explanation:**
`Serializable` is a **marker interface** that allows an object's state to be converted into a byte stream so it can be stored or transmitted.

---

### 18. How do you prevent a method from being overridden in a subclass?

**A. Declare it as `final`.** ✅
B. Declare it as `private`.
C. Declare it as `static`.
D. Declare it as `abstract`.

**Answer:** **A**

**Explanation:**
A `final` method cannot be overridden by subclasses.

---

### 19. Which of the following statements about multiple inheritance of interfaces is true?

**A. It is allowed in Java.** ✅
B. It is not allowed in Java.
C. It leads to ambiguity.
D. Only one interface can be inherited.

**Answer:** **A**

**Explanation:**
Java allows a class to implement multiple interfaces, providing multiple inheritance of type.

---

### 20. Which of the following keywords is used to declare an inner class?

A. `inner`
B. `static`
C. `public`
**D. `class`** ✅

**Answer:** **D**

**Explanation:**
There is no special keyword called `inner`. An inner class is declared using the normal `class` keyword inside another class.

---

### 21. What is the result of attempting to cast an object to a class that it does not inherit from?

A. Compile-time error
**B. Run-time exception** ✅
C. It will return `null`.
D. It will create a new instance.

**Answer:** **B**

**Explanation:**
If the cast is syntactically valid but the object is not actually an instance of the target class, Java throws a `ClassCastException` at runtime.

---

### 22. In the context of object serialization, what is a `serialVersionUID`?

**A. A unique identifier for each serializable class.** ✅
B. A method used for serialization.
C. A variable that holds serialized data.
D. A marker interface.

**Answer:** **A**

**Explanation:**
`serialVersionUID` is a unique version identifier used during serialization and deserialization to verify class compatibility.

---

### 23. What is the purpose of a marker interface in Java?

A. To provide methods for implementation.
**B. To mark a class for specific behavior.** ✅
C. To prevent multiple inheritance.
D. To enforce type safety.

**Answer:** **B**

**Explanation:**
A marker interface contains no methods. It simply marks a class so the JVM or framework can provide special behavior.

Examples:
- `Serializable`
- `Cloneable`

---

### 24. Which of the following statements about static members is true?

A. Static members are associated with the instance of a class.
**B. Static members can be accessed without creating an instance of a class.** ✅
C. Static members cannot be inherited.
D. Static members can only be private.

**Answer:** **B**

**Explanation:**
Static members belong to the class rather than its objects and can be accessed using the class name.

---

### 25. What is the output of the following program?

```java
class Test {
    public final int a;
}

class Example {
    public static void main(String args[]) {
        Test obj = new Test();
        System.out.println(obj.a);
    }
}
```

A. 0
B. Garbage value
**C. Compile-time error: variable is not initialized** ✅
D. Run-time error: `a` is the blank variable

**Answer:** **C**

**Explanation:**
`a` is a **blank final** instance variable. It must be initialized either where it is declared or inside every constructor.

Since no constructor initializes `a`, the program fails to compile.

---

### 26. What is the output of the following program?

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

A. 0
B. Garbage value
C. Compile-time error
**D. No output (Blank Screen)** ✅

**Answer:** **D**

**Explanation:**
`public void Example(int x)` is **not a constructor** because it has a return type (`void`).

Java provides a default constructor since no constructor is defined. The object is created successfully, but nothing is printed.

---

### 27. What is the output of the following program?

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

**A. x = 5** ✅
B. 5
C. Compile-time error: ambiguous call of Example(int)
D. Run-time error

**Answer:** **A**

**Explanation:**
`new Example(5)` calls the constructor `Example(int)`, which prints:

```
x = 5
```

The method `void Example(int)` is a normal method and is never called.

---

### 28. What is the output of the following program?

```java
class Test {

    public static void main(String args[]) {

        String str1 = new String("Hello World");
        String str2 = new String("Hello World");

        String str3 = "Hello World";
        String str4 = "Hello World";

        int a = 0, b = 0, c = 0;

        if (str3 == str4)
            a = 1;
        else
            a = 2;

        if (str1.equals(str3))
            b = 1;
        else
            b = 2;

        if (str1 == str4)
            c = 1;
        else
            c = 2;

        System.out.println("a= " + a + " b= " + b + " c= " + c);
    }
}
```

A. a=2 b=1 c=2
B. a=2 b=2 c=2
C. a=1 b=2 c=1
**D. a=1 b=1 c=2** ✅

**Answer:** **D**

**Explanation:**

- `str3 == str4` → `true` (same String pool object)
- `str1.equals(str3)` → `true` (contents are equal)
- `str1 == str4` → `false` (different objects)

Output:

```
a= 1 b= 1 c= 2
```

---

### 29. How many objects are created in the above program?

A. 1
B. 2
**C. 3** ✅
D. 4

**Answer:** **C**

**Explanation:**

Objects created:

1. `new String("Hello World")`
2. `new String("Hello World")`
3. One `"Hello World"` object in the String Constant Pool

Total objects = **3**.

---

### 30. What is the output of the following program?

```java
import java.util.HashMap;
import java.util.Map;

public class MyClass {

    public static void main(String args[]) {

        Map<String, String> hashMap = new HashMap<>();

        hashMap.put(new String("a"), "audi");
        hashMap.put(new String("a"), "ferrari");

        System.out.println(hashMap);
    }
}
```

A. `{a=audi}`
**B. `{a=ferrari}`** ✅
C. `{a=audi, a=ferrari}`
D. Compile-time error

**Answer:** **B**

**Explanation:**
`HashMap` uses `equals()` and `hashCode()`.

Both keys have the same content `"a"`, so the second `put()` replaces the first value.

Output:

```text
{a=ferrari}
```

---

### 31. What is the output of the following program?

```java
import java.util.IdentityHashMap;
import java.util.Map;

public class MyClass {

    public static void main(String args[]) {

        Map<String, String> identityHashMap =
                new IdentityHashMap<>();

        identityHashMap.put(new String("a"), "audi");
        identityHashMap.put(new String("a"), "ferrari");

        System.out.println(identityHashMap);
    }
}
```

A. `{a=ferrari}`
B. `{a=audi}`
**C. `{a=audi, a=ferrari}`** ✅
D. Compile-time error

**Answer:** **C**

**Explanation:**
`IdentityHashMap` compares keys using `==` (reference equality) instead of `equals()`.

Since `new String("a")` creates two different objects, both entries are stored.

Output (order may vary):

```text
{a=audi, a=ferrari}
```

or

```text
{a=ferrari, a=audi}
```

Both represent two separate entries.

### 32. What is the output of the following program?

```java
public class StringTest {
    public static void main(String[] args) {
        System.out.print(10 + 20 + "Java" + 10 + 20);
    }
}
```

A. 1020Java1020  
B. 30Java30  
**C. 30Java1020** ✅  
D. 1020Java30

**Answer:** **C**

**Explanation:**

`+` works as arithmetic addition until it encounters a `String`.

Evaluation:

```java
10 + 20 = 30
30 + "Java" = "30Java"
"30Java" + 10 = "30Java10"
"30Java10" + 20 = "30Java1020"
```

**Output:**

```
30Java1020
```

---

### 33. What is the output of the following program?

```java
public class CacheTest {
    public static void main(String[] args) {
        Integer num1 = 100;
        Integer num2 = 100;
        Integer num3 = 150;
        Integer num4 = 150;

        System.out.print((num1 == num2) + " " + (num3 == num4));
    }
}
```

A. true true  
B. false false  
**C. true false** ✅  
D. false true

**Answer:** **C**

**Explanation:**

Java caches `Integer` objects from **-128 to 127**.

- `100` is cached → same object → `==` is `true`
- `150` is outside cache → different objects → `==` is `false`

**Output**

```
true false
```

---

### 34. What is the output of the following program?

```java
public class ExceptionTest {

    public static int getValue() {
        try {
            return 1;
        } catch (Exception e) {
            return 2;
        } finally {
            return 3;
        }
    }

    public static void main(String[] args) {
        System.out.print(getValue());
    }
}
```

A. 1

B. 2

**C. 3** ✅

D. Compilation Error

**Answer:** **C**

**Explanation:**

Whenever a `finally` block contains a `return` statement, it overrides every previous return.

Execution:

```
try → return 1
finally → return 3
```

Output

```
3
```

---

### 35. What is the output of the following program?

```java
public class OverloadTest {

    public static void testMethod(Object o) {
        System.out.print("Object");
    }

    public static void testMethod(String s) {
        System.out.print("String");
    }

    public static void main(String[] args) {
        testMethod(null);
    }
}
```

A. Object

**B. String** ✅

C. Compilation Error

D. NullPointerException

**Answer:** **B**

**Explanation:**

During overload resolution, Java chooses the **most specific** method.

`String` is more specific than `Object`.

Therefore,

```java
testMethod(null);
```

calls

```java
testMethod(String s)
```

Output

```
String
```

---

### 36. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {
        System.out.println('j' + 'a' + 'v' + 'a');
    }
}
```

A. java

B. jav

**C. 418** ✅

D. Compilation Error

**Answer:** **C**

**Explanation:**

Characters are converted to their ASCII values.

```
'j' = 106
'a' = 97
'v' =118
'a' = 97
```

```
106 + 97 +118 +97 = 418
```

Output

```
418
```

---

### 37. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {

        Integer num1 = 400;
        Integer num2 = 400;

        if (num1 == num2)
            System.out.println(0);
        else
            System.out.println(1);
    }
}
```

A. 0

**B. 1** ✅

C. true

D. false

**Answer:** **B**

**Explanation:**

`400` is outside Integer cache.

Hence,

```
num1 == num2
```

compares references.

Different objects ⇒ false.

Output

```
1
```

---

### 38. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {

        int i = 20 + +9 - -12 + +4 - -13 + +19;

        System.out.println(i);
    }
}
```

A. 65

B. 71

**C. 77** ✅

D. 84

**Answer:** **C**

**Explanation:**

Expression becomes

```
20 + 9 +12 +4 +13 +19
```

```
=77
```

Output

```
77
```

---

### 39. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {

        System.out.println(10 + 20 + "Java");
        System.out.println("Java" + 10 + 20);
    }
}
```

**Answer:** ✅

```
30Java
Java1020
```

**Explanation:**

First statement

```
10+20=30
30+"Java"
```

Output

```
30Java
```

Second statement

String concatenation starts immediately.

```
Java10
Java1020
```

---

### 40. What is the output of the following program?

```java
public class FinallyBlockTest {

    public static void main(String[] args) {

        try {
            System.out.println("Inside try block");
            System.exit(0);
        }

        catch(Exception e) {
            System.out.println("Inside catch block");
        }

        finally {
            System.out.println("Inside finally block");
        }

        System.out.println("Outside try-catch-finally block");
    }
}
```

A.

```
Inside try block
Inside finally block
Outside try-catch-finally block
```

**B.**

```
Inside try block
```
✅

C.

```
Inside try block
Inside finally block
```

D. Compilation Error

**Answer:** **B**

**Explanation:**

`System.exit(0)` immediately terminates the JVM.

Therefore,

- finally block is **not executed**
- remaining statements are skipped

Output

```
Inside try block
```

---

### 41. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {

        System.out.println(1.0 / 0);
        System.out.println(0.0 / 0);
        System.out.println(0 / 0);
    }
}
```

A.

```
Infinity
NaN
ArithmeticException
```
✅

B.

```
Infinity
Infinity
Infinity
```

C.

```
NaN
NaN
ArithmeticException
```

D. Compilation Error

**Answer:** **A**

**Explanation:**

Floating-point division follows IEEE 754 rules.

```
1.0/0 → Infinity
```

```
0.0/0 → NaN
```

Integer division by zero throws

```
ArithmeticException
```

So the program prints

```
Infinity
NaN
```

and then terminates with

```
java.lang.ArithmeticException: / by zero
```

### 42. What is the output of the following program?

```java
public class Test {
    public static void main(String[] args) {
        System.out.println(10 * 20 + "Hello");
        System.out.println("Hello" + 10 * 20);
    }
}
```

A.
```
200Hello
Hello200
```

B.
```
200Hello
Hello1020
```

C. Compilation Error ✅

D. Runtime Error

**Answer:** **C**

**Explanation:**

First statement:

```java
10 * 20 + "Hello"
```

is valid.

```
10 * 20 = 200
```

Output would be:

```
200Hello
```

However, the second statement

```java
"Hello" + 10 * 20
```

is interpreted as

```java
("Hello" + 10) * 20
```

Since `*` cannot be applied to a `String` and an `int`, the program fails to compile.

> **Correction:** The program produces a **compile-time error**, so nothing is printed.

---

### 43. What is the output of the following program?

```java
public class Test {
    public static void main(String[] args) {
        String s = "abc";
        s.toUpperCase();
        System.out.println(s);
    }
}
```

A. ABC

**B. abc** ✅

C. Abc

D. Compilation Error

**Answer:** **B**

**Explanation:**

Strings are **immutable**.

`toUpperCase()` returns a **new String**.

Since the returned value is not assigned,

```java
s
```

still refers to

```
abc
```

Output

```
abc
```

---

### 44. What is the output of the following program?

```java
public class Code {

    public static void main(String[] args) {
        method(null);
    }

    public static void method(Object o) {
        System.out.println("Object method");
    }

    public static void method(String s) {
        System.out.println("String method");
    }
}
```

A. Object method

**B. String method** ✅

C. Compilation Error

D. NullPointerException

**Answer:** **B**

**Explanation:**

`null` matches both methods.

Java chooses the **most specific** overloaded method.

`String` is more specific than `Object`.

Output

```
String method
```

---

### 45. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {

        String s = new String("5");

        System.out.println(1 + 10 + s + 1 + 10);
    }
}
```

A. 1105110

B. 15

**C. 115110** ✅

D. Compilation Error

**Answer:** **C**

**Explanation:**

Evaluation:

```
1+10=11
```

```
11+"5" → "115"
```

```
115+1 → 1151
```

```
1151+10 → 115110
```

Output

```
115110
```

---

### 46. What is the output of the following program?

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

public class Test {

    public static void main(String[] args) {

        A a1 = new A();
        A a2 = new A();
    }
}
```

A.
```
12323
```
✅

B.
```
1233
```

C.
```
12233
```

D.
```
1323
```

**Answer:** **A**

**Explanation:**

Static block executes **only once**.

For each object,

- instance initializer executes
- constructor executes

Execution:

```
Static block → 1

First object
2
3

Second object
2
3
```

Final output

```
12323
```

---

### 47. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {
        new Test().print(null);
    }

    public void print(Object o) {
        System.out.println("Object");
    }

    public void print(String s) {
        System.out.println("String");
    }
}
```

A. Object

**B. String** ✅

C. Compilation Error

D. Runtime Error

**Answer:** **B**

**Explanation:**

Among overloaded methods, Java selects the most specific match.

`String` is more specific than `Object`.

Output

```
String
```

---

### 48. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {

        double a = 0.1 + 0.2;

        System.out.println(a == 0.3);
        System.out.println(a);
    }
}
```

A.
```
true
0.3
```

**B.**
```
false
0.30000000000000004
```
✅

C.
```
false
0.3
```

D. Compilation Error

**Answer:** **B**

**Explanation:**

Floating-point numbers cannot always be represented exactly.

```
0.1 + 0.2
```

actually becomes

```
0.30000000000000004
```

Therefore,

```
a==0.3
```

is

```
false
```

Output

```
false
0.30000000000000004
```

---

### 49. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {

        try {
            System.out.println("A");
            throw new RuntimeException("Test");
        }

        catch(RuntimeException e) {
            System.out.println("B");
        }

        finally {
            System.out.println("C");
        }
    }
}
```

A.
```
A
```

B.
```
A
B
```

**C.**
```
A
B
C
```
✅

D. Runtime Exception

**Answer:** **C**

**Explanation:**

Execution:

```
try → prints A

Exception thrown

catch → prints B

finally → always executes
```

Output

```
A
B
C
```

---

### 50. What is the output of the following program?

```java
public class Test {

    public static void main(String[] args) {
        new Test().print(1,2,3);
    }

    public void print(int... numbers) {
        System.out.println("int...");
    }

    public void print(Integer i1,Integer i2) {
        System.out.println("Integer");
    }
}
```

A. Integer

**B. int...** ✅

C. Compilation Error

D. Runtime Error

**Answer:** **B**

**Explanation:**

Method call

```java
print(1,2,3);
```

contains **three arguments**.

Only the varargs method

```java
print(int... numbers)
```

matches.

Output

```
int...
```

---

### 51. What is the output of the following program?

```java
import java.util.*;

public class priorityQueue {

    public static void main(String[] args) {

        PriorityQueue<Integer> queue = new PriorityQueue<>();

        queue.add(11);
        queue.add(10);
        queue.add(22);
        queue.add(5);
        queue.add(12);
        queue.add(2);

        while(!queue.isEmpty())
            System.out.printf("%d ",queue.remove());
    }
}
```

A.
```
11 10 22 5 12 2
```

B.
```
2 12 5 22 10 11
```

**C.**
```
2 5 10 11 12 22
```
✅

D.
```
22 12 11 10 5 2
```

**Answer:** **C**

**Explanation:**

A `PriorityQueue` in Java is implemented as a **min-heap**.

Each call to `remove()` returns the smallest element.

Output

```
2 5 10 11 12 22
```

### 52. What is the output of the following program?

```java
import java.util.*;

public class Treeset {
    public static void main(String[] args) {

        TreeSet<String> treeSet = new TreeSet<>();

        treeSet.add("Geeks");
        treeSet.add("For");
        treeSet.add("Geeks");
        treeSet.add("GeeksforGeeks");

        for (String temp : treeSet)
            System.out.printf(temp + " ");
    }
}
```

A. Geeks For Geeks GeeksforGeeks

B. Geeks For GeeksforGeeks

**C. For Geeks GeeksforGeeks** ✅

D. For GeeksforGeeks Geeks

**Answer:** **C**

**Explanation:**

`TreeSet` has the following properties:

- Stores **unique** elements (duplicates are removed).
- Maintains elements in **sorted (natural) order**.

Elements inserted:

```
Geeks
For
Geeks (duplicate)
GeeksforGeeks
```

After removing the duplicate and sorting alphabetically:

```
For Geeks GeeksforGeeks
```

---

### 53. What is the output of the following program?

```java
import java.util.*;

public class linkedList {

    public static void main(String[] args) {

        List<String> list1 = new LinkedList<>();

        list1.add("Geeks");
        list1.add("For");
        list1.add("Geeks");
        list1.add("GFG");
        list1.add("GeeksforGeeks");

        List<String> list2 = new LinkedList<>();
        list2.add("Geeks");

        list1.removeAll(list2);

        for (String temp : list1)
            System.out.printf(temp + " ");
    }
}
```

A. For Geeks GFG GeeksforGeeks

B. For GeeksforGeeks GFG

C. For GFG For

**D. For GFG GeeksforGeeks** ✅

**Answer:** **D**

**Explanation:**

`removeAll()` removes **every occurrence** of each element present in `list2`.

Original list:

```
Geeks
For
Geeks
GFG
GeeksforGeeks
```

After removing all `"Geeks"`:

```
For
GFG
GeeksforGeeks
```

---

### 54. What is the output of the following program?

```java
import java.util.*;

public class hashSet {

    public static void main(String[] args) {

        HashSet<String> hashSet = new HashSet<>();

        hashSet.add("Geeks");
        hashSet.add("For");
        hashSet.add("Geeks");
        hashSet.add("GeeksforGeeks");

        System.out.println(hashSet);
    }
}
```

A.

```
[Geeks, For, Geeks, GeeksforGeeks]
```

B.

```
[GeeksforGeeks, Geeks, For]
```

C.

```
[For, Geeks, GeeksforGeeks]
```

**D. Either B or C (order is not guaranteed)** ✅

**Answer:** **D**

**Explanation:**

`HashSet`:

- Removes duplicates.
- Does **not** preserve insertion order.
- Does **not** sort elements.

The duplicate `"Geeks"` is removed.

Possible outputs include:

```
[GeeksforGeeks, Geeks, For]
```

or

```
[For, Geeks, GeeksforGeeks]
```

or any other order containing the three unique elements.

> **Correction:** Choosing one exact order is not reliable because `HashSet` iteration order is unspecified.

---

### 55. What is the output of the following program?

```java
import java.util.*;

public class stack {

    public static void main(String[] args) {

        List<String> list = new LinkedList<>();

        list.add("Geeks");
        list.add("For");
        list.add("Geeks");
        list.add("GeeksforGeeks");

        Iterator<Integer> iter = list.iterator();

        while (iter.hasNext())
            System.out.printf(iter.next() + " ");
    }
}
```

A.

```
Geeks For Geeks GeeksforGeeks
```

B.

```
GeeksforGeeks Geeks For Geeks
```

C. Runtime Error

**D. Compilation Error** ✅

**Answer:** **D**

**Explanation:**

`list.iterator()` returns

```java
Iterator<String>
```

but the code stores it as

```java
Iterator<Integer>
```

This results in an incompatible type error during compilation.

---

### 56. What is the output of the following program?

```java
class Helper {

    private int data;

    private Helper() {
        data = 5;
    }
}

public class Test {

    public static void main(String[] args) {

        Helper help = new Helper();

        System.out.println(help.data);
    }
}
```

A. Compilation Error ✅

B. 5

C. Runtime Error

D. None of these

**Answer:** **A**

**Explanation:**

There are **two compilation errors**:

1. The constructor is `private`, so it cannot be called outside the class.

```java
Helper help = new Helper();
```

2. `data` is also `private`.

```java
help.data
```

cannot be accessed outside `Helper`.

Therefore, the program does **not compile**.

---

### 57. What is the output of the following program?

```java
public class Test implements Runnable {

    public void run() {
        System.out.printf("Thread's running");
    }

    try {
        public Test() {
            Thread.sleep(5000);
        }
    }
    catch (InterruptedException e) {
        e.printStackTrace();
    }

    public static void main(String[] args) {

        Test obj = new Test();

        Thread thread = new Thread(obj);

        thread.start();

        System.out.printf("GFG");
    }
}
```

A. GFG Thread's running

B. Thread's running GFG

**C. Compilation Error** ✅

D. Runtime Error

**Answer:** **C**

**Explanation:**

The code is **syntactically invalid**.

A `try-catch` block **cannot** directly wrap a constructor declaration.

The constructor should be written as:

```java
public Test() {
    try {
        Thread.sleep(5000);
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}
```

Since the original code is invalid, it results in a **compile-time error**.

### 58. What is the output of the following program?

```java
class Helper {
    private int data;

    private Helper() {
        data = 5;
    }
}

public class Test {
    public static void main(String[] args) {
        Helper help = new Helper();
        System.out.println(help.data);
    }
}
```

**A. Compilation Error** ✅

B. 5

C. Runtime Error

D. None of these

**Answer:** **A**

**Explanation:**

The program results in **two compilation errors**:

1. `Helper()` constructor is **private**, so it cannot be accessed outside the `Helper` class.

```java
Helper help = new Helper();
```

2. The variable `data` is also **private**.

```java
System.out.println(help.data);
```

cannot be accessed outside the class.

Hence, the program does not compile.

---

### 59. What is the output of the following program?

```java
public class Test implements Runnable {

    public void run() {
        System.out.printf("Thread's running");
    }

    try {
        public Test() {
            Thread.sleep(5000);
        }
    }
    catch (InterruptedException e) {
        e.printStackTrace();
    }

    public static void main(String[] args) {

        Test obj = new Test();
        Thread thread = new Thread(obj);

        thread.start();

        System.out.printf("GFG");
    }
}
```

A. GFG Thread's running

B. Thread's running GFG

**C. Compilation Error** ✅

D. Runtime Error

**Answer:** **C**

**Explanation:**

The code is syntactically incorrect.

A `try-catch` block **cannot** be written directly inside the class body.

It should be placed **inside** the constructor.

Hence the program does not compile.

---

### 60. What is the output of the following program?

```java
class Temp {

    private Temp(int data) {
        System.out.printf("Constructor called ");
    }

    protected static Temp create(int data) {
        Temp obj = new Temp(data);
        return obj;
    }

    public void myMethod() {
        System.out.printf("Method called");
    }
}

public class Test {

    public static void main(String[] args) {

        Temp obj = Temp.create(20);

        obj.myMethod();
    }
}
```

**A. Constructor called Method called** ✅

B. Compilation Error

C. Runtime Error

D. None of the above

**Answer:** **A**

**Explanation:**

The constructor is private, so objects cannot be created directly.

The static factory method

```java
Temp.create(20)
```

creates the object internally and returns it.

Output

```
Constructor called Method called
```

---

### 61. What is the output of the following program?

```java
public class Test {

    public Test() {
        System.out.printf("1");
        new Test(10);
        System.out.printf("5");
    }

    public Test(int temp) {
        System.out.printf("2");
        new Test(10,20);
        System.out.printf("4");
    }

    public Test(int data,int temp) {
        System.out.printf("3");
    }

    public static void main(String[] args) {

        Test obj = new Test();
    }
}
```

**A. 12345** ✅

B. Compilation Error

C. 15

D. Runtime Error

**Answer:** **A**

**Explanation:**

Execution flow:

```
new Test()

prints 1

↓

new Test(10)

prints 2

↓

new Test(10,20)

prints 3

returns

prints 4

returns

prints 5
```

Final Output

```
12345
```

---

### 62. What is the output of the following program?

```java
class Base {

    public static String s = " Super Class ";

    public Base() {
        System.out.printf("1");
    }
}

public class Derived extends Base {

    public Derived() {

        System.out.printf("2");

        super();
    }

    public static void main(String[] args) {

        Derived obj = new Derived();

        System.out.printf(s);
    }
}
```

A. 21 Super Class

B. Super Class 21

**C. Compilation Error** ✅

D. 12 Super Class

**Answer:** **C**

**Explanation:**

In Java,

```java
super();
```

must always be the **first statement** inside a constructor.

The constructor contains

```java
System.out.printf("2");

super();
```

which is illegal.

Hence the program fails to compile.

---

### 63. What is the output of the following Java program?

```java
public class Outer {

    public static int temp1 = 1;
    private static int temp2 = 2;

    public int temp3 = 3;
    private int temp4 = 4;

    public static class Inner {

        private static int temp5 = 5;

        private static int getSum() {

            return (temp1 + temp2 + temp3 + temp4 + temp5);
        }
    }

    public static void main(String[] args) {

        Outer.Inner obj = new Outer.Inner();

        System.out.println(obj.getSum());
    }
}
```

A. 15

B. 9

C. 5

**D. Compilation Error** ✅

**Answer:** **D**

**Explanation:**

`temp3` and `temp4` are **instance variables**.

A static nested class cannot directly access instance members of the outer class.

These statements are illegal:

```java
temp3
temp4
```

Hence the program does not compile.

---

### 64. What is the output of the following program?

```java
public class Outer {

    private static int data = 10;

    private static int LocalClass() {

        class Inner {

            public int data = 20;

            private int getData() {
                return data;
            }
        }

        Inner inner = new Inner();

        return inner.getData();
    }

    public static void main(String[] args) {

        System.out.println(data * LocalClass());
    }
}
```

A. Compilation Error

B. Runtime Error

**C. 200** ✅

D. None of the above

**Answer:** **C**

**Explanation:**

The local inner class contains

```java
data = 20
```

Therefore

```
inner.getData() = 20
```

Outer static variable

```
data = 10
```

Output

```
10 × 20 = 200
```

---

### 65. What is the output of the following program?

```java
interface Anonymous {

    int getValue();
}

public class Outer {

    private int data = 15;

    public static void main(String[] args) {

        Anonymous inner = new Anonymous() {

            int data = 5;

            public int getValue() {
                return data;
            }

            public int getData() {
                return data;
            }
        };

        Outer outer = new Outer();

        System.out.println(inner.getValue() + inner.getData() + outer.data);
    }
}
```

A. 25

**B. Compilation Error** ✅

C. 20

D. Runtime Error

**Answer:** **B**

**Explanation:**

The reference variable

```java
Anonymous inner
```

can access only methods declared in the interface.

The interface contains only

```java
getValue()
```

It does **not** declare

```java
getData()
```

Therefore,

```java
inner.getData()
```

causes a compile-time error.

---

### 66. What is the output of the following Java program?

```java
public class Outer {

    private int data = 10;

    class Inner {

        private int data = 20;

        private int getData() {
            return data;
        }

        public void main(String[] args) {

            Inner inner = new Inner();

            System.out.println(inner.getData());
        }
    }

    private int getData() {
        return data;
    }

    public static void main(String[] args)

        Outer outer = new Outer();

        Outer.Inner inner = outer.new Inner();

        System.out.printf("%d", outer.getData());

        inner.main(args);
    }
}
```

A. 2010

B. 1020

**C. Compilation Error** ✅

D. None of these

**Answer:** **C**

**Explanation:**

The posted code is syntactically invalid.

The `main` method is missing its opening brace `{`.

```java
public static void main(String[] args)
```

should be

```java
public static void main(String[] args) {
```

Since the code itself is invalid, the program does not compile.

> **Note:** If the missing brace is treated as a typing mistake and corrected, the output would be `1020`.

### 67. What is the output of the following program?

```java
interface OuterInterface {

    public void InnerMethod();

    public interface InnerInterface {
        public void InnerMethod();
    }
}

public class Outer implements OuterInterface.InnerInterface, OuterInterface {

    public void InnerMethod() {
        System.out.println(100);
    }

    public static void main(String[] args) {

        Outer obj = new Outer();

        obj.InnerMethod();
    }
}
```

**A. 100** ✅

B. Compilation Error

C. Runtime Error

D. None of the above

**Answer:** **A**

**Explanation:**

Both interfaces declare the same method:

```java
void InnerMethod();
```

The `Outer` class provides a single implementation, which satisfies both interfaces.

Output:

```text
100
```

---

### 68. What is the output of the following program?

```java
public class Test implements Runnable {

    public void run() {
        System.out.printf("%d", 3);
    }

    public static void main(String[] args)
            throws InterruptedException {

        Thread thread = new Thread(new Test());

        thread.start();

        System.out.printf("%d", 1);

        thread.join();

        System.out.printf("%d", 2);
    }
}
```

A. 123

B. 213 or 231

**C. 132 or 312** ✅

D. 321

**Answer:** **C**

**Explanation:**

- `thread.start()` starts a new thread.
- The scheduler decides whether the child thread prints `3` before or after the main thread prints `1`.
- `join()` makes the main thread wait until the child thread finishes before printing `2`.

Possible outputs:

```
132
```

or

```
312
```

---

### 69. What is the output of the following program?

```java
public class Test {

    private static int value = 20;
    public int s = 15;
    public static int temp = 10;

    public static class Nested {

        private void display() {
            System.out.println(temp + s + value);
        }
    }

    public static void main(String args[]) {

        Test.Nested inner = new Test.Nested();

        inner.display();
    }
}
```

**A. Compilation Error** ✅

B. 1020

C. 101520

D. None of the above

**Answer:** **A**

**Explanation:**

`Nested` is a **static nested class**.

A static nested class cannot directly access non-static instance variables.

The statement

```java
temp + s + value
```

is illegal because `s` is an instance variable.

Hence the program does not compile.

---

### 70. What is the output of the following program?

```java
import java.io.*;

public class Test {

    public void display() throws IOException {
        System.out.println("Test");
    }
}

class Derived extends Test {

    public void display() throws IOException {
        System.out.println("Derived");
    }

    public static void main(String[] args)
            throws IOException {

        Derived object = new Derived();

        object.display();
    }
}
```

A. Test

**B. Derived** ✅

C. Compilation Error

D. Runtime Error

**Answer:** **B**

**Explanation:**

`Derived` overrides the `display()` method.

The object created is

```java
Derived object = new Derived();
```

Therefore the overridden method executes.

Output:

```text
Derived
```

---

### 71. What is the output of the following program?

```java
public class Test extends Thread {

    public void run() {
        System.out.printf("Test ");
    }

    public static void main(String[] args) {

        Test test = new Test();

        test.run();

        test.start();
    }
}
```

A. Compilation Error

B. Runtime Error

C. Test

**D. Test Test** ✅

**Answer:** **D**

**Explanation:**

`run()` is called directly first.

```java
test.run();
```

prints:

```
Test
```

Then

```java
test.start();
```

creates a new thread that executes `run()` again.

Final output:

```text
Test Test
```

---

### 72. For the given code, select the correct answer.

```java
public interface Test {

    public int calculate();

    protected interface NestedInterface {

        public void nested();
    }
}
```

A. Compile-time error due to `NestedInterface`

**B. Compile-time error due to access modifier of `NestedInterface`** ✅

C. No compile-time error

D. `NestedInterface` cannot hold any function declaration.

**Answer:** **B**

**Explanation:**

Nested interfaces inside an interface are implicitly

```java
public static
```

Using

```java
protected
```

is illegal.

Therefore the code results in a compile-time error.

---

### 73. Which of the following statements about constructor declaration is correct?

A. Constructors can be declared `final`.

B. Constructors can be surrounded by a `try-catch` block.

C. Constructors cannot throw exceptions.

**D. Constructors can hold synchronized code (so that each thread can access the constructor sequentially).** ✅

**Answer:** **D**

**Explanation:**

- Constructors **cannot** be declared `final`. ❌
- A constructor itself cannot be enclosed by a `try-catch`, although it may **contain** one. ❌
- Constructors **can** throw exceptions. ❌
- Constructors can contain synchronized blocks. ✅

Hence, only **D** is correct.

---

### 74. What will be the output of the following Java program?

```java
public class Inheritance {

    public static void main(String[] args) {

        Super i = new Super();

        i.show();
    }
}

class Super {

    public void show() {
        System.out.println("Base");
    }
}

class Sub extends Super {

    public void show() {
        System.out.println("Derived");
    }
}
```

**A. Base** ✅

B. Compilation Error

C. Derived

D. Runtime Error

**Answer:** **A**

**Explanation:**

The object created is

```java
new Super();
```

So the `show()` method of `Super` executes.

Output:

```text
Base
```

---

### 75. What is the output of the following program?

```java
class Parent {

    static void display() {
        System.out.println("Parent's static display()");
    }
}

class Child extends Parent {

    static void display() {
        System.out.println("Child's static display()");
    }
}

public class Main {

    public static void main(String[] args) {

        Parent obj = new Child();

        obj.display();
    }
}
```

A. Child's static display()

**B. Parent's static display()** ✅

C. Compilation Error

D. Runtime Error

**Answer:** **B**

**Explanation:**

Static methods are **hidden**, not overridden.

Method resolution for static methods happens at **compile time** based on the **reference type**, not the object type.

Here,

```java
Parent obj = new Child();
```

The reference type is `Parent`, so Java calls

```java
Parent.display();
```

Output:

```text
Parent's static display()
```