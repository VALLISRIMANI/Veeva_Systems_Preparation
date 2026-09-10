/* 
Convert Sorted List to Binary Search Tree
Given the head of a singly linked list where elements are sorted in ascending order, convert it to a height-balanced binary search tree.


Example 1:
Input: head = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: One possible answer is [0,-3,9,-10,null,5], which represents the shown height balanced BST.

Example 2:
Input: head = []
Output: []
 

Constraints:

The number of nodes in head is in the range [0, 2 * 10^4].
-10^5 <= Node.val <= 10^5
*/

import java.util.Scanner;

class ListNode {
    int val;
    ListNode next;

    ListNode() {
    }

    ListNode(int val) {
        this.val = val;
    }

    ListNode(int val, ListNode next) {
        this.val = val;
        this.next = next;
    }
}

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode() {
    }

    TreeNode(int val) {
        this.val = val;
    }

    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

public class SingleLinkedListToBinarySearchTree {
    ListNode head;

    // Count the number of nodes in the linked list
    int countNodes(ListNode node) {
        int count = 0;

        while (node != null) {
            count++;
            node = node.next;
        }

        return count;
    }

    // Convert sorted linked list to height-balanced BST
    TreeNode sortedListToBSTUtil(int n) {
        if (n <= 0) {
            return null;
        }

        // Build left subtree
        TreeNode left = sortedListToBSTUtil(n / 2);

        // Current head becomes root
        TreeNode root = new TreeNode(head.val);

        root.left = left;

        // Move linked-list head forward
        head = head.next;

        // Build right subtree
        root.right = sortedListToBSTUtil(n - n / 2 - 1);

        return root;
    }

    public TreeNode sortedListToBST(ListNode node) {
        head = node;

        int n = countNodes(node);

        return sortedListToBSTUtil(n);
    }

    // Display BST using inorder traversal
    void inorder(TreeNode root) {
        if (root == null) {
            return;
        }

        inorder(root.left);
        System.out.print(root.val + " ");
        inorder(root.right);
    }

    // Display BST in preorder traversal
    void preorder(TreeNode root) {
        if (root == null) {
            return;
        }

        System.out.print(root.val + " ");
        preorder(root.left);
        preorder(root.right);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // Take number of nodes
        System.out.print("\nEnter number of elements: ");
        int n = sc.nextInt();

        ListNode head = null;
        ListNode tail = null;

        // Build sorted linked list
        System.out.print("Enter " + n + " elements in sorted order: ");
        for (int i = 0; i < n; i++) {
            int value = sc.nextInt();
            ListNode newNode = new ListNode(value);

            if (head == null) {
                head = newNode;
                tail = newNode;
            } else {
                tail.next = newNode;
                tail = newNode;
            }
        }

        // Create object
        SingleLinkedListToBinarySearchTree obj = new SingleLinkedListToBinarySearchTree();

        // Convert linked list to BST
        TreeNode root = obj.sortedListToBST(head);

        // Display results
        System.out.println("\nInorder traversal of BST:");
        obj.inorder(root);

        System.out.println("\n\nPreorder traversal of BST:");
        obj.preorder(root);

        System.out.println("\n");

        sc.close();
    }
}