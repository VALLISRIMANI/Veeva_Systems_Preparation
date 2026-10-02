# Java Exception Handling MCQs

### Question 1

Which of the following accurately describes the relationship between Error, Exception, and RuntimeException in the Java Throwable hierarchy?

* A. RuntimeException is a subclass of Error, which inherits from Throwable.

* B. Error and Exception are direct subclasses of Throwable, whereas RuntimeException is a subclass of Exception.

* C. Exception inherits from RuntimeException, which inherits from Throwable.

* D. Error inherits from Exception, which inherits from Throwable.

**Answer:** B
**Explanation:** `Throwable` is the root class of Java's exception hierarchy. `Error` and `Exception` both extend `Throwable` directly, while `RuntimeException` extends `Exception`.

### Question 2

A subclass method overrides a superclass method that declares it throws java.io.IOException (a checked exception). Which of the following throws clause declarations in the subclass method signature will cause a compilation error?

* A. Declaring that it throws a specific subclass of IOException, such as java.io.FileNotFoundException.

* B. Declaring no throws clause at all (throwing no checked exceptions).

* C. Declaring that it throws a broader checked exception, such as java.lang.Exception.

* D. Declaring that it throws an unchecked exception, such as java.lang.NullPointerException.

**Answer:** C
**Explanation:** An overriding method cannot declare broader or new checked exceptions than those declared by the overridden superclass method.

### Question 3

Under which of the following explicit conditions will the statements inside a finally block not execute when associated with a try-catch block?

* A. When an unhandled unchecked exception is thrown inside the try block.

* B. When a return statement is executed inside the try or catch block.

* C. When a Error (like OutOfMemoryError) is thrown during the execution of the try block.

* D. When System.exit() is called in the try or catch block prior to reaching the finally block.

**Answer:** D
**Explanation:** Calling `System.exit()` terminates the Java Virtual Machine immediately, preventing the `finally` block from executing.

### Question 4

What is the final integer value returned by a method containing the following structure?

```
public int testMethod() {
    int x = 10;
    try {
        x = 20;
        return x;
    } finally {
        x = 30;
    }
}

```

* A. 20

* B. 30

* C. 10

* D. It results in a compilation error because of modification inside finally.

**Answer:** A
**Explanation:** The value to be returned (`20`) is evaluated and saved before the `finally` block runs; although `x` is modified in `finally`, the saved return value remains unchanged.

### Question 5

Which interface must a custom or library resource class implement to make it compatible with the try-with-resources construct introduced in Java 7?

* A. java.io.Serializable

* B. java.lang.Runnable

* C. java.lang.AutoCloseable

* D. java.lang.Cloneable

**Answer:** C
**Explanation:** Resources used in a try-with-resources statement must implement `java.lang.AutoCloseable` (or its subinterface `java.io.Closeable`).

### Question 6

What is the primary difference in syntax and usage between throw and throws in Java?

* A. throw is used in method signatures to declare multiple exceptions, while throws is used inside the method block to handle them.

* B. throw is used to explicitly create and emit an exception instance within a code block, whereas throws is used in a method signature to declare potential checked exceptions a method might propagate.

* C. throw only applies to unchecked exceptions, while throws only applies to checked exceptions.

* D. There is no syntactic difference; throw and throws are interchangeable synonyms.

**Answer:** B
**Explanation:** `throw` is an action keyword used in method bodies to throw an exception object, while `throws` is used in method signatures to declare exceptions.

### Question 7

When designing a custom exception class for an automation test framework to represent a fatal test configuration failure that should be unchecked, which superclass should it extend?

* A. java.lang.Exception

* B. java.lang.RuntimeException

* C. java.lang.Throwable

* D. java.lang.Error

**Answer:** B
**Explanation:** Unchecked exceptions in Java are created by extending `java.lang.RuntimeException`.

### Question 8

How do you correctly perform exception chaining when catching an existing low-level exception and re-throwing it as a custom application exception to preserve the original stack trace?

* A. throw new CustomException(e.getMessage());

* B. throw new CustomException().setCause(e);

* C. throw new CustomException("Detailed message", e);

* D. throw e.fillInStackTrace();

**Answer:** C
**Explanation:** Passing the original exception (`e`) as the second parameter to the custom exception's constructor sets it as the cause and preserves the original stack trace.

### Question 9

Which statement about final, finally, and finalize is correct?

* A. final is used to handle exceptions, finally is used for garbage collection, and finalize prevents modification.

* B. final makes a variable constant, finally ensures execution of cleanup code, and finalize is called before garbage collection.

* C. final is a method, finally is a keyword, and finalize is a block inside try-catch.

* D. final, finally, and finalize all serve the same purpose.

**Answer:** B
**Explanation:** `final` is a modifier for immutability, `finally` guarantees code execution after try/catch, and `finalize` is a cleanup method called by GC prior to object destruction.

### Question 10

Which of the following blocks always executes, regardless of an exception occurring or not?

* A. try

* B. catch

* C. finally

* D. throw

