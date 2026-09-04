/*
find out minimum loss which can occur with given the price of sales in each day. We can buy and sell only once.
Example Input - N=5,[6,8,10,4,9] Output = 1
N=4,[8,9,3,5] Output = 3
Where N=number of days
*/

package Practice.Java;

import java.util.*;

public class BuyAndSellStock {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of days: ");
        int n = sc.nextInt();

        int[] prices = new int[n];

        System.out.print("Enter prices: ");
        for (int i = 0; i < n; i++) {
            prices[i] = sc.nextInt();
        }

        int maxPrice = prices[0];
        int minLoss = Integer.MAX_VALUE;

        for (int i = 1; i < n; i++) {

            if (prices[i] < maxPrice) {
                int loss = maxPrice - prices[i];
                minLoss = Math.min(minLoss, loss);
            }

            if (prices[i] > maxPrice) {
                maxPrice = prices[i];
            }
        }

        if (minLoss == Integer.MAX_VALUE)
            System.out.println("Minimum Loss = 0");
        else
            System.out.println("Minimum Loss = " + minLoss);

        sc.close();
    }
}