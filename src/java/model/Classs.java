/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author OS
 */
public class Classs {

    public int id;
    public int semester_id;
    public int subject_id;
    public String class_name;
    public int trainer_id;
    public Date start_date;
    public Date end_date;
    public String description;
    public int is_active;
    public int created_by;
    public Date created_at;
    public int updated_by;
    public Date updated_at;
    public String created_by_name;
    public String updated_by_name;
    public String trainer_name;
    public String subject_code;
    public String semester_name;

    public Classs() {

    }

    public Classs(int id, int semester_id, int subject_id, String class_name, int trainer_id, Date start_date, Date end_date, String description, int is_active, int created_by, Date created_at, int updated_by, Date updated_at, String created_by_name, String updated_by_name, String trainer_name, String subject_code, String semester_name) {
        this.id = id;
        this.semester_id = semester_id;
        this.subject_id = subject_id;
        this.class_name = class_name;
        this.trainer_id = trainer_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.description = description;
        this.is_active = is_active;
        this.created_by = created_by;
        this.created_at = created_at;
        this.updated_by = updated_by;
        this.updated_at = updated_at;
        this.created_by_name = created_by_name;
        this.updated_by_name = updated_by_name;
        this.trainer_name = trainer_name;
        this.subject_code = subject_code;
        this.semester_name = semester_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSemester_id() {
        return semester_id;
    }

    public void setSemester_id(int semester_id) {
        this.semester_id = semester_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getTrainer_id() {
        return trainer_id;
    }

    public void setTrainer_id(int trainer_id) {
        this.trainer_id = trainer_id;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public String getCreated_by_name() {
        return created_by_name;
    }

    public void setCreated_by_name(String created_by_name) {
        this.created_by_name = created_by_name;
    }

    public String getUpdated_by_name() {
        return updated_by_name;
    }

    public void setUpdated_by_name(String updated_by_name) {
        this.updated_by_name = updated_by_name;
    }

    public String getTrainer_name() {
        return trainer_name;
    }

    public void setTrainer_name(String trainer_name) {
        this.trainer_name = trainer_name;
    }

    public String getSubject_code() {
        return subject_code;
    }

    public void setSubject_code(String subject_code) {
        this.subject_code = subject_code;
    }

    public String getSemester_name() {
        return semester_name;
    }

    public void setSemester_name(String semester_name) {
        this.semester_name = semester_name;
    }

    @Override
    public String toString() {
        return "Classs{" + "id=" + id + ", semester_id=" + semester_id + ", subject_id=" + subject_id + ", class_name=" + class_name + ", trainer_id=" + trainer_id + ", start_date=" + start_date + ", end_date=" + end_date + ", description=" + description + ", is_active=" + is_active + ", created_by=" + created_by + ", created_at=" + created_at + ", updated_by=" + updated_by + ", updated_at=" + updated_at + ", created_by_name=" + created_by_name + ", updated_by_name=" + updated_by_name + ", trainer_name=" + trainer_name + ", subject_code=" + subject_code + ", semester_name=" + semester_name + '}';
    }

}
