/* 
E-commerce product catalog management system:

You are tasked with developing a core backend module for retail platform's inventory system. The system must maintain a dynamic registry of product profiles, mapping each unique product name to its respective retail price. To satisfy the performance benchmarks, the data structure chosen must support high-speed lookups, prevent duplicate product entries, and allow retail managers to audit the entire catalog. 

Functional requirements: 
1. Catalog initialization: create an empty catalog. 
2. Data ingestion: populate the catalog with initial set of N inventory entries. 
3. Targeted lookup: query the system for the price of a specific item. The system must handle cases where the product exists, print its products while preventing errors if the product does not exist. 
4. Inventory auditing: traverse and print all the products and prices.
*/

import java.util.*;

class Product {
    private String name;
    private int price;

    public Product(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Product [name=" + name + ", price=" + price + "]";
    }
}

class ProductCatalog {
    private HashMap<String, Product> catalog;

    public ProductCatalog() {
        catalog = new HashMap<>();
    }

    public void addProduct(Product product) {
        catalog.put(product.getName(), product);
    }

    public void printAllProducts() {
        System.out.println("\nAll Products:");
        for (Product product : catalog.values()) {
            System.out.println(product);
        }
    }

    public void lookupProduct(String name) {
        if (catalog.containsKey(name)) {
            System.out.println("\nProduct found: " + catalog.get(name));
        } else {
            System.out.println("\nProduct with name '" + name + "' does not exist.");
        }
    }

    public void lookupProductPrice(String name) {
        if (catalog.containsKey(name)) {
            System.out.println("\nPrice of " + name + ": $" + catalog.get(name).getPrice());
        } else {
            System.out.println("\nProduct with name '" + name + "' does not exist.");
        }
    }
}


public class ECommerceProductCatalogManagementSystem {
    public static void main(String[] args) {
        ProductCatalog catalog = new ProductCatalog();

        catalog.addProduct(new Product("Laptop", 1000));
        catalog.addProduct(new Product("Smartphone", 500));
        catalog.addProduct(new Product("Headphones", 100));
        catalog.addProduct(new Product("Monitor", 300));
        catalog.addProduct(new Product("Keyboard", 50));

        catalog.printAllProducts();
        
        catalog.lookupProduct("Smartphone");
        catalog.lookupProduct("Tablet"); 

        catalog.lookupProductPrice("Laptop");
        catalog.lookupProductPrice("Camera");

        catalog.printAllProducts();
    }
}
