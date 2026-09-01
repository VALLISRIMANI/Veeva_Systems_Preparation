/*
Infix Expression Evaluator

Given a string representing a mathematical infix expression, compute and return the value of the expression.

The expression may contain:

Integers
Operators: +, -, *, /
Parentheses: ( and )
Spaces may be present

The standard operator precedence rules should be followed:

Parentheses ()
Multiplication and division *, /
Addition and subtraction +, -

Examples

Example 1
Input:  3+(4*5)-2
Output: 21

Example 2
Input:  3+4
Output: 7

Example 3
Input:  ((5+3)*2)-(10/2)
Output: 11

Write a Java program to evaluate the given infix expression and print its result.
*/

import java.util.*;

public class InfixExpressionEvaluator {
    static int precedence(char op) {
        if (op == '+' || op == '-') {
            return 1;
        }
        if (op == '*' || op == '/') {
            return 2;
        }
        return 0;
    }

    static int applyOperation(int a, int b, char op) {
        switch (op) {
            case '+':
                return a + b;
            case '-':
                return a - b;
            case '*':
                return a * b;
            case '/':
                return a / b;
            default:
                throw new IllegalArgumentException("Invalid operator");
        }
    }

    static int evaluate(String expression) {
        Stack<Integer> values = new Stack<>();
        Stack<Character> operators = new Stack<>();

        for (int i = 0; i < expression.length(); i++) {
            char ch = expression.charAt(i);

            if (ch == ' ') {
                continue;
            }

            if (Character.isDigit(ch)) {
                int number = 0;

                while (i < expression.length() && Character.isDigit(expression.charAt(i))) {
                    number = number * 10 + (expression.charAt(i) - '0');
                    i++;
                }

                values.push(number);
                i--;
            }

            else if (ch == '(') {
                operators.push(ch);
            }

            else if (ch == ')') {
                while (!operators.isEmpty() && operators.peek() != '(') {
                    int b = values.pop();
                    int a = values.pop();
                    char op = operators.pop();

                    values.push(applyOperation(a, b, op));
                }

                operators.pop();
            }

            else if (ch == '+' || ch == '-' || ch == '*' || ch == '/') {
                while (!operators.isEmpty() && operators.peek() != '(' && precedence(operators.peek()) >= precedence(ch)) {
                    int b = values.pop();
                    int a = values.pop();
                    char op = operators.pop();

                    values.push(applyOperation(a, b, op));
                }

                operators.push(ch);
            }
        }

        while (!operators.isEmpty()) {
            int b = values.pop();
            int a = values.pop();
            char op = operators.pop();

            values.push(applyOperation(a, b, op));
        }

        return values.pop();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter infix expression: ");

        String expression = sc.nextLine();
        int result = evaluate(expression);
        System.out.println("Result: " + result + "\n");
        sc.close();
    }
}