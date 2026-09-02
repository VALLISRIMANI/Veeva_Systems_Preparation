/*
Given a string that consists of name, role, status of different employees. Now from the string separate user, role, status as key value pairs. 

Example 1: "Alex is an admin is actively working John is an operator but not active suspended" 
Output: ["user": Alex, "role": admin, "status": active] ["user": john, "role": operator, "status": not active]

Example 2 : "Sarah is a manager is actively working Mike is a developer but not active"
Output: ["user": Sarah, "role": manager, "status": active] ["user": Mike, "role": developer, "status": not active]
*/

import java.util.*;

public class ExtractEmployeeDetails {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the string: ");
        String str = sc.nextLine();

        List<Map<String, String>> employeeDetails = extractEmployeeDetails(str);
        System.out.println("Extracted Employee Details: " + employeeDetails + "\n");
        sc.close();
    }

    public static List<Map<String, String>> extractEmployeeDetails(String str) {
        String[] parts = str.split("(?<=\\bworking\\b)|(?<=\\bsuspended\\b)");
        List<Map<String, String>> result = new ArrayList<>();

        for (String part : parts) {
            part = part.trim();
            if (!part.isEmpty()) {
                Map<String, String> employeeMap = new HashMap<>();
                String[] words = part.split("\\s+");
                employeeMap.put("user", words[0]);
                employeeMap.put("role", words[3]);
                employeeMap.put("status", words[5].equals("actively") ? "active" : "not active");
                result.add(employeeMap);
            }
        }

        return result;
    }
}