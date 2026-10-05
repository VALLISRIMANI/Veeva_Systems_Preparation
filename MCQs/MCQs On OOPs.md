## Section 1: Object-Oriented Programming (Questions 1–20)

### Q1.
**Question:** Which of the following best describes the fundamental concept of inheritance in Java?  
- A) It allows a class to contain instances of other classes as fields.  
- B) It allows a class to acquire properties and behaviors of another class using `extends`.  
- C) It restricts method access to within the same package.  
- D) It enables methods to share the same name with different parameter types.  

**Answer:** B  
**Explanation:** Inheritance allows a child class to inherit fields and methods from a superclass using the `extends` keyword, promoting code reuse.

---

### Q2.
**Question:** What is a key structural difference between an abstract class and an interface in Java (prior to Java 8)?  
- A) Interfaces can contain instance fields and constructors, whereas abstract classes cannot.  
- B) Abstract classes can contain instance fields and state, whereas interfaces cannot.  
- C) Abstract classes cannot contain concrete methods.  
- D) Interfaces allow package-private access modifiers for methods.  

**Answer:** B  
**Explanation:** Abstract classes can hold non-final instance variables and constructors to maintain state, while interface fields are implicitly `public static final`.

---

### Q3.
**Question:** Which statement correctly distinguishes Method Overloading from Method Overriding?  
- A) Overloading happens at runtime; Overriding happens at compile-time.  
- B) Overloading requires inheritance; Overriding occurs within the same class.  
- C) Overloading is resolved at compile-time based on parameter signatures; Overriding is resolved dynamically at runtime.  
- D) Overriding requires changing the return type; Overloading requires identical parameter types.  

**Answer:** C  
**Explanation:** Overloading is static polymorphism bound at compile time based on parameter types, whereas overriding uses dynamic method dispatch at runtime.

---

### Q4.
**Question:** What is the accessibility level of a `protected` member in Java?  
- A) Accessible only within the declaring class.  
- B) Accessible anywhere within the same package, and by subclasses in other packages.  
- C) Accessible anywhere in the application without restriction.  
- D) Accessible strictly within the same package, but never by subclasses in other packages.  

**Answer:** B  
**Explanation:** `protected` grants package-private access to all classes in the same package, plus access to subclasses located in different packages.

---

### Q5.
**Question:** Which practice directly implements the core OOP principle of Encapsulation?  
- A) Declaring all methods as `static` to prevent instantiation.  
- B) Declaring fields `private` and providing `public` getter and setter methods.  
- C) Extending multiple interfaces in a single class.  
- D) Overriding `Object.toString()` in every custom class.  

**Answer:** B  
**Explanation:** Encapsulation hides direct access to internal state by using private fields and exposing controlled read/write access via public methods.

---

### Q6.
**Question:** What Java mechanism enables a superclass reference variable to invoke an overridden method in a subclass instance at runtime?  
- A) Static Method Binding  
- B) Dynamic Method Dispatch (Late Binding)  
- C) Automatic Type Casting  
- D) Compile-Time Overloading  

**Answer:** B  
**Explanation:** Dynamic method dispatch resolves method calls at runtime based on the actual object instance rather than the reference variable type.

---

### Q7.
**Question:** What is the primary purpose of the `super` keyword in Java?  
- A) To reference the current instance of the class.  
- B) To call methods and constructors of the immediate parent class.  
- C) To instantiate an abstract superclass directly.  
- D) To prevent a class from being inherited.  

**Answer:** B  
**Explanation:** The `super` keyword refers to the immediate parent class, allowing access to parent constructors (`super()`) or parent methods/fields.

---

### Q8.
**Question:** Why were `default` methods introduced into Java interfaces in Java 8?  
- A) To eliminate the need for abstract classes completely.  
- B) To allow interfaces to define instance fields.  
- C) To allow adding new methods to interfaces without breaking existing implementation classes.  
- D) To make interface methods private by default.  

**Answer:** C  
**Explanation:** Default methods allow developers to add new concrete functionality to interfaces without requiring existing implementing classes to modify their code.

---

### Q9.
**Question:** How does Java handle multiple inheritance of classes?  
- A) Supported directly using multiple `extends` keywords.  
- B) Not supported for classes to avoid ambiguity (the Diamond Problem), but supported via multiple interfaces.  
- C) Supported only if all superclasses are marked `abstract`.  
- D) Supported only through private inheritance.  

**Answer:** B  
**Explanation:** Java disallows extending multiple classes to avoid state/method conflict ambiguities, opting instead for multiple interface implementation.

---

### Q10.
**Question:** What happens when a class is declared with the `final` modifier?  
- A) It cannot be instantiated.  
- B) All of its methods automatically become static.  
- C) It cannot be inherited or extended by any other class.  
- D) Its fields cannot be modified after compilation.  

