/*
Given a string s, count the total number of unique characters across all possible substrings.

A character is considered unique in a substring if it occurs exactly once in that substring.

Example 1
Input: ABC
Output: 10

Example 2
Input: ABA
Output: 8

Expected Time Complexity: O(N)
*/


import java.util.Scanner;
import java.util.Arrays;

public class UniqueCharactersInAllSubstrings {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter string: ");
        String str = sc.next();

        System.out.println("Total unique characters: " + countUniqueCharacters(str) + "\n");

        sc.close();
    }

    public static long countUniqueCharacters(String s) {
        int n = s.length();

        int[] prev = new int[256];
        int[] last = new int[256];

        Arrays.fill(prev, -1);
        Arrays.fill(last, -1);

        long result = 0;

        for (int i = 0; i < n; i++) {
            char ch = s.charAt(i);

            if (last[ch] != -1) {
                result += (long) (last[ch] - prev[ch]) * (i - last[ch]);
            }

            prev[ch] = last[ch];
            last[ch] = i;
        }

        for (int ch = 0; ch < 256; ch++) {
            if (last[ch] != -1) {
                result += (long) (last[ch] - prev[ch]) * (n - last[ch]);
            }
        }

        return result;
    }
}
