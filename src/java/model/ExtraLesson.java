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
public class ExtraLesson {

    private int lesson_id;
    private Subject subject;
    private Chapter chapter;
    private Quiz quiz;
    private String title;
    private int is_active;
    private String description;
    private String video_link;
    private String file_attached;
    private int lesson_type;
    private int created_by;
    private String created_at;
    private int updated_by;
    private String updated_at;
}
