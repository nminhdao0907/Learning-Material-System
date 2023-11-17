/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bao chau
 */
public class SubmittedAssignment {
    private int id;
    private String name;
    private int classID;
    private int studentID;
    private String studentName;
    private double grade;
    private int is_submit;
    private String submittedAt;

    public SubmittedAssignment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public int getIs_submit() {
        return is_submit;
    }

    public void setIs_submit(int is_submit) {
        this.is_submit = is_submit;
    }

    public String getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(String submittedAt) {
        this.submittedAt = submittedAt;
    }

    @Override
    public String toString() {
        return "SubmittedAssignment{" + "id=" + id + ", name=" + name + ", classID=" + classID + ", studentID=" + studentID + ", studentName=" + studentName + ", grade=" + grade + ", is_submit=" + is_submit + ", submittedAt=" + submittedAt + '}';
    }


    
    
}
