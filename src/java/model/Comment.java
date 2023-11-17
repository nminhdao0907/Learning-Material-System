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

public class Comment {

    public int id;
    public String content;
    public int thread_id;
    public int userId;
    public Date created_at;
    public int updated_by;
    public Timestamp updated_at;
    public String fullname;
    public String avatar;

    public Comment(int id, String content, int thread_id, int userId, Date created_at, int updated_by, Timestamp updated_at) {
        this.id = id;
        this.content = content;
        this.thread_id = thread_id;
        this.userId = userId;
        this.created_at = created_at;
        this.updated_by = updated_by;
        this.updated_at = updated_at;
    }

    public Comment(int id, String content, int thread_id, int userId, Date created_at, int updated_by, Timestamp updated_at, String fullname, String avatar) {
        this.id = id;
        this.content = content;
        this.thread_id = thread_id;
        this.userId = userId;
        this.created_at = created_at;
        this.updated_by = updated_by;
        this.updated_at = updated_at;
        this.fullname = fullname;
        this.avatar = avatar;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getThread_id() {
        return thread_id;
    }

    public void setThread_id(int thread_id) {
        this.thread_id = thread_id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", content=" + content + ", thread_id=" + thread_id + ", userId=" + userId + ", created_at=" + created_at + ", updated_by=" + updated_by + ", updated_at=" + updated_at + ", fullname=" + fullname + ", avatar=" + avatar + '}';
    }
    
}
