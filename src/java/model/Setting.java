/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author OS
 */
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author OS
 */
public class Setting {

    public int id;
    public String setting_name;
    public String setting_value;
    public int is_active;
    public int display_order;
    public String description;
    public int created_by;
    public Timestamp created_at;
    public int updated_by;
    public Timestamp updated_at;
        public String created_by_name;
    public String updated_by_name;

    public Setting(){
        
    }

    public Setting(int id, String setting_name, String setting_value, int is_active,int display_order, String description, int created_by, Timestamp created_at, int updated_by, Timestamp updated_at) {
        this.id = id;
        this.setting_name = setting_name;
        this.setting_value = setting_value;
        this.is_active = is_active;
        this.display_order = display_order;
        this.description = description;
        this.created_by = created_by;
        this.created_at = created_at;
        this.updated_by = updated_by;
        this.updated_at = updated_at;
    }

    public Setting(int id, String setting_name, String setting_value, int is_active, int display_order, String description, int created_by, Timestamp created_at, int updated_by, Timestamp updated_at, String created_by_name, String updated_by_name) {
        this.id = id;
        this.setting_name = setting_name;
        this.setting_value = setting_value;
        this.is_active = is_active;
        this.display_order = display_order;
        this.description = description;
        this.created_by = created_by;
        this.created_at = created_at;
        this.updated_by = updated_by;
        this.updated_at = updated_at;
        this.created_by_name = created_by_name;
        this.updated_by_name = updated_by_name;
    }

    public Setting(int id, String setting_value) {
        this.id = id;
        this.setting_value = setting_value;
    }

    public int getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(int display_order) {
        this.display_order = display_order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSetting_name() {
        return setting_name;
    }

    public void setSetting_name(String setting_name) {
        this.setting_name = setting_name;
    }

    public String getSetting_value() {
        return setting_value;
    }

    public void setSetting_value(String setting_value) {
        this.setting_value = setting_value;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "Setting{" + "id=" + id + ", setting_name=" + setting_name + ", setting_value=" + setting_value + ", is_active=" + is_active + ", display_order=" + display_order + ", description=" + description + ", created_by=" + created_by + ", created_at=" + created_at + ", updated_by=" + updated_by + ", updated_at=" + updated_at + ", created_by_name=" + created_by_name + ", updated_by_name=" + updated_by_name + '}';
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




    
}