**Answer:** C  
**Explanation:** Marking a class `final` prevents it from being extended by derived classes (e.g., `java.lang.String`).

---

### Q11.
**Question:** Consider the execution order of static blocks, instance blocks, and constructors during class inheritance initialization. What is the output order when a child class is instantiated for the first time?  
Given:  
Parent Static (A), Parent Instance (B), Parent Constructor (C), Child Static (D), Child Instance (E), Child Constructor (F).  
- A) A B C D E F  
- B) D A E F B C  
- C) A D B C E F  
- D) D E F A B C  

**Answer:** C  
**Explanation:** Static blocks execute first in superclass-to-subclass order (`A, D`), followed by parent instance block & constructor (`B, C`), and finally child instance block & constructor (`E, F`).

---

### Q12.
**Question:** Which statement correctly describes reference downcasting in Java?  
- A) Downcasting is always implicit and safe.  
- B) Downcasting requires explicit casting and can throw `ClassCastException` at runtime if object types are incompatible.  
- C) Downcasting is checked and verified at compile time, guaranteeing zero runtime exceptions.  
- D) Downcasting converts primitive types to object wrappers.  

**Answer:** B  
**Explanation:** Downcasting requires explicit cast syntax and throws a `ClassCastException` at runtime if the actual object instance does not match the target type.

---

### Q13.
**Question:** Given `Parent p = new Child(); System.out.println(p.x + " " + p.getX());` where `Parent` has field `x = 10` and method `getX() { return x; }`, and `Child` has field `x = 20` but does **not** override `getX()`. What is printed?  
- A) 20 20  
- B) 10 20  
- C) 10 10  
- D) 20 10  

**Answer:** C  
**Explanation:** Field access `p.x` is resolved at compile time using reference type (`Parent.x = 10`). Since `Child` doesn't override `getX()`, `Parent.getX()` executes and accesses `Parent`'s `x`.

---

### Q14.
**Question:** Can an abstract class in Java have a constructor, and if so, when is it executed?  
- A) No, abstract classes cannot have constructors.  
- B) Yes, but it can only be invoked manually using reflection.  
- C) Yes, it runs automatically when a concrete subclass instance is created.  
- D) Yes, but only if all methods in the class are abstract.  

**Answer:** C  
**Explanation:** Abstract classes can declare constructors, which run when a subclass constructor invokes `super()` during instantiation.

---

### Q15.
**Question:** What implicit access and storage modifiers are applied to fields declared inside a standard Java interface?  
- A) `protected static final`  
- B) `public static final`  
- C) `private final`  
- D) `public transient`  

**Answer:** B  
**Explanation:** All fields declared in an interface are implicitly `public`, `static`, and `final`.

---

### Q16.
**Question:** What constraint applies when using `this()` and `super()` inside a constructor?  
- A) Both must be placed at the end of the constructor body.  
- B) They can be called anywhere in the constructor in any order.  
- C) Each must be the very first statement in a constructor, meaning both cannot be used in the same constructor body.  
- D) `super()` can only be called if `this()` was called first.  

**Answer:** C  
**Explanation:** Both `this()` and `super()` must be the first statement in a constructor, making them mutually exclusive within a single constructor body.

---

### Q17.
**Question:** Given class `A { A get() { return this; } }` and class `B extends A { B get() { return this; } }`. Executing `A a = new B(); System.out.println(a.get() == a);` results in:  
- A) `false`  
- B) `Compilation Error`  
- C) `true`  
- D) `NullPointerException`  

**Answer:** C  
**Explanation:** Calling `a.get()` dynamically invokes `B`'s overridden method returning `this`. Comparing it to `a` checks memory references, which are identical (`true`).

---

### Q18.
**Question:** What happens if a subclass attempts to override a method declared as `final` in the superclass?  
- A) The subclass method overrides it successfully.  
- B) A runtime `NoSuchMethodException` is thrown.  
- C) A Compilation Error occurs.  
- D) The subclass creates a hidden static copy of the method.  

**Answer:** C  
**Explanation:** The Java compiler rejects any attempt to override a method marked with the `final` keyword.

---

### Q19.
**Question:** If no access modifier (`public`, `protected`, `private`) is specified for a class member, what is its access level?  
- A) Public  
- B) Private  
- C) Package-Private (Default)  
- D) Protected  

**Answer:** C  
**Explanation:** Omitting an access modifier assigns default package-private visibility, restricting access to classes within the same package.

---

### Q20.
**Question:** What is a Marker Interface in Java?  
- A) An interface containing only default methods.  
- B) An interface with no methods or fields used to deliver type authorization or metadata to the JVM.  
- C) An interface that extends multiple super-interfaces.  
- D) An interface marked with the `final` keyword.  

