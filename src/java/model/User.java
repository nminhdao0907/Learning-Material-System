/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author dangn
 */
@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class User {

    private int id;
    private String password;
    private String fullname;
    private String email;
    private String phone_number;
    private String avatar;
    private boolean status;
    private int role_id;
    private Setting role;
    private Date register_at;
    private int created_by;
    private int updated_by;
    private Date updated_at;

    public User(int id, String fullname) {
        this.id = id;
        this.fullname = fullname;
    }
}
