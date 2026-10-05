/*
# Moving Average — Sliding Window

## Question

You need to design a class `MovingAverage` that calculates the moving average of all integers in a sliding window of a fixed size.

It must implement:

1. `MovingAverage(int size)`: Initializes the object with the maximum size of the window.
2. `double next(int val)`: Adds a new integer `val` to the stream and returns the moving average of the last `size` elements.

If fewer than `size` elements have been seen, calculate the average of all elements seen so far.

### Example

```text
Input:
MovingAverage movingAverage = new MovingAverage(3);

movingAverage.next(1);   // 1.0
movingAverage.next(10);  // 5.5
movingAverage.next(3);   // 4.66667
movingAverage.next(5);   // 6.0
```

### Explanation

For window size `3`:

```text
next(1)
Window = [1]
Average = 1 / 1 = 1.0

next(10)
Window = [1, 10]
Average = 11 / 2 = 5.5

next(3)
Window = [1, 10, 3]
Average = 14 / 3 = 4.66667

next(5)
Window = [10, 3, 5]
1 is removed because the window size is 3.
Average = 18 / 3 = 6.0
```

## Approach

Use:

* `Queue<Integer>` to store the current sliding window.
* `sum` to maintain the sum of elements in the window.

For every `next(val)`:

1. Add `val` to the queue.
2. Add `val` to `sum`.
3. If the queue exceeds the maximum size, remove the oldest element.
4. Subtract the removed element from `sum`.
5. Return `sum / queue.size()`.

## Complete Java Program
*/

import java.util.*;

class MovingAverage {

    private Queue<Integer> q;
    private int size;
    private double sum;

    // Constructor
    public MovingAverage(int size) {
        this.size = size;
        q = new LinkedList<>();
        sum = 0;
    }

    // Adds a value and returns the moving average
    public double next(int val) {

        // Add new value
        q.offer(val);
        sum += val;

        // Remove oldest value if window exceeds size
        if (q.size() > size) {
            sum -= q.poll();
        }

        // Return average
        return sum / q.size();
    }
}

public class Main {

    public static void main(String[] args) {

        MovingAverage movingAverage = new MovingAverage(3);

        System.out.println(movingAverage.next(1));
        System.out.println(movingAverage.next(10));
        System.out.println(movingAverage.next(3));
        System.out.println(movingAverage.next(5));
    }
}

/* 
## Output

```text
1.0
5.5
4.666666666666667
6.0
```

## Complexity

```text
next() → O(1)
Space  → O(size)
```

The key idea is: **Queue = sliding window, `sum` = current window sum.**
*/