**Answer:** B  
**Explanation:** Marker interfaces (e.g., `Serializable`, `Cloneable`) contain no members and serve as type indicators for runtime tools or the JVM.

---

## Section 2: Java Fundamentals & Mechanics (Questions 21–30)

### Q21.
**Question:** What happens if an unlabelled `break` statement is used inside a standalone `if` block inside `main()` (outside any loop or `switch`)?  
- A) Code compiles and exits `main()` silently.  
- B) Compilation Error (`break outside switch or loop`).  
- C) Runtime `IllegalStateException` is thrown.  
- D) The program skips the remainder of the `if` block.  

**Answer:** B  
**Explanation:** In Java, an unlabelled `break` statement is strictly restricted to loop constructs or `switch` statements.

---

### Q22.
**Question:** What is the result of evaluating the expression `0.1 + 0.2 == 0.3` in Java?  
- A) `true`  
- B) `false`  
- C) Compilation Error  
- D) ArithmeticException  

**Answer:** B  
**Explanation:** IEEE 754 floating-point representation rounding causes `0.1 + 0.2` to evaluate to approximately `0.30000000000000004`, which is not equal to `0.3`.

---

### Q23.
**Question:** What is the evaluated output of `System.out.println(true ? new Integer(1) : new Double(2.0));`?  
- A) `1`  
- B) `1.0`  
- C) `2.0`  
- D) Compilation Error  

**Answer:** B  
**Explanation:** The ternary operator applies binary numeric promotion to balance branch types, unboxing and promoting `Integer(1)` to `Double(1.0)`.

---

### Q24.
**Question:** What are the default values assigned to array elements when instantiating `new Object[3]`, `new int[3]`, and `new boolean[3]`?  
- A) `0, 0, false`  
- B) `null, 0, false`  
- C) `null, null, false`  
- D) `undefined, 0, false`  

**Answer:** B  
**Explanation:** Reference arrays default to `null`, primitive integer arrays default to `0`, and boolean arrays default to `false`.

---

### Q25.
**Question:** Given overloaded methods `test(long x)` and `test(Integer x)`, which method is invoked when calling `test(5)` passing a primitive `int`?  
- A) `test(Integer x)`  
- B) `test(long x)`  
- C) Compilation Error due to ambiguity  
- D) Both methods are called sequentially  

**Answer:** B  
**Explanation:** Java's method resolution algorithm prefers primitive widening (`int` $\rightarrow$ `long`) over autoboxing (`int` $\rightarrow$ `Integer`).

---

### Q26.
**Question:** How many total String objects are created in memory when executing `String s = "xyz" + new String("abc");` (assuming pool is initially empty)?  
- A) 2  
- B) 3  
- C) 4  
- D) 5  

**Answer:** C  
**Explanation:** 4 objects: `"xyz"` in string pool, `"abc"` in string pool, heap object for `new String("abc")`, and the final concatenated heap result `"xyzabc"`.

---

### Q27.
**Question:** If an object reference is passed into a method and that reference parameter is reassigned to a new object inside the method, how is the caller's variable affected?  
- A) The caller's variable is updated to point to the new object.  
- B) The caller's variable remains unchanged pointing to the original object.  
- C) A runtime `NullPointerException` is thrown.  
- D) The original object is garbage collected immediately.  

**Answer:** B  
**Explanation:** Java is strictly pass-by-value. Passing an object passes a copy of the reference pointer, so reassigning the local parameter copy does not alter the original reference.

---

### Q28.
**Question:** What occurs when a subclass defines a static method with the exact same signature as a static method in the parent class?  
- A) Polymorphic Dynamic Method Overriding.  
- B) Method Hiding.  
- C) Compilation Error.  
- D) Runtime Method Ambiguity.  

**Answer:** B  
**Explanation:** Static methods cannot be overridden dynamically; instead, the subclass method hides the superclass static method.

---

### Q29.
**Question:** Which group of types is fully supported by Java `switch` statements?  
- A) `float`, `double`, `String`, `int`  
- B) `byte`, `short`, `char`, `int`, `String`, `enum`, and Wrappers  
- C) `long`, `boolean`, `double`, `String`  
- D) Any primitive or reference type  

**Answer:** B  
**Explanation:** `switch` statements support integral primitives (except `long`), `enum` types, `String`, and standard wrapper classes.

---

### Q30.
**Question:** When does an object in memory become eligible for Garbage Collection?  
- A) As soon as it is assigned to `null`.  
- B) When the method containing it finishes compiling.  
- C) When it is no longer reachable by any live thread reference.  
- D) Only when `System.gc()` is explicitly invoked.  

