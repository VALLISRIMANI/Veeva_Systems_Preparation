/*
Create an employee class with the id, name, salary. Store multiple employees in a list. Now develop a program to filter and print names of employees who earn more than 60,000. Generalize above problem reading X and print the employees who earn more than x.
*/

import java.util.*;

class Employee {
    private int id;
    private String name;
    private int salary;

    public Employee(int id, String name, int salary) {
        this.id = id;
        this.name = name;
        this.salary = salary;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
    
    public int getSalary() {
        return salary;
    }
    
    @Override
    public String toString() {
        return "Employee [id=" + id + ", name=" + name + ", salary=" + salary + "]";
    }
}

class Employees {
    private List<Employee> employees;

    public Employees() {
        employees = new ArrayList<>();
    }

    public void addEmployee(Employee employee) {
        employees.add(employee);
    }

    public void printAllEmployees() {
        System.out.println("\nAll Employees:");
        for (Employee employee : employees) {
            System.out.println(employee);
        }
    }

    public void filterEmployeesBySalary(int salaryThreshold) {
        System.out.println("\nEmployees earning more than " + salaryThreshold + ":");
        for (Employee employee : employees) {
            if (employee.getSalary() > salaryThreshold) {
                System.out.println(employee.getName());
            }
        }
    }

    public int getSalaryByName(String name) {
        for (Employee employee : employees) {
            if (employee.getName().equalsIgnoreCase(name)) {
                return employee.getSalary();
            }
        }
        return -1;
    }

    public void filterEmployeesBySalaryOfAnotherEmployeeName(String x) {
        System.out.println("\nEmployees earning more than " + x + ":");
        for (Employee employee : employees) {
            if (employee.getSalary() > getSalaryByName(x)) {
                System.out.println(employee.getName());
            }
        }
    }
}


public class EmployeeSalaryFilter {
    public static void main(String[] args) {
        Employees employees = new Employees();
        
        employees.addEmployee(new Employee(1, "Alice", 50000));
        employees.addEmployee(new Employee(2, "Bob", 70000));
        employees.addEmployee(new Employee(3, "Charlie", 60000));
        employees.addEmployee(new Employee(4, "David", 80000));
        
        employees.printAllEmployees();
        
        employees.filterEmployeesBySalary(60000);
        
        Scanner scanner = new Scanner(System.in);
        System.out.print("\nEnter employee name: ");
        String name = scanner.nextLine();
        employees.filterEmployeesBySalaryOfAnotherEmployeeName(name);
        
        scanner.close();
    }
}