/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author OS
 */
import java.sql.Timestamp;
import java.util.Date;

public class Category {
    public int id;
    public String name;
    public int created_by;
    public Date created_at;
    public int updated_by;
    public Timestamp updated_at;
    public int total_topics;

    public Category(int id, String name, int total_topics) {
        this.id = id;
        this.name = name;
        this.total_topics = total_topics;
    }


    public Category(int id, String name, int created_by, Date created_at, int updated_by, Timestamp updated_at) {
        this.id = id;
        this.name = name;
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

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
        public int getTotal_topics() {
        return total_topics;
    }

    public void setTotal_topics(int total_topics) {
        this.total_topics = total_topics;
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", name=" + name + ", total_topics=" + total_topics + '}';
    }
}

