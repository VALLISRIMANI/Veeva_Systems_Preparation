/* 
If we are given an array of integers, can you return an output array such that each corresponding input's elements returns the product of the input array except itself?

Description
This can be hard to explain, so let's take an array: [1, 2, 4, 16]

What we want to return is [128, 64, 32, 8]. This is because 2 x 4 x 16 = 128, 1 x 4 x 16 = 64, 1 x 2 x 16 = 32, and 1 x 2 x 4 = 8. At each index, we ignore the number at that index and multiply the rest.

In other words, output[i] is equal to the product of all the elements in the array other than input[i].

Can you solve this in O(n) time without division?

Constraints
Length of the array will be <= 100000
The array can be empty
The array will only contain non zero positive values
The answer for each index will fit in the integer range
Expected time complexity : O(n)
Expected space complexity : O(n)
*/

import java.util.*;

public class ProductExceptItself {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter number of elements: ");
        int n = sc.nextInt();

        int[] arr = new int[n];
        System.out.print("Enter array elements: ");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        ProductExceptItselfWithDivision(arr, n);
        ProductExceptItselfWithoutDivision(arr, n);
        
        sc.close();
    }   
    
    public static void ProductExceptItselfWithDivision(int[] arr, int n) {
        int product = 1;
        for (int i = 0; i < n; i++) {
            product *= arr[i];
        }

        int[] result = new int[n];
        for (int i = 0; i < n; i++) {
            result[i] = product / arr[i];
        }

        System.out.println("Product Except Itself Of Array " + Arrays.toString(arr) + " Is " + Arrays.toString(result));
    }

    public static void ProductExceptItselfWithoutDivision(int[] arr, int n) {
        int[] result = new int[n];
        int leftProduct = 1;

        for (int i = 0; i < n; i++) {
            result[i] = leftProduct;
            leftProduct *= arr[i];
        }

        int rightProduct = 1;
        
        for (int i = n - 1; i >= 0; i--) {
            result[i] *= rightProduct;
            rightProduct *= arr[i];
        }

        System.out.println("Product Except Itself Of Array " + Arrays.toString(arr) + " Is " + Arrays.toString(result));
    }
}
