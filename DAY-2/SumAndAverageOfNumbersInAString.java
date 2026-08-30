/*
Given an input string. Extract all consecutive integers with sum & average.

Examples:

1. "abcd112kg45lly4p9" 
Output: Sum: 70, Average: 42.5

2. "10abc20def30"
Output: Sum: 60, Average: 20.0
*/

import java.util.ArrayList;
import java.util.Scanner;

public class SumAndAverageOfNumbersInAString {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter input string: ");
        String str = sc.next();

        ArrayList<Integer> nums = new ArrayList<>();
        int i = 0, len = str.length();

        while (i < len) {
            if (Character.isDigit(str.charAt(i))) {
                int start = i;

                while (i < len && Character.isDigit(str.charAt(i))) {
                    i++;
                }

                nums.add(Integer.parseInt(str.substring(start, i)));
            } else {
                i++;
            }

        }

        System.out.println("Extracted numbers: " + nums);
        
        int sum = 0;
        for (int num : nums) {
            sum += num;
        }

        double average = (double) sum / nums.size();

        System.out.println("Sum: " + sum + "\nAverage: " + average);
        sc.close();
    }
}