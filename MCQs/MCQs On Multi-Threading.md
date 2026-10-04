# Java Multithreading MCQs

### Question 1

What is multithreading in Java?

* A. It refers to a technique in which a single thread is executed multiple times in a loop.
* B. It refers to a technique in which multiple threads are executed concurrently to improve performance.
* C. It refers to a technique in which a thread is used to create multiple instances of a class.
* D. It refers to a technique in which a thread is used to synchronize multiple objects.

**Answer:** B  
**Explanation:** Multithreading allows concurrent execution of two or more parts of a program (threads) to maximize CPU utilization.

---

### Question 2

Which keyword is used to create a thread in Java?

* A. new
* B. class
* C. thread
* D. start

**Answer:** A  
**Explanation:** In Java, `new` is the keyword used to instantiate objects, including `Thread` instances (e.g., `Thread t = new Thread();`). Java does not have a `thread` keyword.

---

### Question 3

Which method is used to start a thread in Java?

* A. run()
* B. start()
* C. execute()
* D. begin()

**Answer:** B  
**Explanation:** Calling `start()` allocates a new call stack for the thread and then invokes the `run()` method asynchronously.

---

### Question 4

What is the difference between Thread.sleep() and Object.wait() methods in Java?

* A. Thread.sleep() is used to pause the execution of the current thread, while Object.wait() is used to suspend a thread until notified or interrupted.
* B. Thread.sleep() keeps object locks while sleeping, whereas Object.wait() releases the lock on the monitor object.
* C. Thread.sleep() can only be called on the main thread, while Object.wait() can be called on any thread.
* D. There is no difference between Thread.sleep() and Object.wait() methods.

**Answer:** A  
**Explanation:** `Thread.sleep()` pauses the execution of the current thread for a specified time without releasing locks, while `Object.wait()` releases the object monitor lock and waits until `notify()` or `notifyAll()` is called.

---

### Question 5

How can you prevent multiple threads from accessing a shared resource simultaneously in Java?

* A. By using synchronized keyword
* B. By using volatile keyword
* C. By using atomic variables
* D. All of the above

**Answer:** D  
**Explanation:** `synchronized` blocks/methods ensure mutual exclusion. Additionally, `volatile` and atomic classes (like `AtomicInteger`) prevent concurrent race conditions depending on the scenario. However, `synchronized` is the standard tool for full mutual exclusion.

---

### Question 6

What is the purpose of the join() method in Java?

* A. To pause the execution of the current thread
* B. To join two or more threads together
* C. To wait for a thread to complete its execution
* D. To terminate a thread

**Answer:** C  
**Explanation:** The `join()` method forces the calling thread to wait until the thread on which `join()` was called completes its execution.

---

### Question 7

What is deadlock in multithreading?

* A. It occurs when two or more threads are waiting for each other to release resources and none of them can proceed.
* B. It occurs when a thread enters an infinite loop and never terminates.
* C. It occurs when multiple threads try to access a shared resource simultaneously and cause data corruption.
* D. It occurs when a thread calls the wait() method and waits indefinitely for a notify() or notifyAll() call.

**Answer:** A  
**Explanation:** Deadlock is a situation where two or more threads are blocked forever, each waiting for a resource held by the other.

---

### Question 8

Which method is used to interrupt a thread in Java?

* A. sleep()
* B. interrupt()
* C. stop()
* D. break()

**Answer:** B  
**Explanation:** The `interrupt()` method sets the thread's interrupt status flag or wakes up sleeping/waiting threads by throwing an `InterruptedException`.

---

### Question 9

What is the purpose of the yield() method in Java?

* A. To pause the execution of the current thread
* B. To make the current thread sleep for a specific duration
* C. To transfer the CPU control to another thread of the same priority
* D. To terminate the current thread

**Answer:** C  
**Explanation:** `Thread.yield()` gives a hint to the thread scheduler that the current thread is willing to yield its current use of a processor to threads of equal priority.

---

### Question 10

What is the purpose of the isAlive() method in Java?

* A. To check if a thread is currently running
* B. To check if a thread is alive or dead
* C. To check if a thread is in a sleep state
* D. To check if a thread is waiting for a lock or monitor

**Answer:** B  
**Explanation:** `isAlive()` returns `true` if the thread has been started and has not yet terminated.

