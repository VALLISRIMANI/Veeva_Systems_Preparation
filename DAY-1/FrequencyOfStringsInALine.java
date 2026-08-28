/*
You are given a line of text. Your task is to find the frequency of each string in the line.

Example 1:
Input: "hello world hello"
Output:
hello: 2
world: 1

Example 2:
Input: "java is fun java is powerful"
Output:
java: 2
is: 2
fun: 1
powerful: 1
*/

import java.util.*;

public class FrequencyOfStringsInALine {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter a line of text: ");
        String line = sc.nextLine();
        String[] words = line.split("\\s+");

        Map<String, Integer> freq = new HashMap<>();
        for (String word : words) {
            freq.put(word, freq.getOrDefault(word, 0) + 1);
        }

        for (Map.Entry<String, Integer> entry : freq.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }

        System.out.println("\n");
        sc.close();
    }
}