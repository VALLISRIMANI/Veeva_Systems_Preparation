/* 
Given an array of strings, rotate the array to the right by k steps, where k is non-negative.

Example 1: ["apple", "banana", "cherry", "date"], k = 2
Output: ["cherry", "date", "apple", "banana"]

Example 2: ["one", "two", "three", "four", "five"], k = 3
Output: ["three", "four", "five", "one", "two"]
*/

import java.util.*;


public class RotateArrayOfStringsKTimes {
    public static void rotate(String[] words, int start, int end) {
        while (start <= end) {
            String temp = words[start];
            words[start] = words[end];
            words[end] = temp;
            start++;
            end--;
        }
    }    


    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the number of strings: ");
        int n = sc.nextInt();
        String[] words = new String[n];
        for (int i = 0; i < n; i++) {
            System.out.print("Enter string " + (i + 1) + ": ");
            words[i] = sc.next();
        }

        System.out.print("Enter the number of rotations (k): ");
        int k = sc.nextInt();

        k %= n;

        rotate(words, 0, n - 1);
        rotate(words, 0, k - 1);
        rotate(words, k, n - 1);

        System.out.println("\nRotated array of strings: " + Arrays.toString(words));
        sc.close();
    }
}
