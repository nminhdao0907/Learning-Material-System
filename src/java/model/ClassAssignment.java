/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classs/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author dangn
 */
public class ClassAssignment {

    private int id;
    private String name;
    private Subject subject;
    private Chapter chapter;
    private Lesson lesson;
    private Classs classs;
    private String description;
    private String file_name;
    private String file_content;
    private Timestamp due_date;
    private int is_active;
    private int created_by;
    private String created_at;
    private int updated_by;
    private String updated_at;

    public ClassAssignment() {
    }

    public ClassAssignment(int id, String name, Subject subject, Chapter chapter, Lesson lesson, Classs classs, String description, String file_name, String file_content, Timestamp due_date, int is_active, int created_by, String created_at, int updated_by, String updated_at) {
        this.id = id;
        this.name = name;
        this.subject = subject;
        this.chapter = chapter;
        this.lesson = lesson;
        this.classs = classs;
        this.description = description;
        this.file_name = file_name;
        this.file_content = file_content;
        this.due_date = due_date;
        this.is_active = is_active;
        this.created_by = created_by;
        this.created_at = created_at;
        this.updated_by = updated_by;
        this.updated_at = updated_at;
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

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Chapter getChapter() {
        return chapter;
    }

    public void setChapter(Chapter chapter) {
        this.chapter = chapter;
    }

    public Lesson getLesson() {
        return lesson;
    }

    public void setLesson(Lesson lesson) {
        this.lesson = lesson;
    }

    public Classs getClasss() {
        return classs;
    }

    public void setClasss(Classs classs) {
        this.classs = classs;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getFile_content() {
        return file_content;
    }

    public void setFile_content(String file_content) {
        this.file_content = file_content;
    }

    public Timestamp getDue_date() {
        return due_date;
    }

    public void setDue_date(Timestamp due_date) {
        this.due_date = due_date;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "ClassAssignment{" + "id=" + id + ", name=" + name + ", subject=" + subject + ", chapter=" + chapter + ", lesson=" + lesson + ", classs=" + classs + ", description=" + description + ", file_name=" + file_name + ", file_content=" + file_content + ", due_date=" + due_date + ", is_active=" + is_active + ", created_by=" + created_by + ", created_at=" + created_at + ", updated_by=" + updated_by + ", updated_at=" + updated_at + '}';
    }

}
