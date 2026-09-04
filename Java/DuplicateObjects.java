/*
Get list of Duplicate Objects in an Array of Objects

Let's assume we have an array of objects where each object has a set of key-value pairs. Our goal is to find all duplicate objects based on a specific key or a combination of keys. 

Example
const users = [
    { id: 1, name: 'Amit Kumar', email: 'amit@example.com' },
    { id: 2, name: 'Sumit Kumar', email: 'sumit@example.com' },
    { id: 3, name: 'Amit Kumar', email: 'amit@example.com' },
    { id: 4, name: 'Raj Kumar', email: 'raj@example.com' },
    { id: 5, name: 'Amit Kumar', email: 'amit@example.com' }
];
In the above array, the objects with id 1, 3, and 5 are duplicates based on the name and email properties.
*/

package Practice.Java;
import java.util.*;

public class DuplicateObjects {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("\nEnter the number of objects: ");
        int n = sc.nextInt();

        System.out.print("\nEnter the objects (id, name, email) separated by space:\n");
        List<Map<String, String>> objects = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            int id = sc.nextInt();
            String name = sc.next();
            String email = sc.next();
            Map<String, String> obj = new HashMap<>();
            obj.put("id", String.valueOf(id));
            obj.put("name", name);
            obj.put("email", email);
            objects.add(obj);
        }

        Map<String, List<Map<String, String>>> duplicatesMap = new HashMap<>();
        for (Map<String, String> obj : objects) {
            String key = obj.get("name") + "|" + obj.get("email");
            duplicatesMap.putIfAbsent(key, new ArrayList<>());
            duplicatesMap.get(key).add(obj);
        }

        List<List<Map<String, String>>> duplicates = new ArrayList<>();
        for (List<Map<String, String>> group : duplicatesMap.values()) {
            if (group.size() > 1) {
                duplicates.add(group);
            }
        }

        System.out.println("\nDuplicate Objects:");
        for (List<Map<String, String>> group : duplicates) {
            System.out.println(group);
        }
        System.out.println("\n");
        sc.close();
    }
}