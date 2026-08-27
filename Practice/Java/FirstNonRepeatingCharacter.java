/*
Given a string s consisting of lowercase English letters, find the first non-repeating character in it and return its index. If it does not exist, return -1.

Example 1:
Input: s = "leetcode"
Output: 0

Example 2:
Input: s = "loveleetcode"   
Output: 2
*/

package Practice.Java;
import java.util.*;

public class FirstNonRepeatingCharacter  {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter String: ");
        String str = sc.next();

        HashMap<Character, Integer> freq = new HashMap<>();
        for (int i = 0; i < str.length(); i++) {
            char ch = str.charAt(i);
            freq.put(ch, freq.getOrDefault(ch, 0) + 1);
        }

        boolean found = false;

        for (int i = 0; i < str.length(); i++) {
            char ch = str.charAt(i);
            if (freq.get(ch) == 1) {
                System.out.println("Index: " + i);
                System.out.println("Character: " + ch);
                found = true;
                break;
            }
        }

        if (!found) {
            System.out.println(-1);
        }

        sc.close();
    }
}
