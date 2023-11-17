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

public class Topic {
    public int id;
    public int category_id;
    public String name;
    public int created_by;
    public Date created_at;
    public int updated_by;
    public Timestamp updated_at;
    public int total_threads;

    public Topic(int id, int category_id, String name, int total_threads) {
        this.id = id;
        this.category_id = category_id;
        this.name = name;
        this.total_threads = total_threads;
    }


    @Override
    public String toString() {
        return "Topic{" + "id=" + id + ", category_id=" + category_id + ", name=" + name + ", total_threads=" + total_threads + '}';
    }

    public Topic(int id, int category_id, String name, int created_by, Date created_at, int updated_by, Timestamp updated_at) {
        this.id = id;
        this.category_id = category_id;
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

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
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
        public int getTotal_threads() {
        return total_threads;
    }

    public void setTotal_threads(int total_threads) {
        this.total_threads = total_threads;
    }


}
