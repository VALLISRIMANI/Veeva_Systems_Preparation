/*
Finding the sum of numeric characters in an alphanumeric string  (e.g., extracting numbers to add them).

Test case 1:
Input:
abc123xyz
Output
123

Test case2
Input
10a20b30
Output
60

Test case3
Input
geeks4geeks
Output
4

Test case4
Input
"9"
Output
9

Test case5
Input
abcDEFghj
Output
0


Test case6
Input
12345
Output
12345

Testcase7
Input
000abc000
Output
0

Test case 8
Input
00abc12ghj
Output
12

Testcase9
Input
5 5 5
Output
15
*/

package Practice.Java;
import java.io.*;

public class AdditionOfNumbersInAString {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("\nEnter alphanumeric string: ");
        String str = br.readLine().trim();

        int sum = 0;

        while (!str.isEmpty()) {
            int i = 0;
            while (i < str.length() && !Character.isDigit(str.charAt(i))) {
                i++;
            }

            if (i == str.length()) break;

            int j = i;
            while (j < str.length() && Character.isDigit(str.charAt(j))) {
                j++;
            }

            sum += Integer.parseInt(str.substring(i, j));
            str = str.substring(j);
        }

        System.out.println("Sum of numbers in the string: " + sum + "\n");
        br.close();
    }
}
