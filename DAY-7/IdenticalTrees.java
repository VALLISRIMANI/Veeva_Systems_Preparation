/*
Same Tree

Given the roots of two binary trees p and q, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

Example 1:
Input: p = [1,2,3], q = [1,2,3]
Output: true

Example 2:
Input: p = [1,2], q = [1,null,2]
Output: false

Example 3:
Input: p = [1,2,1], q = [1,1,2]
Output: false
 
Constraints:

The number of nodes in both trees is in the range [0, 100].
-104 <= Node.val <= 104
*/

import java.util.*;

public class IdenticalTrees {
    static class Node {
        int data;
        Node left, right;
        
        Node (int data) {
            this.data = data;
            this.left = this.right = null;
        }
    }

    static Node root1 = null;
    static Node root2 = null;

    static Node insert (Node root, int x) {
        if (root == null) {
            return new Node(x);
        }

        if (x < root.data) {
            root.left = insert(root.left, x);
        } else if (x > root.data) {
            root.right = insert(root.right, x);
        } else {
            System.out.println("Duplicates are not allowed.");
        }

        return root;
    }

    static void inorder (Node root) {
        if (root != null) {
            inorder(root.left);
            System.out.print(root.data + " ");
            inorder(root.right);
        }
    }

    static boolean identicalTreesOrNot(Node root1, Node root2) {
        if (root1 == null && root2 == null) {
            return true;
        }

        if (root1 == null || root2 == null) {
            return false;
        }

        if (root1.data != root2.data) {
            return false;
        }

        return identicalTreesOrNot(root1.left, root2.left) && identicalTreesOrNot(root1.right, root2.right);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the number of nodes to be inserted in the First BST: ");
        int n = sc.nextInt();
        for (int i = 0; i < n; i++) {
            System.out.print("Enter the data for node " + (i + 1) + ": ");
            int x = sc.nextInt();
            root1 = insert(root1, x);
        }

        System.out.print("\nEnter the number of nodes to be inserted in the First BST: ");
        int m = sc.nextInt();
        for (int i = 0; i < m; i++) {
            System.out.print("Enter the data for node " + (i + 1) + ": ");
            int x = sc.nextInt();
            root2 = insert(root2, x);
        }

        System.out.print("\nInorder Traversal Of Root 1: ");
        inorder(root1);
        System.out.print("\nInorder Traversal Of Root 2: ");
        inorder(root2);
        System.out.print("\nAre both trees identical: " + identicalTreesOrNot(root1, root2));
        System.out.println("\n");
        sc.close();
    }
}