---

### Question 11

Which of the following is true about Java multithreading?

* A. Java multithreading allows multiple threads to execute simultaneously on a single processor.
* B. Java multithreading allows only one thread to execute at a time on a single processor.
* C. Java multithreading is not supported in the Java programming language.
* D. Java multithreading allows multiple threads to execute simultaneously on multiple processors.

**Answer:** A  
**Explanation:** Via time-slicing on a single processor core, multiple threads can execute concurrently by rapidly switching CPU context.

---

### Question 12

What is the correct way to create a new thread in Java?

* A. Thread myThread = new Thread(); myThread.start();
* B. MyThread myThread = new MyThread(); myThread.run();
* C. Thread myThread = Thread.create(); myThread.run();
* D. MyThread myThread = new MyThread(); myThread.start();

**Answer:** D  
**Explanation:** The proper OOP way to create custom thread behavior is to extend `Thread` (or implement `Runnable`) and invoke `.start()` on that subclass instance.

---

### Question 13

Which of the following methods is used to acquire a lock on an object in Java?

* A. Object.wait()
* B. Thread.sleep()
* C. Object.lock()
* D. synchronized

**Answer:** D  
**Explanation:** The `synchronized` keyword (or explicit `ReentrantLock` instances) is used to acquire an intrinsic monitor lock on an object. `Object.lock()` does not exist in standard Java.

---

### Question 14

What is the purpose of the wait() and notify() methods in Java?

* A. The wait() method is used to make a thread wait for a condition to be satisfied, and the notify() method is used to wake up a thread that is waiting for a condition.
* B. The wait() method is used to terminate a thread, and the notify() method is used to start a thread.
* C. The wait() method is used to pause the execution of a thread for a specified amount of time, and the notify() method is used to resume the execution of a paused thread.
* D. The wait() and notify() methods are used to synchronize access to shared resources between multiple threads.

**Answer:** A  
**Explanation:** `wait()` causes the current thread to wait until another thread invokes `notify()` or `notifyAll()` on the same object monitor.

---

### Question 17

What is the purpose of the join() method in Java?

* A. The join() method is used to terminate a thread.
* B. The join() method is used to wait for a thread to complete its execution.
* C. The join() method is used to synchronize access to shared resources between multiple threads.
* D. The join() method is used to pause the execution of a thread for a specified amount of time.

**Answer:** B  
**Explanation:** `join()` blocks the calling thread until the targeted thread finishes execution.

---

### Question 18

What is the output of the following code snippet?

```java
class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Hello, World!");
    }
}

public class Main {
    public static void main(String[] args) {
        Thread myThread = new Thread(new MyRunnable());
        myThread.start();
    }
}
```

* A. Hello, World!
* B. Hello
* C. World
* D. The code will not compile due to errors.

**Answer:** A  
**Explanation:** Passing a `Runnable` object to a `Thread` constructor and invoking `.start()` correctly executes its `run()` method asynchronously.

---

### Question 19

What happens when two threads try to update the same variable simultaneously without synchronization?

* A. The variable's value will always be updated correctly without any issues.
* B. One of the threads will update the variable's value and the other thread's update will be lost.
* C. The threads will take turns updating the variable's value in a synchronized manner.
* D. The behavior is unpredictable and can result in inconsistent or incorrect values.

**Answer:** D  
**Explanation:** Unsynchronized concurrent writes cause race conditions, resulting in unpredictable and corrupted variable state values.

---

### Question 20

Which of the following is an advantage of using threads in Java?

* A. Threads allow for concurrent execution, which can improve performance by utilizing multiple processors or processor cores.
* B. Threads can be used to create parallel programs that can execute tasks simultaneously.
* C. Threads can simplify the design and implementation of certain types of programs, such as event-driven applications.
* D. All of the above.

**Answer:** D  
**Explanation:** Java multithreading provides better CPU utilization, asynchronous task processing, and responsive architecture for event-driven systems.

---

### Question 21

What is a deadlock in multithreading?

