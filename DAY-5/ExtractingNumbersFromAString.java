/*
Given a string that consists of names, cities, numbers separated by commas. Now find count of numbers given in the string.

Example 1: "John,Doe,34,Newyork,Wright,38,Wellington,45,Smith,50, Paris, London, 60"
Output: 5

Example 2: "John,Doe,Newyork,Wright,Wellington,Smith"
Output: 0
*/

import java.util.*;

public class ExtractingNumbersFromAString {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the string: ");
        String str = sc.nextLine();
        int numbers = countNumbers(str).size();
        System.out.println("Count of numbers in the string: " + numbers);
        System.out.println("Numbers in the string: " + countNumbers(str) + "\n");
        sc.close();
    }

    public static List<Integer> countNumbers(String str) {
        String[] parts = str.split(",");
        List<Integer> result = new ArrayList<>();

        for (String part : parts) {
            part = part.trim();

            if (part.matches("\\d+")) {
                result.add(Integer.parseInt(part));
            }
        }

        return result;
    }
}