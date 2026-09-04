/*
You are given the root of a binary tree, and your task is to return its top view. The top view of a binary tree is the set of nodes visible when the tree is viewed from the top.

Note:

Return the nodes from the leftmost node to the rightmost node.
If multiple nodes overlap at the same horizontal position, only the topmost (closest to the root) node is included in the view. 
Examples:

Input: root = [1, 2, 3]
Output: [2, 1, 3]
Explanation: The Green colored nodes represents the top view in the below Binary tree.
 
Input: root = [10, 20, 30, 40, 60, 90, 100]
Output: [40, 20, 10, 30, 100]
Explanation: The Green colored nodes represents the top view in the below Binary tree.


Constraints:
1 ≤ number of nodes ≤ 105
1 ≤ node->data ≤ 105

*/

import java.util.*;

public class TopViewOfBinarySearchTree {
    static class Node {
        int data;
        Node left, right;

        Node(int val) {
            this.data = val;
            this.left = null;
            this.right = null;
        }
    }

    static class Pair {
        Node node;
        int hd;
        Pair(Node n, int h) {
            node = n;
            hd = h;
        }
    }

    static Node buildTree(int[] values) {
        if (values.length == 0) return null;

        Node root = new Node(values[0]);
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);

        int i = 1;
        while (i < values.length) {
            Node current = queue.poll();

            if (values[i] != -1) {
                current.left = new Node(values[i]);
                queue.add(current.left);
            }
            i++;

            if (i < values.length && values[i] != -1) {
                current.right = new Node(values[i]);
                queue.add(current.right);
            }
            i++;
        }

        return root;
    }
    
    public ArrayList<Integer> topView(Node root) {
        ArrayList<Integer> result = new ArrayList<>();
        if (root == null) return result;
    
        Map<Integer, Integer> map = new TreeMap<>();
        Queue<Pair> queue = new LinkedList<>();
    
        queue.add(new Pair(root, 0));
    
        while (!queue.isEmpty()) {
            Pair current = queue.poll();
            Node curr = current.node;
            int hd = current.hd;
    
            if (!map.containsKey(hd)) {
                map.put(hd, curr.data);
            }
    
            if (curr.left != null) queue.add(new Pair(curr.left, hd - 1));
            if (curr.right != null) queue.add(new Pair(curr.right, hd + 1));
        }
    
        result.addAll(map.values());
        return result;
    }

    public static void main(String[] args) {
        TopViewOfBinarySearchTree tree = new TopViewOfBinarySearchTree();
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the number of nodes in the binary tree: ");
        int n = sc.nextInt();
        
        int[] values = new int[n];
        System.out.println("Enter the values of the nodes (use -1 for null nodes): ");
        for (int i = 0; i < n; i++) {
            values[i] = sc.nextInt();
        }

        Node root = buildTree(values);

        ArrayList<Integer> topViewNodes = tree.topView(root);
        System.out.println(topViewNodes); 
        sc.close();
    }
}