* A. A deadlock occurs when a thread is blocked and unable to proceed because it is waiting for a resource held by another thread, while the other thread is also waiting for a resource held by the first thread.
* B. A deadlock occurs when a thread is terminated unexpectedly, resulting in the termination of the entire application.
* C. A deadlock occurs when multiple threads are executing simultaneously and interfere with each other's execution, resulting in unpredictable output or errors.
* D. A deadlock occurs when a thread is able to execute multiple tasks simultaneously, resulting in improved performance.

**Answer:** A  
**Explanation:** A circular wait condition among threads competing for locked resources causes a deadlock.

---

### Question 22

Which of the following is the correct way to create a thread in Java?

* A. Extending the Thread class
* B. Implementing the Runnable interface
* C. Both A and B
* D. Using the Callable interface only

**Answer:** C  
**Explanation:** Threads can be created either by extending `java.lang.Thread` or by implementing `java.lang.Runnable`.

---

### Question 23

What will be the output of the following code?

```java
class MyThread extends Thread {
    public void run() {
        System.out.println("Thread is running");
    }

    public static void main(String[] args) {
        MyThread t = new MyThread();
        t.run();
    }
}
```

* A. Thread is running
* B. Compilation Error
* C. No Output
* D. Runtime Exception

**Answer:** A  
**Explanation:** Direct invocation of `run()` does not start a new thread stack, but executes directly in the context of the main thread and prints "Thread is running".

---

### Question 24

Which method is used to start a thread in Java?

* A. run()
* B. start()
* C. execute()
* D. begin()

**Answer:** B  
**Explanation:** `start()` allocates thread environment resources and triggers execution of the `run()` method in a separate thread.

---

### Question 25

What is the initial state of a thread when it is created but not yet started?

* A. NEW
* B. RUNNABLE
* C. BLOCKED
* D. WAITING

**Answer:** A  
**Explanation:** A newly created thread object that has not yet had its `start()` method called is in the `NEW` state.

---

### Question 26

Which of the following statements about the Runnable interface is true?

* A. It contains the start() method
* B. It contains the run() method
* C. It can only be implemented by a class that extends Thread
* D. It cannot be used for multithreading

**Answer:** B  
**Explanation:** `Runnable` is a functional interface containing a single abstract method: `public void run()`.

---

### Question 27

What happens if start() is called twice on the same thread?

```java
class MyThread extends Thread {
    public void run() {
        System.out.println("Running...");
    }
    
    public static void main(String[] args) {
        MyThread t = new MyThread();
        t.start();
        t.start();
    }
}
```

* A. Thread runs twice
* B. Compiles and runs normally
* C. Throws IllegalThreadStateException
* D. No output

**Answer:** C  
**Explanation:** Once a thread finishes or starts, re-invoking `start()` on the same thread instance throws an `IllegalThreadStateException`.

---

### Question 28

Which of the following is NOT a valid thread state in Java?

* A. NEW
* B. TERMINATED
* C. RUNNING
* D. TIMED_WAITING

**Answer:** C  
**Explanation:** In `Thread.State` enum, there is no `RUNNING` state. Running threads are categorized under `RUNNABLE`.

---

### Question 29

What happens if sleep(1000) is called inside a thread?

* A. Thread execution is paused for 1 second
* B. Thread is terminated
* C. Thread goes to NEW state
* D. Thread execution continues immediately

**Answer:** A  
**Explanation:** `Thread.sleep(1000)` pauses the execution of the thread for 1000 milliseconds (1 second).

---

### Question 30

What will be the output of the following code?

```java
class Geeks {
    public static void main(String[] args) {
        Thread t = new Thread(() -> System.out.println("Hello from Thread"));
        t.start();
    }
}
```

* A. Hello from Thread
* B. Compilation Error
* C. No Output
* D. Runtime Exception

**Answer:** A  
**Explanation:** Java 8+ lambda expressions can implement the `Runnable` functional interface, outputting "Hello from Thread".

---

### Question 31

Which method is used to wait for a thread to finish execution?

* A. wait()
* B. sleep()
* C. join()
* D. yield()

**Answer:** C  
**Explanation:** `join()` pauses the executing thread until the target thread thread has finished executing.

---

### Question 32

How can you create a new thread in Java by implementing the Runnable interface?

* A. Create an object of the Thread class
* B. Create a class that implements the Runnable interface and override the run() method
* C. Use the start() method of the main thread
* D. None of These

