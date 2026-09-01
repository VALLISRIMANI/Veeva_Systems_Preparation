/*
Given an input string containing IDs and names of different products in the following format:

ID:101,Name:Trial-A,ID:102,Name:Trial-B

Extract each parameter and its corresponding value, and print them as separate records.

Expected Output
[ID: 101, Name: Trial-A]
[ID: 102, Name: Trial-B]

Or, if only the values are required:

[101, Trial-A]
[102, Trial-B]
*/

import java.util.Scanner;

public class ProductParameterExtractor { 
    public static void main(String[] args) { 
        Scanner sc = new Scanner(System.in); 
        System.out.print("\nEnter string: "); 
        String input = sc.nextLine(); 
        
        String[] product = input.split(","); 
        
        for (int i = 0; i < product.length; i += 2) {
            String[] id = product[i].split(":", 2); 
            String[] name = product[i + 1].split(":", 2); 
            
            System.out.println( "[" + id[0] + ": " + id[1] + ", " + name[0] + ": " + name[1] + "]" ); 
        } 
        
        System.out.println();
        sc.close(); 
    } 
}