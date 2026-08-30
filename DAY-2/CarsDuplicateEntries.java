/*
Construct and maintain a collection of cars where each car contains a model name and price. Duplicate car entries are allowed.

Find:

1. The name of the car(s) with the highest price.
2. The number of cars having the highest price.
*/

import java.util.*;

class Car {
    private String modelName;
    private double price;

    public Car(String modelName, double price) {
        this.modelName = modelName;
        this.price = price;
    }

    public String getModelName() {
        return modelName;
    }

    public double getPrice() {
        return price;
    }
}

public class CarsDuplicateEntries {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        List<Car> cars = new ArrayList<>();

        System.out.print("\nEnter number of cars: ");
        int n = sc.nextInt();

        for (int i = 1; i <= n; i++) {
            System.out.println("\nCar " + i);

            System.out.print("Enter model name: ");
            String modelName = sc.next();

            System.out.print("Enter price: ");
            double price = sc.nextDouble();

            cars.add(new Car(modelName, price));
        }

        if (cars.isEmpty()) {
            System.out.println("No cars available.");
            sc.close();
            return;
        }

        double highestPrice = cars.get(0).getPrice();

        for (Car car : cars) {
            if (car.getPrice() > highestPrice) {
                highestPrice = car.getPrice();
            }
        }

        int count = 0;
        System.out.print("\nCars with highest price: ");

        for (Car car : cars) {
            if (car.getPrice() == highestPrice) {
                System.out.println(car.getModelName() + " ");
                count++;
            }
        }

        System.out.println("Highest price: " + highestPrice);
        System.out.println("Number of cars: " + count + "\n");
        sc.close();
    }
}