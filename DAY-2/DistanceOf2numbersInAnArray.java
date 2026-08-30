/*
Given an array of N integers. Find distance of any 2 closest numbers in the array with no duplicates.

Examples:

1. N = 5, arr = [5, 2, 3, 4, 1] 
Ouput: 1

2. N = 2, arr = [10, 20]
Output: 10

3. N = 2, arr = [2147483647, 2147483646]
Output: 1

4. N = 5, arr = [-10, 20, -5, 0, 8]
Output: 5

5. N = 2, arr = [2147483647, -2147483648]
Output: 4294967295
*/

import java.util.*;

public class DistanceOf2numbersInAnArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter number of elements: ");
        int n = sc.nextInt();

        int[] arr = new int[n];
        System.out.print("Enter array elements: ");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        if (n < 2) {
            System.out.println(-1);
        } else {
            Arrays.sort(arr);
            Long minDistance = Long.MAX_VALUE;

            for (int i = 0; i < n - 1; i++) {
                minDistance = Math.min(minDistance, Math.abs((long) arr[i] - arr[i + 1]));
            }

            System.out.println("Minimum Distance: " + minDistance);
        }

        sc.close();
    }
}
