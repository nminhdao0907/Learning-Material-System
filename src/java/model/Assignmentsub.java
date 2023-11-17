/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;


public class Assignmentsub {
    private int id;
    private Subject subject_id;
    private  String assignment_name;
    private String attachments;
    private String content;
    private Date due_date;
      private int created_by;
    private String created_at;
    private int updated_by;
    private String updated_at;
    private int class_id;

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Subject getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(Subject subject_id) {
        this.subject_id = subject_id;
    }

    public String getAssignment_name() {
        return assignment_name;
    }

    public void setAssignment_name(String assignment_name) {
        this.assignment_name = assignment_name;
    }

    public String getAttachments() {
        return attachments;
    }

    public void setAttachments(String attachments) {
        this.attachments = attachments;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDue_date() {
        return due_date;
    }

    public void setDue_date(Date due_date) {
        this.due_date = due_date;
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
        return "Assigntment{" + "id=" + id + ", subject_id=" + subject_id + ", assignment_name=" + assignment_name + ", attachments=" + attachments + ", content=" + content + ", due_date=" + due_date + ", created_by=" + created_by + ", created_at=" + created_at + ", updated_by=" + updated_by + ", updated_at=" + updated_at + '}';
    }
    
}
