# MCQs On Classes and Objects – OOP in Java

## 1. Which of the following is NOT an OOP concept in Java?

A. Encapsulation  
B. Inheritance  
C. Polymorphism  
D. Compilation **✅ Correct Answer**

**Explanation:** Encapsulation, inheritance, and polymorphism are core OOP concepts. Compilation is a process used to translate Java source code into bytecode.

## 2. What is an object in Java?

A. A class template  
B. An instance of a class **✅ Correct Answer**  
C. A function  
D. A primitive data type

**Explanation:** An object is a runtime instance of a class that contains state and can provide behavior through methods.

## 3. Which keyword is used to create an object in Java?

A. `class`  
B. `this`  
C. `new` **✅ Correct Answer**  
D. `void`

**Explanation:** The `new` keyword creates a new object and allocates memory for it.

## 4. What is a class in Java?

A. A data type  
B. A blueprint for objects **✅ Correct Answer**  
C. A collection of methods  
D. A single method

**Explanation:** A class defines the structure and behavior that its objects can have.

## 5. What is the correct way to define a class in Java?

A. `public Example {}`  
B. `class Example {}` **✅ Correct Answer**  
C. `void Example {}`  
D. `object Example {}`

**Explanation:** A class can be declared using the `class` keyword followed by the class name and its body.

## 6. What does the `this` keyword refer to?

A. Current object **✅ Correct Answer**  
B. Parent class  
C. Static method  
D. Return type

**Explanation:** `this` refers to the current object whose method or constructor is being executed.

## 7. Which keyword refers to the immediate parent class object?

A. `base`  
B. `super` **✅ Correct Answer**  
C. `parent`  
D. `this`

**Explanation:** The `super` keyword is used to refer to members of the immediate superclass and to invoke its constructor.

## 8. What is the purpose of a constructor in Java?

A. To initialize variables **✅ Correct Answer**  
B. To create objects  
C. To destroy objects  
D. To define methods

**Explanation:** A constructor initializes a newly created object's state. The `new` keyword is responsible for object creation.

## 9. What does the `new` keyword do in Java?

A. Creates a new method  
B. Allocates memory for an object **✅ Correct Answer**  
C. Deletes an object  
D. Calls a static method

**Explanation:** `new` creates an object by allocating memory and invoking the appropriate constructor.

## 10. Which keyword is used to inherit a class in Java?

A. `super`  
B. `this`  
C. `extends` **✅ Correct Answer**  
D. `implements`

**Explanation:** A class inherits from another class using the `extends` keyword. `implements` is used when a class implements an interface.

## 11. Can a Java class extend multiple classes?

A. Yes  
B. No **✅ Correct Answer**

**Explanation:** Java does not support multiple inheritance of classes. A class can extend only one direct superclass.

## 12. What is the difference between an object and a class in Java?

A. An object is created from a class **✅ Correct Answer**  
B. A class is created from an object  
C. An object defines behavior  
D. A class defines behavior

**Explanation:** A class is a blueprint, while an object is an instance created from that class.

## 13. What is the default access modifier for class members in Java?

A. `private`  
B. `protected`  
C. `public`  
D. `package-private` **✅ Correct Answer**

**Explanation:** If no access modifier is specified for a class member, it has package-private access and can be accessed within the same package.

## 14. What is method overloading in Java?

A. Redefining a method with the same name and parameters  
B. Defining multiple methods with the same name but different parameters **✅ Correct Answer**  
C. Calling a method from within another method  
D. Extending a method to add more functionality

**Explanation:** Method overloading means having multiple methods with the same name but different parameter lists in the same class or inheritance context.

## 15. What is method overriding in Java?

A. Redefining a static method  
B. Redefining a method with the same name and parameters **✅ Correct Answer**  
C. Defining a method with a different name  
D. Hiding a method implementation

**Explanation:** Method overriding occurs when a subclass provides its own implementation of an inherited instance method with a compatible signature.

## 16. What is the purpose of the `Predicate` functional interface in Java 8?

A. To produce results  
B. To consume values  
C. To filter elements based on a condition **✅ Correct Answer**  
D. To transform values

**Explanation:** `Predicate<T>` represents a boolean-valued function and is commonly used to test or filter elements based on a condition.

## 17. What is the difference between a class member and an instance member in Java?

A. A class member is static, an instance member is non-static **✅ Correct Answer**  
B. A class member is non-static, an instance member is static  
C. A class member is private, an instance member is public  
D. A class member is public, an instance member is private

**Explanation:** Class members declared `static` belong to the class, while instance members belong to individual objects.

## 18. What is the default access modifier in Java for class members if no access modifier is specified?

A. Default **✅ Correct Answer**  
B. Private  
C. Public  
D. Protected

**Explanation:** No explicit modifier gives a member package-private, commonly called default access, meaning it is accessible within the same package.

## 19. What is the output of the following Java code snippet?

```java
public class MyClass {
    private int number = 10;

    public void display() {
        System.out.println(number);
    }
}

public class Main {
    public static void main(String[] args) {
        MyClass obj = new MyClass();
        System.out.println(obj.number);
    }
}
```

A. 10  
B. Error: Access Denied  
C. 0  
D. Compilation Error **✅ Correct Answer**

**Explanation:** `number` is declared `private`, so it cannot be accessed directly from the `Main` class. The code therefore fails to compile.

## 20. Which access modifier makes a class member accessible only within the same package?

A. Private  
B. Default **✅ Correct Answer**  
C. Public  
D. Protected

**Explanation:** Package-private/default access allows access from classes in the same package, subject to the usual Java access rules.

## 21. What is the correct syntax for declaring a public method named `display` in Java?

A. `public void display() { // Method implementation }` **✅ Correct Answer**  
B. `private void display() { // Method implementation }`  
C. `protected void display() { // Method implementation }`  
D. `void display() { // Method implementation }`

**Explanation:** The `public` keyword makes the method publicly accessible, and `void` specifies that it does not return a value.

## 22. Can a private method in Java be accessed from outside the class it belongs to?

A. Yes  
B. No **✅ Correct Answer**

**Explanation:** A private method is accessible only within the class where it is declared.

## 23. What will be the output of the following Java code?

```java
public class abc {
    int i;

    public int a(int x) {
        i = x + 1;
        System.out.println("Value of i=" + i);
        return i;
    }
}

public class xyz {
    abc obj1, obj2;

    public xyz() {
        obj1 = new abc();
        obj2 = obj1;
        obj2.a(3);
    }

    public static void main(String[] args) {
        xyz x = new xyz();
    }
}
```

A. Null Pointer Exception  
B. Print on the console: `Value of i=4` **✅ Correct Answer**  
C. Print on the console: `Value of i=3`

**Explanation:** `obj2` references the same `abc` object as `obj1`. Calling `a(3)` sets `i = 3 + 1`, so `Value of i=4` is printed.

## 24. Garbage collection in Java is _____

A. Initialization of unused local variables  
B. Reclaiming the memory occupied by an object that is no longer referenced by any reference variable **✅ Correct Answer**  
C. Assigning `null` to reference variables

**Explanation:** Garbage collection automatically identifies objects that are no longer reachable and reclaims their memory for reuse.
