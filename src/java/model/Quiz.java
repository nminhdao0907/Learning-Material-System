/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Admin
 */
@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Quiz {

    private int quiz_id;
    private String quiz_name;
    private Subject subject;
    private Chapter chapter;
//    private int subject_id;
//    private int chapter_id;
    private int lesson_id;
    private int dimension_id;
    private String dimensionName;
    private int type;
    private int duration;
    private int total_questions;
    private int is_active;
    private int created_by;
    private String created_at;
    private int updated_by;
    private String updated_at;
    private int quizType;
}
