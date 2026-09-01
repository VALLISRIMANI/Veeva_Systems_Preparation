/*
Given a string find the unique letters in the string.
Example 1: abc
Output: 
3
a
b
c

Example 2: AaBbCc
Output:
6
A
a
B
b
C
c
*/

import java.util.*;

public class UniqueLettersInAString {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter a string: ");
        String input = sc.nextLine();

        Set<Character> uniqueLetters = new HashSet<>();
        for (char c : input.toCharArray()) {
            if (Character.isLetter(c)) {
                uniqueLetters.add(c);
            }
        }

        System.out.println(uniqueLetters.size());
        for (char c : uniqueLetters) {
            System.out.println(c);
        }
        System.out.println("\n");
        sc.close();
    }
}