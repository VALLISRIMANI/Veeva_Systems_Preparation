/* 
We're provided a positive integer num. Can you write a method to repeatedly add all of its digits until the result has only one digit?

Here's an example: if the input was 49, we'd go through the following steps:

SNIPPET
// start with 49
4 + 9 = 13

// since the previous addition was 13,
// move onto summing 13's digits
1 + 3 = 4
We would then return 4.

Constraints
Input will be in the range between 0 and 1000000000
Expected time complexity : O(log n)
Expected space complexity : O(1)
*/

import java.util.*;

public class SumDigitsUntilOne {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter number: ");
        int num = sc.nextInt();

        int sum = 0;
        while (num > 0 || sum > 9) {
            if (num == 0) {
                num = sum;
                sum = 0;
            }

            sum += num % 10;
            num /= 10;
        }

        System.out.println("Result: " + sum + "\n");
        sc.close();
    }
}