**Answer:** C  
**Explanation:** An object is eligible for garbage collection as soon as there are no active references pointing to it from any live thread.

---

## Section 3: Arrays & String Methods (Questions 31–49)

### Q31.
**Question:** How do you obtain the size of a `String` versus an Array in Java?  
- A) `str.length` property and `arr.length()` method.  
- B) `str.length()` method and `arr.length` property.  
- C) `str.size()` method and `arr.length` property.  
- D) `str.length()` method and `arr.size()` method.  

**Answer:** B  
**Explanation:** `length()` is a member method of the `String` class, while `length` is an immutable field on array objects.

---

### Q32.
**Question:** What does String Immutability mean in Java?  
- A) A String reference variable cannot be reassigned to another String object.  
- B) Once created, the char sequence inside a `String` object cannot be modified in memory.  
- C) String objects are stored on the call stack rather than the heap.  
- D) Strings can only contain ASCII characters.  

**Answer:** B  
**Explanation:** String objects are immutable; any operation that appears to modify a String actually creates an entirely new `String` object.

---

### Q33.
**Question:** What value does `String.indexOf()` return if the specified character or substring is not found?  
- A) `0`  
- B) `null`  
- C) `-1`  
- D) `false`  

**Answer:** C  
**Explanation:** `indexOf()` returns the 0-based index of the first occurrence, or `-1` if the target string/character is absent.

---

### Q34.
**Question:** What is the main difference between using `==` and `.equals()` when comparing two `String` objects?  
- A) `==` checks character content equality; `.equals()` checks reference addresses.  
- B) `==` checks reference/memory address equality; `.equals()` checks sequence content equality.  
- C) Both perform identical checks on strings.  
- D) `.equals()` works only on string literals.  

**Answer:** B  
**Explanation:** `==` checks if two reference variables point to the same memory location, while `.equals()` compares character sequences.

---

### Q35.
**Question:** What formula does `StringBuilder` use to expand its internal buffer capacity when it exceeds current limits?  
- A) `Old Capacity * 2`  
- B) `(Old Capacity * 2) + 2`  
- C) `Old Capacity + 10`  
- D) `Old Capacity * 1.5`  

**Answer:** B  
**Explanation:** `StringBuilder` resizes its character array buffer using the growth formula `(currentCapacity * 2) + 2`.

---

### Q36.
**Question:** What exception is thrown when attempting to access an invalid array index?  
- A) `StringIndexOutOfBoundsException`  
- B) `NullPointerException`  
- C) `ArrayIndexOutOfBoundsException`  
- D) `IllegalArgumentException`  

**Answer:** C  
**Explanation:** Accessing an index outside the range `[0, length - 1]` throws `ArrayIndexOutOfBoundsException`.

---

### Q37.
**Question:** Given `String str = "Programming"; str.substring(3, 7); System.out.println(str);`, what is printed?  
- A) `gram`  
- B) `Programming`  
- C) `gramm`  
- D) `Pro`  

**Answer:** B  
**Explanation:** `substring()` returns a new string (`"gram"`), but because `str` is immutable and the returned result was not reassigned, `str` remains `"Programming"`.

---

### Q38.
**Question:** Which of the following is a valid syntax to declare and instantiate a 2D integer array with 2 rows and 3 columns?  
- A) `int arr[2][3] = new int[][];`  
- B) `int[][] arr = new int[2][3];`  
- C) `int[][] arr = new int[3][2];`  
- D) `Array2D arr = new Array2D(2, 3);`  

**Answer:** B  
**Explanation:** `int[][] arr = new int[2][3];` correctly allocates a 2D array of 2 row arrays containing 3 columns each.

---

### Q39.
**Question:** What does the `String.trim()` method remove from a string?  
- A) All spaces present inside the string.  
- B) Only leading and trailing whitespace.  
- C) All non-alphanumeric characters.  
- D) Punctuation marks at the end of the string.  

**Answer:** B  
**Explanation:** `trim()` strip spaces, tabs, and newlines from the beginning and end of a string, leaving internal spaces untouched.

---

### Q40.
**Question:** Which standard library method converts a string representing digits into a primitive integer?  
- A) `Integer.parseInt(str)`  
- B) `Integer.valueOf(str).toInt()`  
- C) `(int) str`  
- D) `Convert.toInt32(str)`  

**Answer:** A  
**Explanation:** `Integer.parseInt(str)` parses a numeric string and returns a primitive `int`.

---

### Q41.
**Question:** Which array initialization syntax is shorthand valid in Java?  
- A) `int[] arr = {1, 2, 3};`  
- B) `int arr = (1, 2, 3);`  
- C) `int[] arr = new int[3]{1, 2, 3};`  
- D) `int arr[] = [1, 2, 3];`  

