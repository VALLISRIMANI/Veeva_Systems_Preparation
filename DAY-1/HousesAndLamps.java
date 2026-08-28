/*
On a given street, there are n houses and m lamps. The positions of the houses and lamps are given as two integer arrays houses and lamps respectively. Each lamp can illuminate a certain radius around it. The goal is to find the minimum radius required for the lamps to illuminate all the houses on the street.
*/

import java.util.*;

public class HousesAndLamps {
    public static int minimumRadius(int[] houses, int[] lamps) {
        Arrays.sort(houses);
        Arrays.sort(lamps);

        int j = 0, result = 0;
        for (int house : houses) {
            while (j < lamps.length - 1 && Math.abs(house - lamps[j]) >= Math.abs(house - lamps[j + 1])) {
                j++;
            }

            result = Math.max(result, Math.abs(house - lamps[j]));
        }

        return result;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("\nEnter number of houses: ");
        int n = sc.nextInt();
        int[] houses = new int[n];
        System.out.print("Enter positions of houses: ");
        for (int i = 0; i < n; i++) {
            houses[i] = sc.nextInt();
        }

        System.out.print("\nEnter number of lamps: ");
        int m = sc.nextInt();
        int[] lamps = new int[m];
        System.out.print("Enter positions of lamps: ");
        for (int i = 0; i < m; i++) {
            lamps[i] = sc.nextInt();
        }

        System.out.println("\nMinimum radius required: " + minimumRadius(houses, lamps) + "\n");
        sc.close();
    }
}