**Answer:** C
**Explanation:** The `finally` block is designed to always execute after `try` or `catch` blocks finish, ensuring cleanup operations run.

### Question 11

What will be the output of the following code?

```
public class Geeks {
    public static void main(String[] args) {
        try {
            System.out.println("Inside try");
            throw new RuntimeException("Error");
        } finally {
            System.out.println("Inside finally");
        }
    }
}

```

* A. Inside try

* B. Inside try Inside finally

* C. Inside try Inside finally RuntimeException

* D. Compilation Error

**Answer:** C
**Explanation:** "Inside try" prints first, then the `finally` block runs printing "Inside finally", and finally the unhandled `RuntimeException` terminates the program with a stack trace.

### Question 12

What will happen in the following code?

```
public class Geeks {
    static void method() throws Exception {
        throw new Exception("Error occurred");
    }

    public static void main(String[] args) {
        method();
    }
}

```

* A. Compilation Error

* B. Runtime Exception

* C. Exception: Error occurred

* D. Program runs successfully

**Answer:** A
**Explanation:** `method()` declares a checked exception (`Exception`), so `main` must either handle it using try-catch or declare it in its `throws` clause; otherwise, it results in a compilation error.

### Question 13

What is the difference between throw and throws?

* A. throw is used to declare exceptions, throws is used to throw exceptions

* B. throws is used to declare exceptions, throw is used to throw exceptions

* C. Both are used to declare exceptions

* D. Both are used to throw exceptions

**Answer:** B
**Explanation:** `throws` declares the potential exceptions a method can throw, whereas `throw` is used to explicitly throw an exception object.

### Question 14

What will be the output of the following program?

```
class CustomException extends Exception {
    public CustomException(String message) {
        super(message);
    }
}

public class Geeks {
    public static void main(String[] args) {
        try {
            throw new CustomException("Custom error occurred");
        } catch (CustomException e) {
            System.out.println(e.getMessage());
        }
    }
}

```

* A. Custom error occurred

* B. Runtime Exception

* C. Compilation Error

* D. No Output

**Answer:** A
**Explanation:** The exception is thrown with the message "Custom error occurred" and caught by the `catch` block, which prints `e.getMessage()`.

### Question 15

What happens when finalize() is called on an object?

* A. The object is immediately garbage collected.

* B. The garbage collector calls it before collecting the object.

* C. The object gets permanently deleted from memory.

* D. It prevents an object from being collected.

**Answer:** B
**Explanation:** The Garbage Collector calls `finalize()` on an object prior to reclaiming its memory to allow performing clean-up operations.

### Question 16

What is the output of the following code?

```
public class Geeks {
    public static void main(String[] args) {
        try {
            System.exit(0);
        } finally {
            System.out.println("Finally executed");
        }
    }
}

```

* A. Finally executed

* B. No output

* C. Runtime Error

* D. Compilation Error

**Answer:** B
**Explanation:** `System.exit(0)` stops the execution of the JVM immediately, so the `finally` block never executes and produces no output.

### Question 17

Which of the following is true about custom exceptions?

* A. Custom exceptions cannot extend Exception class

* B. Custom exceptions are always checked exceptions

* C. Custom exceptions can extend Exception or RuntimeException

* D. Custom exceptions do not require a constructor

**Answer:** C
**Explanation:** Custom exceptions can be checked (extending `Exception`) or unchecked (extending `RuntimeException`).

### Question 18

Which of the following correctly defines a custom exception?

* A. `class MyException { public MyException(String message) { super(message); } }`

* B. `class MyException extends RuntimeException { public MyException(String message) { super(message); } }`

* C. `class MyException extends Throwable { public MyException(String message) { super(message); } }`

* D. `class MyException extends Error { public MyException(String message) { super(message); } }`

**Answer:** B
**Explanation:** Custom exception classes should inherit from `Exception` or `RuntimeException`. Standard practice uses `RuntimeException` for unchecked custom exceptions.

### Question 19

What does the finally block do in exception handling?

* A. Handles the exception

* B. Always executes whether an exception occurs or not

* C. Follows the try block

* D. All of the above

**Answer:** B
**Explanation:** The core function of `finally` is to execute code regardless of whether an exception occurred or was caught.

### Question 20

What is the purpose of the try-with-resources statement in Java?

* A. To catch exceptions

* B. To release resources automatically

* C. To handle multiple exceptions

* D. To create checked exceptions

**Answer:** B
**Explanation:** Try-with-resources ensures that opened resources (like streams or database connections) are automatically closed at the end of the statement.

### Question 21

Which keyword is used to explicitly throw an exception in Java?

* A. try

* B. catch

* C. throw

* D. finally

**Answer:** C
**Explanation:** The `throw` keyword is used to explicitly instantiate and throw an exception object in Java.

### Question 22

Can multiple catch blocks be used for a single try block in Java?

* A. No, only one catch block is allowed

* B. Yes, but only for checked exceptions

* C. Yes, for different types of exceptions

* D. No, try block cannot catch exceptions

