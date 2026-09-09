/*
Given a string of characters, can you find the longest substring of the string that has no repeating characters?

An example is shown below:

abracadabar

Length of longest substring with no duplicates: 4
*/
import java.util.Scanner;
import java.util.HashSet;

import java.util.HashMap;

public class LongestSubstringWithNoDuplicateCharacters {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter string: ");
        String s = sc.next();

        usingHashSet(s);
        usingHashMap(s);

        sc.close();
    }

    public static void usingHashSet(String s) {
        HashSet<Character> set = new HashSet<>();
        int left = 0, right = 0, max = 0;

        while (right < s.length()) {
            char ch = s.charAt(right);
            if (!set.contains(ch)) {
                set.add(ch);
                right++;
                max = Math.max(max, right - left);
            } else {
                set.remove(s.charAt(left));
                left++;
            }
        }

        System.out.print("\nLongest Substring With No Duplicate Characters: " + max);
    }

    public static void usingHashMap(String s) {
        int maxLength = 0;
        int left = 0, right = 0;

        HashMap<Character, Integer> map = new HashMap<>();
        while (right < s.length()) {
            char ch = s.charAt(right);
            if (map.containsKey(ch) && map.get(ch) >= left) {
                left = map.get(ch) + 1;
            }
            map.put(ch, right);
            maxLength = Math.max(maxLength, right - left + 1);
            right++;
        }
        
        System.out.print("\nLongest Substring With No Duplicate Characters: " + maxLength);
    } 
} 