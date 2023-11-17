/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class StudentClass {
    private User user;
    private Classs classid;
       private int is_active;
    private int created_by;
    private Date created_at;
    private int updated_by;
    private Date updated_at;
    private int display_order;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Classs getClassid() {
        return classid;
    }

    public void setClassid(Classs classid) {
        this.classid = classid;
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

    public int getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(int display_order) {
        this.display_order = display_order;
    }

    @Override
    public String toString() {
        return "StudentClass{" + "user=" + user + ", classid=" + classid + ", is_active=" + is_active + ", created_by=" + created_by + ", created_at=" + created_at + ", updated_by=" + updated_by + ", updated_at=" + updated_at + ", display_order=" + display_order + '}';
    }
    
    
    
}
