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

@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
/**
 *
 * @author dangn
 */
public class Lesson {

    private int lesson_id;
    private String subject_code;
    private String title;
    private int chapter_id;
    private int is_active;
    private String description;
    private String video_link;
    private int linked_quiz;
    private int lesson_type;
    private int quiz_id;
    private String file_attached;
    private int created_by;
    private String created_at;
    private int updated_by;
    private String updated_at;
    private Subject subject;
    private Chapter chapter;
    private Quiz quiz;
}