**Answer:** A  
**Explanation:** `int[] arr = {1, 2, 3};` is valid shorthand literal syntax for array allocation and initialization.

---

### Q42.
**Question:** What indexing scheme does `String.charAt(int index)` use?  
- A) 1-based indexing  
- B) 0-based indexing  
- C) Negative indexing from end  
- D) Dynamic pointer offset  

**Answer:** B  
**Explanation:** Java strings use 0-based indexing, where index `0` accesses the first character.

---

### Q43.
**Question:** What is the key difference between `StringBuffer` and `StringBuilder`?  
- A) `StringBuilder` is thread-safe (synchronized); `StringBuffer` is not.  
- B) `StringBuffer` is thread-safe (synchronized); `StringBuilder` is unsynchronized and faster.  
- C) `StringBuffer` is immutable; `StringBuilder` is mutable.  
- D) `StringBuilder` can only hold ASCII characters.  

**Answer:** B  
**Explanation:** `StringBuffer` synchronizes its operations for thread safety, whereas `StringBuilder` is unsynchronized for higher single-threaded performance.

---

### Q44.
**Question:** What happens when instantiating an array with negative size: `int[] arr = new int[-5];`?  
- A) Creates an empty array of size 0.  
- B) Compilation Error.  
- C) Throws `NegativeArraySizeException` at runtime.  
- D) Allocates a dynamic vector.  

**Answer:** C  
**Explanation:** Attempting to allocate an array with a negative integer dimension throws a runtime `NegativeArraySizeException`.

---

### Q45.
**Question:** What does `String.replace('a', 'b')` do?  
- A) Replaces only the first occurrence of 'a' with 'b'.  
- B) Replaces all occurrences of 'a' with 'b' in a newly returned String.  
- C) Modifies the target string in place.  
- D) Replaces only the last occurrence of 'a' with 'b'.  

**Answer:** B  
**Explanation:** `replace()` returns a new string where every instance of the target character is replaced with the replacement character.

---

### Q46.
**Question:** What is printed when passing an integer array directly to `System.out.println(new int[]{1, 2, 3});`?  
- A) `[1, 2, 3]`  
- B) `1, 2, 3`  
- C) Memory address hash code representation (e.g., `[I@15db9742`)  
- D) Compilation Error  

**Answer:** C  
**Explanation:** Arrays inherit `Object.toString()`, printing the type descriptor (`[I`) followed by the object's hexadecimal hash code.

---

### Q47.
**Question:** What is the result of `"a.b.c".split(".")` in Java?  
- A) Array `["a", "b", "c"]`  
- B) Array `["a.b.c"]`  
- C) Empty Array `[]` (0 elements)  
- D) Compilation Error  

**Answer:** C  
**Explanation:** `split()` expects a regular expression; `.` matches any character, splitting every character away and leaving an empty array.

---

### Q48.
**Question:** Can an array's length be modified after its creation in Java?  
- A) Yes, by assigning `arr.length = newSize`.  
- B) No, array lengths are fixed permanently at instantiation.  
- C) Yes, using `arr.resize()`.  
- D) Yes, if declared as `public`.  

**Answer:** B  
**Explanation:** Array objects in Java have a fixed size that cannot be expanded or shrunk once created.

---

### Q49.
**Question:** Given `String a = "hello"; String b = new String("hello").intern();`, what does `a == b` evaluate to?  
- A) `false`  
- B) `true`  
- C) Compilation Error  
- D) Runtime Exception  

**Answer:** B  
**Explanation:** Calling `.intern()` returns the canonical reference from the String Pool, which points to the exact same string literal object as `a`.

---

## Section 4: Core Java & Control Flow (Questions 50–68 / Section B 1–20)

### B1.
**Question:** Is a `try` block without a `catch` block valid in Java?  
- A) No, every `try` must have at least one `catch`.  
- B) Yes, provided it is followed by a `finally` block or uses try-with-resources.  
- C) Yes, unconditionally.  
- D) No, `finally` requires a `catch` block to exist.  

**Answer:** B  
**Explanation:** A `try` block must be accompanied by either a `catch` block, a `finally` block, or managed resources.

---

### B2.
**Question:** What is printed if `System.exit(0)` is executed inside a `try` block before reaching its `finally` block?  
- A) The `finally` block runs normally.  
- B) The `finally` block does NOT execute.  
- C) The JVM hangs indefinitely.  
- D) A `SecurityException` is thrown.  

**Answer:** B  
**Explanation:** `System.exit()` terminates the JVM process immediately, skipping any remaining `finally` block execution.

---

