/*
Given a standard server log string. Extract only date & time from the log string.

Example 1: "[2023-06-05 10:15:30] INFO: User logged in"
Output: 2023-06-05 10:15:30

Example 2: "[2023-06-05 10:15:30] ERROR: Database connection failed"
Output: 2023-06-05 10:15:30
*/

import java.util.Scanner;

public class ExtractingDateAndTimeFromServerLog {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the string: ");
        String str = sc.nextLine();
        
        String dateTime = extractDateTime(str);
        if (dateTime != null) {
            System.out.println("Extracted Date & Time: " + dateTime + "\n");
        } else {
            System.out.println("No date & time found in the string.\n");
        }

        sc.close();
    }

    public static String extractDateTime(String str) {
        int startIndex = str.indexOf('[');
        int endIndex = str.indexOf(']');
        
        if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
            return str.substring(startIndex + 1, endIndex);
        }
        
        return null;
    }
}