**Answer:** C
**Explanation:** A single `try` block can be followed by multiple `catch` blocks to handle different specific types of exceptions.

### Question 23

What is the difference between checked and unchecked exceptions in Java?

* A. Checked exceptions are caught at compile-time, while unchecked exceptions are caught at runtime

* B. Checked exceptions are caught at runtime, while unchecked exceptions are caught at compile-time

* C. Checked exceptions are explicitly declared in the code, while unchecked exceptions are not

* D. Checked exceptions are related to I/O operations, while unchecked exceptions are related to logic errors

**Answer:** C
**Explanation:** Checked exceptions are checked at compile-time and must be explicitly declared or caught, whereas unchecked exceptions (subclasses of `RuntimeException`) do not require explicit declaration or handling.

### Question 24

When does a finally block not execute in Java?

* A. When an exception occurs

* B. When a catch block executes

* C. When a return statement is encountered

* D. Finally block always executes

**Answer:** D
**Explanation:** In general execution flows (excluding JVM termination like `System.exit()`), the `finally` block is guaranteed to execute regardless of return statements or caught exceptions.

### Question 25

What is the purpose of the throws keyword in Java?

* A. To catch exceptions

* B. To declare checked exceptions

* C. To throw exceptions

* D. To handle exceptions

**Answer:** B
**Explanation:** The `throws` keyword is declared in a method signature to specify which checked exceptions it may pass to its caller.

### Question 26

Which exception class is the base class for all exceptions in Java?

* A. RuntimeException

* B. Exception

* C. Throwable

* D. Error

**Answer:** B
**Explanation:** `Exception` is the direct base class for all exceptions (both checked and unchecked) in Java, distinct from `Error`.

### Question 27

Which of the following code snippets demonstrates the correct syntax for exception handling in Java?

* A. `try { // code } catch (Exception e) { // handle }`

* B. `try { // code } catch (error e) { // handle }`

* C. `try { // code } catch (Throwable t) { // handle }`

* D. `try { // code } catch (RuntimeException e) { // handle }`

**Answer:** A
**Explanation:** Standard exception handling in Java uses lower-case keyword `catch` and targets specific exception types starting with `Exception e`.

### Question 28

Which of the following is true about checked and unchecked exceptions in Java?

* A. Checked exceptions are subclasses of Error class.

* B. Unchecked exceptions are subclasses of Exception class.

* C. Checked exceptions are required to be caught or declared.

* D. Unchecked exceptions are always fatal and cannot be recovered from.

**Answer:** C
**Explanation:** The Java compiler enforces that checked exceptions must be caught in a `try-catch` block or declared using the `throws` keyword.

### Question 29

Which of the following is NOT a type of Java exception?

* A. ArithmeticException

* B. NullPointerException

* C. InvalidInputException

* D. ArrayIndexOutOfBoundsException

**Answer:** C
**Explanation:** `InvalidInputException` is not a standard built-in Java exception class, whereas the other three exist in `java.lang`.

### Question 30

How can you handle multiple exceptions in a single catch block in Java?

* A. Use separate catch blocks for each exception.

* B. Use a finally block after the catch block.

* C. Use the throws keyword to specify multiple exceptions.

* D. Use a single catch block with multiple exception types separated by a pipe (|) symbol.

**Answer:** D
**Explanation:** Java 7 introduced the multi-catch block feature using the syntax `catch (ExceptionA | ExceptionB e)`.

### Question 31

What is the purpose of the finally block in try-catch-finally exception handling?

* A. To catch and handle exceptions.

* B. To specify the types of exceptions that can be thrown.

* C. To ensure that certain code is always executed, whether an exception occurs or not.

* D. To transfer control to a specific catch block.

**Answer:** C
**Explanation:** The primary goal of `finally` is resource cleanup by executing critical code regardless of exceptions.

### Question 32

What happens if an exception is thrown in the catch block itself?

* A. The exception is caught and handled by the same catch block.

* B. The catch block is skipped, and the exception is caught by the next catch block (if any).

* C. The catch block is caught by the catch block but is not handled.

* D. The exception is thrown further up the call stack.

**Answer:** D
**Explanation:** If an uncaught exception occurs within a `catch` block, execution aborts and the exception propagates up the call stack (after `finally` executes, if present).

### Question 33

Which of the following is an unchecked exception in Java?

* A. IOException

* B. ClassNotFoundException

* C. RuntimeException

* D. SQLException

**Answer:** C
**Explanation:** `RuntimeException` and all its subclasses are unchecked exceptions, whereas `IOException`, `ClassNotFoundException`, and `SQLException` are checked exceptions.

### Question 34

What happens if an exception is thrown inside a finally block?

* A. The exception is caught and handled by the same finally block.

* B. The finally block is skipped, and the exception is caught by the next finally block (if any).

* C. The exception is caught by the finally block but is not handled.

* D. The exception is thrown further up the call stack.

**Answer:** D
**Explanation:** An exception originating inside a `finally` block suppresses any previous unhandled exception and is thrown directly up the call stack.