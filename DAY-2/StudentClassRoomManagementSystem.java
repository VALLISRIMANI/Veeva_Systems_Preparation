/*
Design an OOD based system where we have to store number of students in a particular classroom. And the classroom is identified based on a specific course that means we have to store list of unique students related to a classroom where classes are organized for the unique students based on a course. Now the uniqueness of the student is identified using Student ID. But data of the student to be placed in classroom includes ID, Name, Branch. Once data is stored find total number of students in each classroom & also course of the classroom where we have highest number of students.
*/

import java.util.*;

class Student {
    private String studentId;
    private String name;
    private String branch;

    public Student(String studentId, String name, String branch) {
        this.studentId = studentId;
        this.name = name;
        this.branch = branch;
    }

    public String getStudentstudentId() {
        return studentId;
    }

    public String getStudentName() {
        return name;
    }

    public String getStudentBranch() {
        return branch;
    }

    @Override
    public String toString() {
        return studentId + " | " + name + " | " + branch;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (!(obj instanceof Student)) {
            return false;
        }

        Student other = (Student) obj;
        return studentId.equals(other.studentId);
    }

    @Override
    public int hashCode() {
        return studentId.hashCode();
    }
}

class ClassRoom {
    private String courseName;
    private Set<Student> students;

    public ClassRoom (String courseName) {
        this.courseName = courseName;
        this.students = new HashSet<>();
    }

    public String getCourseName() {
        return courseName;
    }

    public void addStudent(Student student) {
        students.add(student);
    }

    public int getStudentCount() {
        return students.size();
    }
}

class University {
    private Map<String, ClassRoom> classrooms;

    public University() {
        classrooms = new HashMap<>();
    }

    public void addStudent(String courseName, Student student) {
        ClassRoom classroom = classrooms.computeIfAbsent(courseName, k -> new ClassRoom(courseName));

        classroom.addStudent(student);
    }

    public void displayStudentCounts() {
        for (Map.Entry<String, ClassRoom> entry : classrooms.entrySet()) {
            ClassRoom classroom = entry.getValue();

            System.out.println("Course: " + classroom.getCourseName() + " | Students: " + classroom.getStudentCount());
        }
    }

    public void findCourseWithHighestStudents() {
        if (classrooms.isEmpty()) {
            System.out.println("No classrooms available.");
            // return;
        }

        ClassRoom highest = classrooms.values().iterator().next();

        for (ClassRoom classroom : classrooms.values()) {
            if (classroom.getStudentCount() > highest.getStudentCount()) {
                highest = classroom;
            }
        }

        System.out.println("Course with highest students: " + highest.getCourseName());
    }
}

public class StudentClassRoomManagementSystem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        University university = new University();

        System.out.print("\nEnter number of students: ");
        int n = sc.nextInt();

        for (int i = 1; i <= n; i++) {
            System.out.println("\nStudent " + i);

            System.out.print("Course: ");
            String course = sc.next();

            System.out.print("Student ID: ");
            String id = sc.next();

            System.out.print("Name: ");
            String name = sc.next();

            System.out.print("Branch: ");
            String branch = sc.next();

            Student student = new Student(id, name, branch);
            university.addStudent(course, student);
        }

        System.out.println("\n--- Number of students in each classroom ---");
        university.displayStudentCounts();

        System.out.println("\n--- Course with highest number of students ---");
        university.findCourseWithHighestStudents();

        System.out.println("\n");
        sc.close();
    }
}