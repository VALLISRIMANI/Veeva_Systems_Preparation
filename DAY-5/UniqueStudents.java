/*
Create a Student class with roll number, name. If two students objects share the same roll number, they must be treated as duplicates. Here roll number and name both are strings. Now store multiple student objects, say N number of objects and find out how many unique students are there in the given data.
*/
import java.util.*;

class Student {
    private String rollNumber;
    private String name;

    public Student(String rollNumber, String name) {
        this.rollNumber = rollNumber;
        this.name = name;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "Student [rollNumber=" + rollNumber + ", name=" + name + "]";
    }
}

class Students {
    private List<Student> students;

    public Students() {
        students = new ArrayList<>();
    }

    public void addStudent(Student student) {
        students.add(student);
    }

    public void printAllStudents() {
        System.out.println("\nAll Students:");
        for (Student student : students) {
            System.out.println(student);
        }
    }

    public void printUniqueStudents() {
        Set<String> uniqueRollNumbers = new HashSet<>();
        System.out.println("\nUnique Students:");
        for (Student student : students) {
            if (uniqueRollNumbers.add(student.getRollNumber())) {
                System.out.println(student);
            }
        }
    }
}

public class UniqueStudents {
    public static void main(String[] args) {
        Students students = new Students();
        students.addStudent(new Student("101", "Alice"));
        students.addStudent(new Student("102", "Bob"));
        students.addStudent(new Student("101", "Alice")); 
        students.addStudent(new Student("103", "Charlie"));
        students.addStudent(new Student("104", "David"));
        students.addStudent(new Student("102", "Bob"));

        students.printAllStudents();
        students.printUniqueStudents();
    }
}