### B3.
**Question:** How does executing `break outer;` behave inside nested loops labeled `outer:`?  
- A) Breaks only out of the innermost loop.  
- B) Terminates the entire program.  
- C) Breaks completely out of the labeled `outer` loop structure.  
- D) Causes a compiler error.  

**Answer:** C  
**Explanation:** Labeled `break` statements jump execution completely outside the designated target loop label.

---

### B4.
**Question:** What result occurs if code is placed directly after an unconditional `return` statement in the same block?  
- A) Code executes normally.  
- B) Code is ignored at runtime.  
- C) Compilation Error (`unreachable code`).  
- D) Warning is issued.  

**Answer:** C  
**Explanation:** The Java compiler detects and flags statements that cannot be reached during execution as unreachable code errors.

---

### B5.
**Question:** What happens when evaluating integer division `int x = 5 / 0;`?  
- A) Evaluates to `Infinity`.  
- B) Evaluates to `0`.  
- C) Throws `ArithmeticException: / by zero` at runtime.  
- D) Throws `NullPointerException`.  

**Answer:** C  
**Explanation:** Integer division by zero is undefined in integer arithmetic and throws an `ArithmeticException`.

---

### B6.
**Question:** What is the output of double floating-point division `double d = 5.0 / 0.0;`?  
- A) Throws `ArithmeticException`.  
- B) `Infinity`  
- C) `NaN`  
- D) `0.0`  

**Answer:** B  
**Explanation:** IEEE 754 double precision floating-point arithmetic represents division of a positive non-zero number by zero as `Infinity`.

---

### B7.
**Question:** Which classes represent Unchecked Exceptions in Java?  
- A) All subclasses of `Exception`.  
- B) Subclasses of `RuntimeException` and `Error`.  
- C) All subclasses of `Throwable`.  
- D) Classes implementing `AutoCloseable`.  

**Answer:** B  
**Explanation:** Unchecked exceptions are instances of `RuntimeException`, `Error`, and their subclasses, which do not require mandatory handling or declarations.

---

### B8.
**Question:** Given `try { return 1; } finally { return 2; }`, what value is returned by the method?  
- A) `1`  
- B) `2`  
- C) Compilation Error  
- D) `0`  

**Answer:** B  
**Explanation:** A `return` statement inside a `finally` block overrides and suppresses any value returned from the `try` block.

---

### B9.
**Question:** How many times is the loop body guaranteed to execute in a `do-while` loop?  
- A) 0 times  
- B) At least 1 time  
- C) Always infinite times  
- D) 2 times  

**Answer:** B  
**Explanation:** Because the condition expression is evaluated at the bottom, a `do-while` loop always runs at least once.

---

### B10.
**Question:** What is the result of evaluating `-10 % 3` in Java?  
- A) `1`  
- B) `-1`  
- C) `2`  
- D) `-2`  

**Answer:** B  
**Explanation:** In Java, the remainder operator `%` preserves the sign of the left-hand operand (dividend).

---

### B11.
**Question:** Given `int a = 5; System.out.println(a++ + ++a);`, what is printed?  
- A) `10`  
- B) `11`  
- C) `12`  
- D) `13`  

**Answer:** C  
**Explanation:** `a++` yields `5` (and increments `a` to `6`). `++a` increments `a` to `7` and yields `7`. Total: $5 + 7 = 12$.

---

### B12.
**Question:** What rule governs the catch order when catching subclass and superclass exceptions?  
- A) Catch general superclass exceptions before specific subclasses.  
- B) Specific subclass exceptions must be caught before broader superclass exceptions.  
- C) Exceptions can be caught in any arbitrary order.  
- D) Superclasses cannot be caught.  

**Answer:** B  
**Explanation:** Catching a superclass first makes subsequent subclass catch blocks unreachable, causing a compile error.

---

### B13.
**Question:** What is the result of evaluating the bitwise unsigned right shift `-1 >>> 24`?  
- A) `-1`  
- B) `255`  
- C) `0`  
- D) `16777215`  

**Answer:** B  
**Explanation:** Unsigned shift `>>>` fills high bits with zeros. Shifting 32-bit integer `-1` (all 1s) right by 24 bits leaves 8 ones, which equals `255`.

---

### B14.
**Question:** Is `for(;;) { ... }` valid Java syntax, and how does it behave?  
- A) Invalid syntax, compilation error.  
- B) Valid syntax, creates an infinite loop.  
- C) Valid syntax, runs zero times.  
- D) Valid syntax, runs exactly once.  

**Answer:** B  
**Explanation:** All three components of a `for` loop are optional; omitting them creates an endless loop.

---

### B15.
**Question:** What is printed by `System.out.println(1 + 2 + "3" + 4 + 5);`?  
- A) `12345`  
- B) `3345`  
- C) `15`  
- D) `339`  