**Answer:** B  
**Explanation:** A class implements `Runnable`, overrides `run()`, and is then passed into a `Thread` constructor.

---

### Question 33

In Java, can a thread be restarted after it has completed execution?

* A. Yes, a thread can be restarted multiple times
* B. Only if the thread is marked as "final"
* C. Only if the thread is marked as "static"
* D. No, a thread cannot be restarted once it has completed

**Answer:** D  
**Explanation:** Once a thread reaches the `TERMINATED` state, it cannot be restarted. Attempting to call `start()` again throws `IllegalThreadStateException`.

---

### Question 34

What is the result of calling the run() method directly instead of start() in Java threads?

* A. The run() method is executed in the current thread, not as a separate thread
* B. It starts a new thread and executes the run() method
* C. It stops the thread immediately
* D. It suspends the thread

**Answer:** A  
**Explanation:** Calling `.run()` directly behaves like a standard method call on the caller thread without spinning up a separate execution thread.

---

### Question 35

How can you achieve synchronization between threads in Java?

* A. By using the interrupt() method
* B. By using the wait() and notify() methods
* C. By using multiple catch blocks
* D. By using the synchronized keyword or synchronized blocks

**Answer:** D  
**Explanation:** Mutual exclusion and thread synchronization in Java are primary achieved via `synchronized` methods/blocks or explicit locks from `java.util.concurrent.locks`.

---

### Question 36

What is a race condition in multithreaded Java programs?

* A. A situation where threads synchronize perfectly
* B. A situation where threads never finish executing
* C. A situation where multiple threads access shared data simultaneously, leading to unpredictable results
* D. A situation where threads throw exceptions

**Answer:** C  
**Explanation:** A race condition occurs when two or more threads access shared data concurrently and try to change it at the same time without adequate locking.

---

### Question 37

In Java, what is the purpose of the sleep() method in threads?

* A) It terminates all threads in the program
* B) It pauses the execution of the current thread for a specified duration
* C) It resumes the execution of a thread
* D) None of These

**Answer:** B  
**Explanation:** `Thread.sleep()` pauses execution for the given milliseconds without relinquishing lock ownership.

---

### Question 38

What is the purpose of the join() method in Java threads?

* A) It synchronizes threads
* B) It resumes a paused thread
* C) It waits for a thread to complete its execution before moving on
* D) It starts a new thread

**Answer:** C  
**Explanation:** `join()` blocks execution until the thread being joined has finished running.

---

### Question 39

What is a deadlock in multithreading?

* A) A situation where a thread runs indefinitely without blocking
* B) A situation where all threads complete successfully
* C) A situation where a thread is terminated forcibly
* D) A situation where two or more threads are unable to proceed because they are each waiting for the other to release a resource

**Answer:** D  
**Explanation:** Deadlock happens when multiple threads are blocked, each waiting for a lock held by another in a circular dependency chain.

---

### Question 40

In Java, what is the difference between a thread's priority and its thread group's maximum priority?

* A) A thread's priority determines its relative importance, while the thread group's maximum priority sets an upper limit on thread priorities
* B) A thread's priority is always higher than the thread group's maximum priority
* C) A thread's priority is the same as the thread group's maximum priority
* D) A thread's priority is unrelated to the thread group's maximum priority

**Answer:** A  
**Explanation:** Thread priority guides scheduling preference (1-10 scale), whereas a `ThreadGroup` max priority restricts the maximum priority level that member threads can be assigned.

---

### Question 41

How can you check if a thread is still running in Java?

* A) By using the runStatus() method
* B) By using the isThreadAlive() method
* C) By using the isRunning() method
* D) By using the isAlive() method

**Answer:** D  
**Explanation:** The `isAlive()` method of `java.lang.Thread` returns a boolean indicating if the thread is alive.

---

### Question 42

In Java, can you force a thread to stop its execution using the stop() method?

* A) No, the stop() method is deprecated and cannot be used
* B) Only if the thread is marked as "final"
* C) Yes, but it is discouraged because it can leave the program in an inconsistent state
* D) Only if the thread is marked as "static"

**Answer:** C  
**Explanation:** The `.stop()` method exists but is deprecated/discouraged because it unlocks all held monitors abruptly, potentially leaving shared data in an inconsistent state.