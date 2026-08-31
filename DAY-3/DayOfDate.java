/*
Given that January 1st of a common year falls on a Monday, compute what day of the week September 14th will fall on.

Example 1:
Input: Jan 1 = Monday, Sep 14 = ?
Output: Friday

Example 2:
Input: Jan 1 = Monday, March 1 = ?
Output: Thursday
*/

public class DayOfDate {
    public static void main(String[] args) {
         String[] days = {
            "Monday", "Tuesday", "Wednesday", "Thursday",
            "Friday", "Saturday", "Sunday"
        };

        int daysBeforeSeptember = 31 + 28 + 31 + 30 + 31 + 30 + 31;

        int totalDays = daysBeforeSeptember + 13;

        int dayIndex = totalDays % 7;

        System.out.println("September 14 = " + days[dayIndex]);
    }
}