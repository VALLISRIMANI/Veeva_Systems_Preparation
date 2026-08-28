/*
Design & Implement an inventory system which stores list of products which are identified using "category" as key. With the same category there may be multiple products, with different product codes. Once we store a list of different products mapped to categories we have tor execute the following queries.

I. Given a category, extract all the products related to that category, Number of products in that category and Product with highest price in that category.
II. Extract & display all the products category wise. But in each category the products should be sorted on price in descending order.
III. Find a category that has product with highest price.

Example : 
        ["Cold Drinks": [
                            ["101", "CocoCola", 99], ["102", "ThumsUp", 89]
                        ]
        "Ice Creams": [
                            ["202", "Amul", 15], ["203", "Ibaco", 80]
                      ]
        ]
*/

import java.util.Map;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

class Product {
    private String productCode;
    private String productName;
    private int price;

    Product(String productCode, String productName, int price) {
        this.productCode = productCode;
        this.productName = productName;
        this.price = price;
    }

    public String getProductCode() {
        return productCode;
    }

    public String getProductName() {
        return productName;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return productCode + " | " + productName + " | " + price;
    }
}

class Inventory {
    private Map<String, List<Product>> inventory;

    public Inventory() {
        inventory = new HashMap<>();
    }

    public void addProduct(String category, Product product) {
        inventory.computeIfAbsent(category, k -> new ArrayList<>()).add(product);
    }

    public void displayCategoryDetails(String category) {
        List<Product> products = inventory.get(category);

        if (products == null) {
            System.out.println("Category not found.");
            return;
        }

        System.out.println("\nCategory: " + category);
        System.out.println("Products: ");
        for (Product product : products) {
            System.out.println(product);
        }

        System.out.println("Number of products: " + products.size());
            
        Product highest = products.get(0);
        for (Product product : products) {
            if (product.getPrice() > highest.getPrice()) {
                highest = product;
            }
        }

        System.out.println("Highest priced product: " + highest);
    }

    public void displayCategoryWiseSorted() {
        for (Map.Entry<String, List<Product>> entry : inventory.entrySet()) {
            String category = entry.getKey();

            List<Product> products = entry.getValue();
            products.sort(
                Comparator.comparingInt(Product::getPrice)
                          .reversed()
            );

            System.out.println("\n" + category);
            for (Product product : products) {
                System.out.println(product);
            }
        }
    }

    public void displayCategoryWithHighestProduct() {
        String highestCategory = null;
        Product highestProduct = null;

        for (Map.Entry<String, List<Product>> entry : inventory.entrySet()) {
            String category = entry.getKey();

            for (Product product : entry.getValue()) {
                if (highestProduct == null ||
                    product.getPrice() > highestProduct.getPrice()) {

                    highestProduct = product;
                    highestCategory = category;
                }
            }
        }

        if (highestProduct != null) {
            System.out.println("Category: " + highestCategory + ", Product: " + highestProduct);
        }
    }
}

public class InventorySystem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Inventory inventory = new Inventory();

        while (true) {
            System.out.println("\n--- Menu ---");
            System.out.print("\n1. Add products\n2. View products\n3. Display category wise, sorted\n4. Category with highest product price\n5. Exit\n");
            System.out.print("\nEnter your choice: ");
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("\nEnter category to add products: ");
                    String category = sc.next();

                    System.out.print("\nEnter product details (code, name, price): ");
                    String productCode = sc.next();
                    String productName = sc.next();
                    int price = sc.nextInt();

                    Product newProduct = new Product(productCode, productName, price);
                    inventory.addProduct(category, newProduct);

                    System.out.println("Product added successfully.");
                    break;
                case 2:
                    System.out.print("\nEnter category to view products: ");
                    String viewCategory = sc.next();
                    inventory.displayCategoryDetails(viewCategory);
                    break;
                case 3:
                    inventory.displayCategoryWiseSorted();
                    break;
                case 4:
                    inventory.displayCategoryWithHighestProduct();
                    break;
                case 5:
                    System.out.println("Exiting...");
                    sc.close();
                    return;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }
}