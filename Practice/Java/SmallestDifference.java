/*
Coding Problems asked previously 

1. In a List or Array of Numbers,To find which number in a list is closest to a target, find the one with the smallest absolute difference.
Test cases
Test case1
Input:
N=6
[9, 11, 5, 3, 25, 18], 
K = 6
Output : 5

Test case2
Input:
N=4
 [2, 5, 10, 15],
K=  10. 
Output: 10

Test case3
N=4
 [2, 5, 10, 15], 
K= 8. 
Outpur: 10
 
Test case4
Input
N=4
 Array [-15, -10, -5], 
K= -12. 
Output: -10

Test case5
Input
N=1
[5]
K=3
Output: 5

Test case6
Input
N=2
 [10, 20], 
K=T
 15
Output : 20 

Test case 7
Input
N=3
  [1, 5, 9], 
K=25. 
Output: 9

Test case 8
Input
N=3
 [10, 15, 20], 
K=2. 
Output
 10
*/

package Practice.Java;
import java.util.*;

public class SmallestDifference {
    public static void main(String[] args) {
      Scanner sc = new Scanner(System.in);
      System.out.print("N: ");
      int N = sc.nextInt();

      System.out.print("Elements: ");
      int[] a = new int[N];

      for (int i = 0; i < N; i++) {
        a[i] = sc.nextInt();
      }

      System.out.print("K: ");
      int K = sc.nextInt();
      
      int diff = Integer.MAX_VALUE;
      int idx = -1;

      for (int i = 0; i < N; i++) {
        int currentDiff = Math.abs(a[i] - K);

        if (currentDiff < diff || (currentDiff == diff && a[i] > a[idx])) {
          diff = currentDiff;
          idx = i;
        }
      }

      System.out.print("Result: " + a[idx]);
      sc.close();
    }
}