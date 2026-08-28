/*
You are given an integer array and a target sum. Your task is to find the count of subarrays whose sum is equal to the target sum.

Example 1:
Input: arr = [1, 2, 3], target = 3
Output: 2

Example 2:
Input: arr = [1, 1, 1], target = 2  
Output: 2
*/

import java.util.*;

public class CountOfSubarraysSumEqualToTarget {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the size of the array: ");
        int n = sc.nextInt();
        int[] arr = new int[n];
        System.out.print("Enter the elements of the array: ");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }
        System.out.print("Enter the target sum: ");
        int target = sc.nextInt();

        int count = 0;
        for (int start = 0; start < n; start++) {
            int sum = 0;
            for (int end = start; end < n; end++) {
                sum += arr[end];
                if (sum == target) {
                    count++;
                }
            }
        }

        System.out.println("The count of subarrays with sum equal to target is: " + count + "\n");
        sc.close();
    }
}