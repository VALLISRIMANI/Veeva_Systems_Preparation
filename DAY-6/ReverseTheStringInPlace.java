/* 
Given a string, write a function to reverse it in place.

Example 1: "hello"
Output: "olleh"

Example 2: "world"
Output: "dlrow"
*/

import java.util.*;

public class ReverseTheStringInPlace {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter a string to reverse: ");
        String input = sc.nextLine();

        char[] charArray = input.toCharArray();

        int left = 0, right = charArray.length - 1;

        while (left < right) {
            char temp = charArray[left];
            charArray[left] = charArray[right];
            charArray[right] = temp;
            left++;
            right--;
        }

        String reversedString = new String(charArray);
        System.out.println("Reversed string: " + reversedString + "\n");


        StringBuilder sb = new StringBuilder(reversedString);
        // System.out.println("Reversed string using StringBuilder: " + sb.reverse().toString() + "\n");
        int start = 0, end = sb.length() - 1;
        while (start < end) {
            char temp = sb.charAt(start);
            sb.setCharAt(start, sb.charAt(end));
            sb.setCharAt(end, temp);
            start++;
            end--;
        }
        System.out.println("Reversed string using StringBuilder in place: " + sb.toString() + "\n");
        sc.close();
    }
}