**Answer:** B  
**Explanation:** Operations proceed left to right: `1 + 2` $= 3$, then string concatenation produces `"3" + "3"` $= "33"$, `"33" + 4` $= "334"$, `"334" + 5` $= "3345"$.

---

### B16.
**Question:** How are additional exceptions handled if thrown inside `close()` during try-with-resources resource cleanup?  
- A) They overwrite the main exception thrown in the try block.  
- B) They are attached as Suppressed Exceptions to the primary exception.  
- C) They are silently ignored.  
- D) They cause a JVM crash.  

**Answer:** B  
**Explanation:** Try-with-resources suppresses secondary cleanup exceptions, attaching them to the primary exception (retrievable via `getSuppressed()`).

---

### B17.
**Question:** Given `short s = 5; s += 10;` vs `s = s + 10;`, which statement correctly predicts compilation behavior?  
- A) Both compile without issues.  
- B) Both fail to compile.  
- C) `s += 10` compiles, but `s = s + 10` fails without an explicit cast.  
- D) `s = s + 10` compiles, but `s += 10` fails.  

**Answer:** C  
**Explanation:** Compound assignment (`+=`) automatically casts the result to the left operand type, while `s + 10` produces an `int` requiring explicit casting.

---

### B18.
**Question:** What modifier applies to an instance variable declared without `public`, `protected`, or `private`?  
- A) Global  
- B) Private  
- C) Package-Private (Default)  
- D) Protected  

**Answer:** C  
**Explanation:** Omitting visibility keywords grants package-private access, making the member accessible within its enclosing package.

---

### B19.
**Question:** Are Java `assert` statements enabled by default during execution?  
- A) Yes, always enabled.  
- B) No, disabled by default unless explicitly enabled via `-ea` command line argument.  
- C) Enabled only in debug builds.  
- D) Enabled only for unchecked exceptions.  

**Answer:** B  
**Explanation:** Assertions are disabled at runtime by default unless activated using the `-ea` (enableassertions) flag.

---

### B20.
**Question:** What restriction applies to checked exceptions declared by an overriding subclass method?  
- A) It must declare broader exceptions than the superclass method.  
- B) It cannot declare new or broader checked exceptions than those declared in the superclass method.  
- C) It must throw identical exceptions only.  
- D) It cannot throw any exceptions at all.  

**Answer:** B  
**Explanation:** Overriding methods can declare fewer, narrower checked exceptions or any unchecked exceptions, but never broader checked exceptions.

---

## Section 5: Miscellaneous & Collections Framework (Questions 69–83)

### Q69.
**Question:** Which core collection interfaces does the `LinkedList` class implement in Java?  
- A) `List` only  
- B) `Queue` only  
- C) Both `List` and `Deque` (which extends `Queue`)  
- D) `Set` and `List`  

**Answer:** C  
**Explanation:** `LinkedList` implements both `List` and `Deque`, allowing it to function as a sequential list, stack, or queue.

---

### Q70.
**Question:** If a superclass method declares `throws IOException`, what can an overriding subclass method declare?  
- A) `throws Exception`  
- B) `throws FileNotFoundException` (subclass of `IOException`) or no exception  
- C) `throws Throwable`  
- D) Must declare `throws IOException` strictly  

**Answer:** B  
**Explanation:** Overriding methods can refine exception declarations to narrower subclasses (like `FileNotFoundException`) or omit them completely.

---

### Q71.
**Question:** What runtime impact occurs if a loop condition `while (true)` lacks a `break` or exit logic?  
- A) Immediate compilation failure.  
- B) CPU usage spikes as the thread enters an infinite execution loop.  
- C) Memory overflow within seconds.  
- D) Automatic JVM shutdown.  

**Answer:** B  
**Explanation:** Unbounded loops tie up executing threads, consuming continuous CPU cycles without progressing.

---

### Q72.
**Question:** How do you create a custom checked exception class in Java?  
- A) Extend `Throwable` directly.  
- B) Extend `Exception` (and not `RuntimeException`).  
- C) Extend `RuntimeException`.  
- D) Implement `AutoCloseable`.  

**Answer:** B  
**Explanation:** Classes extending `java.lang.Exception` (excluding `RuntimeException`) define custom checked exceptions requiring explicit handling.

---

### Q73.
**Question:** Which two ways can be used to create execution threads in Java?  
- A) Extending `Thread` class OR implementing `Runnable` interface.  
- B) Extending `Process` OR implementing `Callable`.  
- C) Instantiating `Object` OR implementing `Serializable`.  
- D) Overriding `main()` method directly.  

**Answer:** A  
**Explanation:** Threads are created by extending `Thread` and overriding `run()`, or by implementing `Runnable` and passing it to a `Thread` instance.

---

