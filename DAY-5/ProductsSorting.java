/* 
Create a product class with name, price, rating. Now store multiple products in a list. Now sort the products by highest rating first. If two products have the same rating, sort them by lowest price first.
*/

import java.util.*;

class Product {
    private String name;
    private int price;
    private int rating;

    public Product(String name, int price, int rating) {
        this.name = name;
        this.price = price;
        this.rating = rating;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }


    public int getRating() {
        return rating;
    }

    @Override
    public String toString() {
        return "Product [name=" + name + ", price=" + price + ", rating=" + rating + "]";
    }
}

public class ProductsSorting {
    private List<Product> products;

    public ProductsSorting() {
        products = new ArrayList<>();
    }

    public void addProduct(Product product) {
        products.add(product);
    }

    public void printAllProducts() {
        System.out.println("\nAll Products:");
        for (Product product : products) {
            System.out.println(product);
        }
    }
     
    public void sortByRatingElseLowestPrice() {
        /* Collections.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                if (p1.getRating() != p2.getRating()) {
                    return Integer.compare(p2.getRating(), p1.getRating());
                } else {
                    return Integer.compare(p1.getPrice(), p2.getPrice());
                }
            }
        });
        */

        /*
        products.sort(
            (p1, p2) -> {
                if (p1.getRating() != p2.getRating()) {
                    return Integer.compare(p2.getRating(), p1.getRating());
                } else {
                    return Integer.compare(p1.getPrice(), p2.getPrice());
                }
            }
        );
        */

        products.sort(
            Comparator.comparingInt(Product::getRating).reversed()
                      .thenComparingInt(Product::getPrice)
        );

        System.out.println("\nProducts sorted by rating (descending) and then by price (ascending):");
        for (Product product : products) {
            System.out.println(product);
        }
    }

    public static void main(String[] args) {
        ProductsSorting productsSorting = new ProductsSorting();
        productsSorting.addProduct(new Product("Product A", 100, 4));
        productsSorting.addProduct(new Product("Product B", 150, 5));
        productsSorting.addProduct(new Product("Product C", 120, 4));
        productsSorting.addProduct(new Product("Product D", 80, 3));
        productsSorting.addProduct(new Product("Product E", 200, 5));

        productsSorting.printAllProducts();
        productsSorting.sortByRatingElseLowestPrice();
    }
}