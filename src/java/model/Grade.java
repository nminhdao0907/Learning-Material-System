/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author OS
 */
public class Grade {
    public int grade_id;
    public int user_id;
    public String studentName; // Add this field
    public String lessonName; // Add this field
    public int lesson_id;
    public int lesson_type;
    public float weight;
   public float score;

    public Grade(int grade_id, int user_id, String studentName, String lessonName, int lesson_id, int lesson_type, float weight, float score) {
        this.grade_id = grade_id;
        this.user_id = user_id;
        this.studentName = studentName;
        this.lessonName = lessonName;
        this.lesson_id = lesson_id;
        this.lesson_type = lesson_type;
        this.weight = weight;
        this.score = score;
    }

    public int getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(int grade_id) {
        this.grade_id = grade_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public int getLesson_type() {
        return lesson_type;
    }

    public void setLesson_type(int lesson_type) {
        this.lesson_type = lesson_type;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Grade{" + "grade_id=" + grade_id + ", user_id=" + user_id + ", studentName=" + studentName + ", lessonName=" + lessonName + ", lesson_id=" + lesson_id + ", lesson_type=" + lesson_type + ", weight=" + weight + ", score=" + score + '}';
    }


    public Grade(int grade_id, int user_id, int lesson_id, int lesson_type, float weight, float score) {
        this.grade_id = grade_id;
        this.user_id = user_id;
        this.lesson_id = lesson_id;
        this.lesson_type = lesson_type;
        this.weight = weight;
        this.score = score;
    }
    
    
}
