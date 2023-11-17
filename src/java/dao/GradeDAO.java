/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Grade;

/**
 *
 * @author OS
 */
public class GradeDAO extends BaseDAO {

    public ArrayList<Grade> getGradeList() {
        ArrayList<Grade> gradesList = new ArrayList<>();

        String sql = "SELECT "
                + "g.grade_id AS Grade_ID, "
                + "u.id AS User_ID, "
                + "u.fullname AS Student_Name, "
                + "l.title AS Lesson_Name, "
                + "l.lesson_id AS Lesson_ID, "
                + "g.lesson_type AS Lesson_Type, "
                + "g.weight AS Weight, "
                + "g.score AS Score "
                + "FROM grade g "
                + "JOIN user u ON g.user_id = u.id "
                + "JOIN lesson l ON g.lesson_id = l.lesson_id "
                + "ORDER BY g.grade_id;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Grade grades = new Grade(
                        rs.getInt("Grade_ID"),
                        rs.getInt("User_ID"), // Assuming you want to retrieve the User_ID
                        rs.getString("Student_Name"),
                        rs.getString("Lesson_Name"),
                        rs.getInt("Lesson_ID"),
                        rs.getInt("lesson_type"),
                        rs.getFloat("Weight"),
                        rs.getFloat("Score")
                );
                gradesList.add(grades);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return gradesList;
    }

    public void getNewGrade() {
        String sql = "INSERT INTO grade (user_id, lesson_id, lesson_type, weight, score) " +
             "SELECT qr.user_id, q.lesson_id, 2 AS lesson_type, l.weight, qr.score " +
             "FROM quiz_result qr " +
             "JOIN quiz q ON qr.quiz_id = q.quiz_id " +
             "JOIN lesson l ON q.lesson_id = l.lesson_id " +
             "ON DUPLICATE KEY UPDATE " +
             "weight = VALUES(weight), score = VALUES(score); " +
             "INSERT INTO grade (user_id, lesson_id, lesson_type, weight, score) " +
             "SELECT sa.student_id, al.lesson_id, 3 AS lesson_type, l.weight, sa.mark " +
             "FROM submitted_assignment sa " +
             "JOIN assignment_list al ON sa.assignment_id = al.id " +
             "JOIN lesson l ON al.lesson_id = l.lesson_id " +
             "ON DUPLICATE KEY UPDATE " +
             "weight = VALUES(weight), score = VALUES(score);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Grade> getGradeByPage(ArrayList<Grade> gradeList, int start, int end) {
        ArrayList<Grade> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(gradeList.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        GradeDAO a = new GradeDAO();
        List<Grade> list = a.getGradeList();
        System.out.println(list.get(0).toString());

    }
}
