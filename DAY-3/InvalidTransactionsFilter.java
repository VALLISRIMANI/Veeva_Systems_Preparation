/*
Invalid Transactions

A transaction is possibly invalid if:
    the amount exceeds $1000, or;
    if it occurs within (and including) 60 minutes of another transaction with the same name in a different city.
You are given an array of strings transaction where transactions[i] consists of comma-separated values representing the name, time (in minutes), amount, and city of the transaction. Return a list of transactions that are possibly invalid. You may return the answer in any order.

 
Example 1:

Input: transactions = ["alice,20,800,mtv","alice,50,100,beijing"]
Output: ["alice,20,800,mtv","alice,50,100,beijing"]
Explanation: The first transaction is invalid because the second transaction occurs within a difference of 60 minutes, have the same name and is in a different city. Similarly the second one is invalid too.

Example 2:

Input: transactions = ["alice,20,800,mtv","alice,50,1200,mtv"]
Output: ["alice,50,1200,mtv"]
Example 3:

Input: transactions = ["alice,20,800,mtv","bob,50,1200,mtv"]
Output: ["bob,50,1200,mtv"]
 

Constraints:

transactions.length <= 1000
Each transactions[i] takes the form "{name},{time},{amount},{city}"
Each {name} and {city} consist of lowercase English letters, and have lengths between 1 and 10.
Each {time} consist of digits, and represent an integer between 0 and 1000.
Each {amount} consist of digits, and represent an integer between 0 and 2000.

*/

import java.util.*;

public class InvalidTransactionsFilter {
    class Transaction {
        String original;
        String name;
        int time;
        int amount;
        String city;

        Transaction(String transaction) {
            original = transaction;
            String[] details = transaction.split(",");
            name = details[0];
            time = Integer.parseInt(details[1]);
            amount = Integer.parseInt(details[2]);
            city = details[3];
        }
    }

    public List<String> invalidTransactions(String[] transactions) {
        int n = transactions.length;
        Transaction[] arr = new Transaction[n];
        boolean[] invalid = new boolean[n];

        for (int idx = 0; idx < n; idx++) {
            arr[idx] = new Transaction(transactions[idx]);

            if (arr[idx].amount > 1000) {
                invalid[idx] = true;
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (arr[i].name.equals(arr[j].name) && Math.abs(arr[i].time - arr[j].time) <= 60 && !arr[i].city.equals(arr[j].city)) {
                    invalid[i] = true;
                    invalid[j] = true;
                }
            }
        }

        List<String> result = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            if (invalid[i]) {
                result.add(arr[i].original);
            }
        }

        return result;
    }
    
    public static void main(String[] args) {
        InvalidTransactionsFilter filter = new InvalidTransactionsFilter();
        
        // Test Example 1: Same name, different city, within 60 minutes
        String[] test1 = {"alice,20,800,mtv","alice,50,100,beijing"};
        System.out.println("Test 1:");
        System.out.println("Input: " + Arrays.toString(test1));
        System.out.println("Output: " + filter.invalidTransactions(test1));
        System.out.println();
        
        // Test Example 2: Amount exceeds 1000
        String[] test2 = {"alice,20,800,mtv","alice,50,1200,mtv"};
        System.out.println("Test 2:");
        System.out.println("Input: " + Arrays.toString(test2));
        System.out.println("Output: " + filter.invalidTransactions(test2));
        System.out.println();
        
        // Test Example 3: Different names, one amount exceeds 1000
        String[] test3 = {"alice,20,800,mtv","bob,50,1200,mtv"};
        System.out.println("Test 3:");
        System.out.println("Input: " + Arrays.toString(test3));
        System.out.println("Output: " + filter.invalidTransactions(test3));
        System.out.println();
        
        // Test Example 4: No invalid transactions
        String[] test4 = {"alice,20,800,mtv","bob,50,1200,beijing"};
        System.out.println("Test 4:");
        System.out.println("Input: " + Arrays.toString(test4));
        System.out.println("Output: " + filter.invalidTransactions(test4));
    }
}