/* 
Largest Subarray of Equal 0's and 1's

Given an array arr of 0s and 1s. Find and return the length of the longest subarray with equal number of 0s and 1s.

Examples:

Input: arr[] = [1, 0, 1, 1, 1, 0, 0]
Output: 6
Explanation: arr[1...6] is the longest subarray with three 0s and three 1s.

Input: arr[] = [0, 0, 1, 1, 0]
Output: 4
Explanation: arr[0...3] or arr[1...4] is the longest subarray with two 0s and two 1s.

Input: arr[] = [0]
Output: 0
Explanation: There is no subarray with an equal number of 0s and 1s.


Constraints:

1 ≤ arr.size() ≤ 105
0 ≤ arr[i] ≤ 1
Expected Complexities
Time Complexity: O(n)
Auxiliary Space: O(n)
*/

import java.util.HashMap;
import java.util.Scanner;

public class LargestSubarrayOfEqual0sAnd1s {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter number of elements: ");
        int n = sc.nextInt();

        int[] arr = new int[n];
        System.out.print("Enter array elements: ");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        System.out.println("Subarray Sum Equals Target: " + findMaxLength(arr) + "\n");

        sc.close();
    }

    public static int findMaxLength(int[] nums) {
        HashMap<Integer, Integer> map = new HashMap<>();
        map.put(0, -1);

        int count = 0;
        int maxLen = 0;

        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 0) count -= 1;
            if (nums[i] == 1) count += 1;

            if (!map.containsKey(count)) {
                map.put(count, i);
            } else {
                maxLen = Math.max(maxLen, i - map.get(count));
            }
        }

        return maxLen;
    }
}