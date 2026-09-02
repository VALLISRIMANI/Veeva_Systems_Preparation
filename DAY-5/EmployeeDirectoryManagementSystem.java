/* 
Employee Directory Management System:

An organization needs an efficient way to manage and look up its employees' records. Every employee is assigned a unique ID. Searching through a standard sequential list, like an array list or linked list to find an employee details, becomes increasingly slow as the company grows with more number of employees. Now design and develop high-performance employee directory system. 

Functional requirements: 
1. Data mapping. It should map a unique integer ID to a set of employee details, like name, job, salary, date of joining. 
2. Fast insertion. 
3. Record removal. 
2 and 3 options. These two must be in O(1) time complexity. 
4. Instance retrieval: Given an employee ID, retrieve details of employee quickly. 
5. Data modification. Update employee details based on employee ID. 
6. Traversal: Provide a mechanism to iterate through entire employee active directory and print the details.
*/

import java.util.*;
import java.time.LocalDate;

class Employee {
	private int id;
	private String name;
	private String job;
	private int salary;
	private LocalDate dateOfJoining;
	
	public Employee(int id, String name, String job, int salary, LocalDate dateOfJoining) {
		this.id = id;
		this.name = name;
		this.job = job;
		this.salary = salary;
		this.dateOfJoining = dateOfJoining;
	}
	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getJob() {
		return job;
	}
	
	public int getSalary() {
		return salary;
	}
	
	public LocalDate getDateOfJoining() {
		return dateOfJoining;
	}
	
	@Override
	public String toString() {
		return "Employee [Id=" + id + ", Name=" + name + ", Job=" + job + ", Salary=" + salary + ", Date Of Joining=" + dateOfJoining + "]";
	}
}

class Employees {
	private HashMap<Integer, Employee> employees;
	
	public Employees() {
		employees = new HashMap<>();
	}
	
	public void add(int id, Employee employee) {
		employees.put(id, employee);
	}
	
	public void printAllEntries() {
		System.out.println("\n--- All Employees ---");
		
		for (Map.Entry<Integer, Employee> entry : employees.entrySet()) {
			System.out.println(entry);
		}
	}
	
	public void removeEntryIfExists(int id) {
		if (employees.containsKey(id)) {
			employees.remove(id);
			System.out.println("\nEmployee with id " + id + " deleted successfully.");
		} else {
			System.out.println("\nEmployee with id " + id + " does not exists.");
		}
	}
	
	public void retrieveEmployeeDetails(int id) {

		if (employees.containsKey(id)) {
            System.out.println("\nEmployee Details:");
			System.out.println(employees.get(id));
		} else {
			System.out.println("\nEmployee with id " + id + " does not exists.");
		}
	}
	
	public void updateEmployeeDetails(int id, Employee updatedEmployee) {
		if (!employees.containsKey(id)) {
			System.out.println("\nEmployee with id " + id + " does not exists.");
		} else {
			employees.put(id, updatedEmployee);
			System.out.println("\nEmployee with id " + id + " updated successfully.");
		}
	}	
}

public class EmployeeDirectoryManagementSystem {
	public static void main(String[] args) {
        Employees employees = new Employees();
        employees.add(1, new Employee(1, "John Doe", "Software Engineer", 80000, LocalDate.of(2020, 1, 15)));
        employees.add(2, new Employee(2, "Jane Smith", "Product Manager", 95000, LocalDate.of(2019, 3, 10)));
        employees.add(3, new Employee(3, "Alice Johnson", "Data Scientist", 90000, LocalDate.of(2021, 5, 20))); 
        employees.add(4, new Employee(4, "Bob Brown", "UX Designer", 75000, LocalDate.of(2022, 7, 5)));

        employees.printAllEntries();

        employees.retrieveEmployeeDetails(2);
        employees.removeEntryIfExists(3);

        employees.printAllEntries();

        employees.updateEmployeeDetails(1, new Employee(1, "John Doe", "Senior Software Engineer", 90000, LocalDate.of(2020, 1, 15)));
        employees.retrieveEmployeeDetails(1);

        employees.removeEntryIfExists(5);

        employees.printAllEntries();
        System.out.println("\n--- End of Employee Directory Management System ---\n");
	}
}