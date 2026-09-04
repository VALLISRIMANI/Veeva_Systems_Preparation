/*
Given a string s in camel case, return the number of words in s.

Example 1: "oneTwoThree"
Output: 3

Example 2: "thisIsCamelCase"
Output: 4
*/

import java.util.*;

public class NumberOfWordsUsingCamelCaseDelimiter {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter a camel case string: ");
        String input = sc.nextLine();

        int wordCount = 1;
        for (char c : input.toCharArray()) {
            if (Character.isUpperCase(c)) {
                wordCount++;
            }
        }

        System.out.println("1. Number of words in the camel case string: " + wordCount + "\n");

        String[] words = input.split("(?=[A-Z])");
        System.out.println("2. Number of words in the camel case string: " + words.length + "\n");
        System.out.println("2. Words in the camel case string: " + Arrays.toString(words) + "\n");
        sc.close();
    }
}