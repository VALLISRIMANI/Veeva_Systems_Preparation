/*
Develop a fully functional immutable java class.
*/

final class Student {
    private final String id;
    private final String name;
    private final int marks;
    private final String branch;
    
    public Student(String id, String name, int marks, String branch) {
        this.id = id;
        this.name = name;
        this.marks = marks;
        this.branch = branch;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getMarks() {
        return marks;
    }

    public String getBranch() {
        return branch;
    }

    @Override
    public String toString() {
        return "Student [id=" + id + ", name=" + name + ", marks=" + marks + ", branch=" + branch + "]";
    }
}

public class ImmutableJavaClass {
    public static void main(String[] args) {
        Student student1 = new Student("A01", "Valli", 99, "CSE");
        Student student2 = new Student("A02", "Sri", 95, "CSE");
        System.out.println(student1);
        System.out.println(student2);
    }
}