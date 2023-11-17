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

public class Thread {

    public int id;
    public String title;
    public String content;
    public int topic_id;
    public int user_id;
    public String fullname;
    public String avatar;
    public Date created_at;
    public int updated_by;
    public Timestamp updated_at;

    public Thread(int id, String title, String content, int user_id, String fullname, String avatar, Date created_at) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.user_id = user_id;
        this.fullname = fullname;
        this.avatar = avatar;
        this.created_at = created_at;
    }

    public Thread(int id, String title, String content, int topic_id, int user_id, Date created_at, int updated_by, Timestamp updated_at) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.topic_id = topic_id;
        this.user_id = user_id;
        this.created_at = created_at;
        this.updated_by = updated_by;
        this.updated_at = updated_at;
    }

    public Thread(int id, String title, String content, int topic_id, int user_id, Date created_at, int updated_by, Timestamp updated_at, String fullname, String avatar) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.topic_id = topic_id;
        this.user_id = user_id;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    @Override
    public String toString() {
        return "Thread{" + "id=" + id + ", title=" + title + ", content=" + content + ", topic_id=" + topic_id + ", user_id=" + user_id + ", fullname=" + fullname + ", avatar=" + avatar + ", created_at=" + created_at + ", updated_by=" + updated_by + ", updated_at=" + updated_at + '}';
    }

}
