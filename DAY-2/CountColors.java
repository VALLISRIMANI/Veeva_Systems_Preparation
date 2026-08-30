/*

Count colors from a comma-seperated input string. Ignore spaces before & after color name. Handle mixed casing uniformly. In input, if there are numerical values or symbols ignore them. 

Examples:
1. Input: red,blue,green,blue,yellow,red,green,red | Output: red-3 blue-2 green-2 yellow-1 Total Colors = 8

2. Input: red   ,  blue,  green  ,  yellow | Output: red-1 blue-1 green-1 yellow-1 Total Colors = 4

3. Input: red, blue123, #red, #green1 | Output: red-2 blue-1 green-1 Total Colors = 4
*/

import java.util.*;

public class CountColors {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter string: ");
        String str = sc.nextLine();

        String[] colors = str.split(",");

        HashMap<String, Integer> freqMap = new HashMap<>();
        for (String color : colors) {
            String normalized = color.trim().toLowerCase().replaceAll("[^a-z]", "");

            if (normalized.isEmpty()) {
                continue;
            }

            freqMap.put(normalized, freqMap.getOrDefault(normalized, 0) + 1);
        }

        int count = 0;

        System.out.println("\n--- Colors and their frequencies ---\n");
        for (Map.Entry<String, Integer> entry : freqMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
            count += entry.getValue();
        }

        System.out.println("\nTotal Colors: " + count + "\n");
        sc.close();
    }
}