### Q74.
**Question:** What is the result of `double d = 1.0 / 3.0;`?  
- A) `0.3`  
- B) `0.3333333333333333`  
- C) `0.333`  
- D) ArithmeticException  

**Answer:** B  
**Explanation:** Double-precision floating-point arithmetic stores values up to 53 bits of precision, resulting in 16 decimal places.

---

### Q75.
**Question:** What happens when attempting to insert a `null` key into a `TreeMap` using natural ordering?  
- A) Key is stored at index 0.  
- B) Throws `NullPointerException` at runtime.  
- C) Key is converted to empty string.  
- D) Allowed silently.  

**Answer:** B  
**Explanation:** `TreeMap` invokes `compareTo()` to sort keys; calling comparison methods on `null` triggers a `NullPointerException`.

---

### Q76.
**Question:** Given `Map map = new IdentityHashMap(); map.put(new String("a"), 1); map.put(new String("a"), 2);`, what is `map.size()`?  
- A) 1  
- B) 2  
- C) Compilation Error  
- D) Runtime Exception  

**Answer:** B  
**Explanation:** `IdentityHashMap` uses reference equality (`==`) rather than `.equals()`. Distinct heap objects are treated as separate keys.

---

### Q77.
**Question:** How does `HashMap` handle bucket collisions internally in modern Java (Java 8+)?  
- A) Rehashes the entire map immediately.  
- B) Uses linked lists, converting to balanced Red-Black trees if a bucket exceeds 8 elements.  
- C) Discards old duplicate entries.  
- D) Converts the hash map to an array.  

**Answer:** B  
**Explanation:** Colliding elements are stored in linked lists until bucket size reaches 8, where it converts to a Red-Black tree for $O(\log n)$ lookup efficiency.

---

### Q78.
**Question:** What exception is thrown when modifying a collection structurally while iterating over it via a standard Iterator?  
- A) `IllegalStateException`  
- B) `ConcurrentModificationException`  
- C) `UnsupportedOperationException`  
- D) `IndexOutOfBoundsException`  

**Answer:** B  
**Explanation:** Java collections use fail-fast iterators that detect concurrent modifications and raise a `ConcurrentModificationException`.

---

### Q79.
**Question:** What underlying data structure backs a standard Java `HashSet`?  
- A) Dynamic Array  
- B) `HashMap`  
- C) `LinkedList`  
- D) Binary Tree  

**Answer:** B  
**Explanation:** `HashSet` is internally implemented using a `HashMap`, where set elements are stored as map keys with dummy constant values.

---

### Q80.
**Question:** Why is `ArrayDeque` preferred over `Stack` for LIFO stack operations in modern Java?  
- A) `Stack` is thread-safe via synchronization overhead and extends `Vector`; `ArrayDeque` is unsynchronized and faster.  
- B) `ArrayDeque` uses fixed memory.  
- C) `Stack` does not support iteration.  
- D) `ArrayDeque` accepts `null` elements.  

**Answer:** A  
**Explanation:** `Stack` inherits synchronization overhead from `Vector`, whereas `ArrayDeque` offers a complete, unsynchronized, faster array-backed double-ended queue.

---

### Q81.
**Question:** What is the primary difference between `Comparable` and `Comparator`?  
- A) `Comparable` provides `compare()`; `Comparator` provides `compareTo()`.  
- B) `Comparable` defines a class's natural ordering via `compareTo()`; `Comparator` defines external custom orderings via `compare()`.  
- C) `Comparable` works only on numbers; `Comparator` works on strings.  
- D) `Comparator` is implemented inside the domain class itself.  

**Answer:** B  
**Explanation:** `Comparable` establishes single natural sorting inside the object class, while `Comparator` builds external strategy objects for custom sorting logic.

---

### Q82.
**Question:** What happens if you call `.add()` on a list wrapped by `Collections.unmodifiableList()`?  
- A) Element is added successfully.  
- B) Throws `UnsupportedOperationException` at runtime.  
- C) Silently fails without modifying list.  
- D) Recompiles the underlying list.  

**Answer:** B  
**Explanation:** Unmodifiable collection wrappers intercept mutation attempts and throw runtime `UnsupportedOperationException`s.

---

### Q83.
**Question:** What guarantee does `PriorityQueue` provide regarding element iteration order?  
- A) Guarantees strict fully-sorted iteration sequence.  
- B) Guarantees only that the head element (`poll()` / `peek()`) is always the minimal element according to specified ordering.  
- C) Guarantees insertion-order iteration.  
- D) Guarantees reverse-alphabetical order.  

**Answer:** B  
**Explanation:** `PriorityQueue` uses a binary heap array structure, ensuring only that the root (head) is the smallest element without maintaining full sorted array order.