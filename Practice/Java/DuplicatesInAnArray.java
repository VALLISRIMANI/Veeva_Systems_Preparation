/*
Duplicates in a Limited Range and Limited Repetition Array

Given an array arr[] of integers of size n, where each element is in the range 1 to n and each element can occur at most twice, find all elements that appear twice in the array.

Examples: 

Input: arr[] = [2, 3, 1, 2, 3]
Output: [2, 3] 
Explanation: 2 and 3 occur twice in the given array.

Input: arr[] = [3, 1, 2] 
Output: [] 
Explanation: There is no repeating element in the array, so the output is empty. 
*/

package Practice.Java;
import java.util.*;

public class DuplicatesInAnArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the number of elements in the array: ");
        int n = sc.nextInt();

        System.out.print("Enter array elements: ");
        int[] arr = new int[n];

        HashMap<Integer, Integer> map = new HashMap<>();

        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
            map.put(arr[i], map.getOrDefault(arr[i], 0) + 1);
        }

        System.out.print("Duplicate elements: ");

        Set<Integer> duplicates = new HashSet<>();
        for (int i = 0; i <n; i++) {
            if (map.get(arr[i]) == 2 && !duplicates.contains(arr[i])) {
                System.out.print(arr[i] +" ");
                duplicates.add(arr[i]);
            }
        }

        sc.close();
    }
}
