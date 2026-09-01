/*
Longest Consecutive Sequence

Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
You must write an algorithm that runs in O(n) time.

Example 1:
Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

Example 2:
Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9

Example 3:
Input: nums = [1,0,1,2]
Output: 3
 
Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109

*/

import java.util.*;

public class LongestConsecutiveSequence {
    public int longestConsecutive(int[] nums) {
        if (nums.length == 0) {
            return 0;
        }

        HashSet<Integer> set = new HashSet<>();
        for (int num : nums) {
            set.add(num);
        }

        int maxLength = 0;

        for (int num : set) {
            if (!set.contains(num - 1)) {
                int current = num;
                int currentLength = 1;

                while (set.contains(current + 1)) {
                    current++;
                    currentLength++;
                }

                maxLength = Math.max(maxLength, currentLength);
            }
        }

        return maxLength;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the number of elements in the array: ");
        int n = sc.nextInt();
        int[] nums = new int[n];
        
        System.out.print("Enter the elements of the array: ");
        for (int i = 0; i < n; i++) {
            nums[i] = sc.nextInt();
        }

        LongestConsecutiveSequence lcs = new LongestConsecutiveSequence();
        int result = lcs.longestConsecutive(nums);
        System.out.println("Length of the longest consecutive elements sequence: " + result + "\n");
        sc.close();
    }
}