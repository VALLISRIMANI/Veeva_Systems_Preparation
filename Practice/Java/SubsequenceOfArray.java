/*
2. Determine if one array (sequence) is a subsequence of another array (array).
A subsequence means the elements of sequence must appear in the same order as in array, but not necessarily consecutively.

Test cases
Input:
array:
[5, 1, 22, 25, 6, -1, 8, 10]
sequence: [1, 6, -1, 10]
Output:
true
Explanation: The numbers 1 → 6 → -1 → 10 appear in order in the array.

Input:
array: 
[5, 1, 22, 25, 6, -1, 8, 10]
sequence: [1, 6, 10, -1]
Output:
false

Explanation: The number -1 comes after 10 in the sequence, but 10 comes after -1 in the array.
*/

package Practice.Java;
import java.util.*;

public class SubsequenceOfArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("N: ");
        int N = sc.nextInt();

        System.out.print("N Elements: ");
        int[] a = new int[N];

        for (int i = 0; i < N; i++) {
            a[i] = sc.nextInt();
        }

        System.out.print("M: ");
        int M = sc.nextInt();

        System.out.print("M Elements: ");
        int[] b = new int[M];

        for (int i = 0; i < M; i++) {
            b[i] = sc.nextInt();
        }

        boolean isSubsequence = true;
        int start = 0;

        for (int idx = 0; idx < M; idx++) {
            boolean found = false;

            for (int i = start; i < N; i++) {
                if (a[i] == b[idx]) {
                    found = true;
                    start = i + 1;
                    break;
                }
            }

            if (!found) {
                isSubsequence = false;
                break;
            }
        }

        System.out.println(isSubsequence);

        sc.close();
    }
}
