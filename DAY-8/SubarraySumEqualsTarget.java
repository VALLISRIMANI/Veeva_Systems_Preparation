/* 
Subarray Sum Equals Target
Given an array of non-negative integers nums and an integer target, return true if there is a contiguous non-empty subarray that sums up to target, or false otherwise.

A subarray is a contiguous non-empty sequence of elements within an array.

Examples
Example 1:
Input: nums = [1, 2, 3], target = 5
Output: true
Explanation: The subarray [2, 3] sums up to 5.

Example 2:
Input: nums = [11, 21, 4], target = 9
Output: false
Explanation: No continuous subarray sums up to 9.

Example 3:
Input: nums = [0], target = 0
Output: true
Explanation: The subarray [0] sums up to 0.

Constraints
0 <= nums.length <= 10⁵

0 <= nums[i] <= 10⁹

0 <= target <= 10⁹
*/

import java.util.*;

public class SubarraySumEqualsTarget {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter number of elements: ");
        int n = sc.nextInt();

        int[] arr = new int[n];
        System.out.print("Enter array elements: ");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        System.out.print("Enter target sum: ");
        int sum = sc.nextInt();

        System.out.println("Subarray Sum Equals Target: " + subarraySumEqualsTarget(arr, n, sum) + "\n");

        sc.close();
    }

    public static boolean subarraySumEqualsTarget(int[] arr, int n, int sum) {
        int i = 0, j = 0;
        int currentSum = 0;

        while (j < n) {
            currentSum += arr[j];

            while (currentSum > sum && i <= j) {
                currentSum -= arr[i];
                i++;
            }

            if (currentSum == sum) {
                return true;
            }

            j++;
        }

        return false;

        /* If the input contains negative numbers
        HashSet<Integer> set = new HashSet<>();
        set.add(0);
        int currentSum = 0;

        for (int i = 0; i < n; i++) {
            currentSum += arr[i];

            if (set.contains(currentSum - sum)) {
                return true;
            }

            set.add(currentSum);
        }

        return false;
        */
    }
}

/*
When the array contains negative numbers, the sliding window approach fails. Adding an element can decrease the total sum, and shrinking the window from the left can increase it, breaking the monotonicity required for two pointers.To fix this, we switch to the Prefix Sum + Hash Map (or Hash Set) pattern, which runs in $O(n)$ time and $O(n)$ space.


public static boolean subarraySumEqualsTarget(int[] arr, int n, int sum) {
    HashSet<Integer> set = new HashSet<>();
    set.add(0);
    int currentSum = 0;

    for (int i = 0; i < n; i++) {
        currentSum += arr[i];

        if (set.contains(currentSum - sum)) {
            return true;
        }

        set.add(currentSum);
    }

    return false;
}
*/