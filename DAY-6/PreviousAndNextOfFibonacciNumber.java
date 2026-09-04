/* 
Given a Fibonacci number, find its previous and next Fibonacci numbers.

Example 1: 5
Output: Previous: 3, Next: 8

Example 2: 13
Output: Previous: 8, Next: 21

Example 3: 21
Output: Previous: 13, Next: 34
*/

import java.util.*;

public class PreviousAndNextOfFibonacciNumber {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter a Fibonacci number: ");
        int fibNumber = sc.nextInt();

        int prevFib = 0, nextFib = 0;

        // Find previous Fibonacci number
        int a = 0, b = 1;
        while (b < fibNumber) {
            prevFib = b;
            int temp = b;
            b = a + b;
            a = temp;
        }

        // Find next Fibonacci number
        nextFib = a + b;

        System.out.println("Previous Fibonacci number: " + prevFib);
        System.out.println("Next Fibonacci number: " + nextFib + "\n");
        sc.close();
    }
}