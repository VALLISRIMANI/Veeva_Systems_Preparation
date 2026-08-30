/*
Design an OOP-based program to store a collection of books. Each book contains:

Code/ISBN number
Title
Author
Price

The collection must contain unique books based on ISBN number.

Read an ISBN number as input and verify whether the book exists in the collection.

If the book exists, display its complete details.
*/

import java.util.*;

class Book {
    private String isbn;
    private String title;
    private String author;
    private double price;

    public Book(String isbn, String title, String author, double price) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.price = price;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "ISBN: " + isbn + "\nTitle: " + title + "\nAuthor: " + author + "\nPrice: " + price;
    }
}

public class BookManagementSystem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Map<String, Book> books = new HashMap<>();

        System.out.print("\nEnter number of books: ");
        int n = sc.nextInt();
        sc.nextLine();

        for (int i = 1; i <= n; i++) {
            System.out.println("\nBook " + i);

            System.out.print("Enter ISBN: ");
            String isbn = sc.nextLine();

            System.out.print("Enter title: ");
            String title = sc.nextLine();

            System.out.print("Enter author: ");
            String author = sc.nextLine();

            System.out.print("Enter price: ");
            double price = sc.nextDouble();
            sc.nextLine();

            if (books.containsKey(isbn)) {
                System.out.println("Book with this ISBN already exists. Skipping.");
            } else {
                Book book = new Book(isbn, title, author, price);
                books.put(isbn, book);

                System.out.println("Book added successfully.");
            }
        }

        System.out.print("\nEnter ISBN to search: ");
        String searchIsbn = sc.next();

        if (books.containsKey(searchIsbn)) {
            Book book = books.get(searchIsbn);

            System.out.print("\nBook found: ");
            System.out.println(book + "\n");
        } else {
            System.out.println("Book with ISBN " + searchIsbn + " does not exist.\n");
        }

        sc.close();
    }
}