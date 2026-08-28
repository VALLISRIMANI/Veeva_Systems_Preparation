/*
Store a list of students based on branch in a university. For every branch, store a list of students so that students can be accessed based on branch name.

For every student maintain:

Roll number | Name | Branch | Section | CGPA

When storing student data, the above 5 are inputs. Grade should be computed.

Perform the following operations:

1. Display list of students branch-wise.
2. Display students branch-wise sorted in descending order of grade.
3. Display students branch-wise sorted in ascending order of marks.
4. Given a branch, find the number of students in that branch and names of students having "S" grade.
5. Find the departments/branches having the highest number of "S" grades.
*/

import java.util.*;

class Student {
    private int rollNumber;
    private String name;
    private String branch;
    private String section;
    private double cgpa;
    private String grade;

    public Student(int rollNumber, String name, String branch, String section, double cgpa) {
        this.rollNumber = rollNumber;
        this.name = name;
        this.branch = branch;
        this.section = section;
        this.cgpa = cgpa;
        this.grade = calculateGrade(cgpa);
    }

    private String calculateGrade(double cgpa) {
        if (cgpa >= 9.0) {
            return "S";
        } else if (cgpa >= 8.0) {
            return "A";
        } else if (cgpa >= 7.0) {
            return "B";
        } else if (cgpa >= 6.0) {
            return "C";
        } else if (cgpa >= 5.0) {
            return "D";
        } else {
            return "F";
        }
    }

    public int getRollNumber() {
        return rollNumber;
    }

    public String getName() {
        return name;
    }

    public String getBranch() {
        return branch;
    }

    public String getSection() {
        return section;
    }

    public double getCgpa() {
        return cgpa;
    }

    public String getGrade() {
        return grade;
    }

    @Override
    public String toString() {
        return rollNumber + " | " + name + " | " + branch + " | " + section + " | " + cgpa + " | " + grade;
    }
}

class University {
    private Map<String, List<Student>> studentsByBranch;

    public University() {
        studentsByBranch = new HashMap<>();
    }

    public void addStudent(Student student) {
        studentsByBranch.computeIfAbsent(student.getBranch(), k -> new ArrayList<>()).add(student);
    }

    public void displayBranchWise() {
        for (Map.Entry<String, List<Student>> entry : studentsByBranch.entrySet()) {
            System.out.println("\nBranch: " + entry.getKey());

            for (Student student : entry.getValue()) {
                System.out.println(student);
            }
        }
    }

    public void displayByGradeDescending() {
        for (Map.Entry<String, List<Student>> entry : studentsByBranch.entrySet()) {
            List<Student> students = new ArrayList<>(entry.getValue());

            students.sort(Comparator.comparing(Student::getGrade).reversed());

            System.out.println("\nBranch: " + entry.getKey());

            for (Student student : students) {
                System.out.println(student);
            }
        }
    }

    public void displayByMarksAscending() {
        for (Map.Entry<String, List<Student>> entry : studentsByBranch.entrySet()) {
            List<Student> students = new ArrayList<>(entry.getValue());

            students.sort(Comparator.comparingDouble(Student::getCgpa));

            System.out.println("\nBranch: " + entry.getKey());

            for (Student student : students) {
                System.out.println(student);
            }
        }
    }

    public void branchDetails(String branch) {
        List<Student> students = studentsByBranch.get(branch);

        if (students == null) {
            System.out.println("Branch not found.");
            return;
        }

        System.out.println("\nNumber of students in " + branch + ": " + students.size());

        System.out.println("Students with S grade:");

        for (Student student : students) {
            if (student.getGrade().equals("S")) {
                System.out.println(student.getName());
            }
        }
    }

    public void findBranchesWithHighestSGrades() {
        int highestCount = 0;

        Map<String, Integer> sGradeCounts = new HashMap<>();

        for (Map.Entry<String, List<Student>> entry : studentsByBranch.entrySet()) {
            int count = 0;

            for (Student student : entry.getValue()) {
                if (student.getGrade().equals("S")) {
                    count++;
                }
            }

            sGradeCounts.put(entry.getKey(), count);

            if (count > highestCount) {
                highestCount = count;
            }
        }

        System.out.println("\nHighest number of S grades: " + highestCount);

        System.out.println("Branch(es):");

        for (Map.Entry<String, Integer> entry : sGradeCounts.entrySet()) {
            if (entry.getValue() == highestCount) {
                System.out.println(entry.getKey());
            }
        }
    }
}

public class UniversityStudentManagement {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        University university = new University();

        System.out.print("Enter number of students: ");
        int n = sc.nextInt();
        sc.nextLine();

        for (int i = 1; i <= n; i++) {
            System.out.println("\nStudent " + i);

            System.out.print("Roll number: ");
            int rollNumber = sc.nextInt();
            sc.nextLine();

            System.out.print("Name: ");
            String name = sc.nextLine();

            System.out.print("Branch: ");
            String branch = sc.nextLine();

            System.out.print("Section: ");
            String section = sc.nextLine();

            System.out.print("CGPA: ");
            double cgpa = sc.nextDouble();
            sc.nextLine();

            Student student = new Student(rollNumber, name, branch, section, cgpa);
            university.addStudent(student);
        }

        System.out.println("\n===== 1. BRANCH WISE =====");
        university.displayBranchWise();

        System.out.println("\n===== 2. GRADE DESCENDING =====");
        university.displayByGradeDescending();

        System.out.println("\n===== 3. CGPA ASCENDING =====");
        university.displayByMarksAscending();

        System.out.print("\nEnter branch for details: ");
        String branch = sc.nextLine();

        university.branchDetails(branch);

        System.out.println("\n===== 5. HIGHEST S GRADES =====");
        university.findBranchesWithHighestSGrades();

        sc.close();
    }
}