/*
Given an HTML Tag represents raw text. Now remove all the tags & extract only plain text as output. 
Example 1: "<div><b>Hello</b><i>World<i></div>"
Output: "HelloWorld"
Example 2: "<div><b>Hello</b><i>World!<i></div><p> How are you?</p>"
Output: "HelloWorld! How are you?"
*/

import java.util.*;

public class HtmlTagToPlainText {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter HTML content: ");
        String str = sc.nextLine();
        System.out.println("\nPlain text: " + plainTextExtractionUsingStack(str) + "\n");
        System.out.println("\nPlain text: " + plainTextExtractionUsingStringBuilder(str) + "\n");
        sc.close();
    }

    public static String plainTextExtractionUsingStack(String str) {
        Stack<Character> stack = new Stack<>();
        StringBuilder plainText = new StringBuilder();

        for (int i = 0; i < str.length(); i++) {
            char ch = str.charAt(i);

            if (ch == '<') {
                stack.push(ch);
            } else if (ch == '>') {
                while (!stack.isEmpty() && stack.peek() != '<') {
                    stack.pop();
                }

                if (!stack.isEmpty() && stack.peek() == '<') {
                    stack.pop();
                }

            } else {
                if (stack.isEmpty()) {
                    plainText.append(ch);
                }
            }
        }

        return plainText.toString();
    }

    public static String plainTextExtractionUsingStringBuilder(String str) {
        StringBuilder plainText = new StringBuilder();
        boolean insideTag = false;

        for (char ch : str.toCharArray()) {
            if (ch == '<') {
                insideTag = true;
            } else if (ch == '>') {
                insideTag = false;
            } else if (!insideTag) {
                plainText.append(ch);
            }
        }

        return plainText.toString();
    }
}