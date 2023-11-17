/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Answer;

/**
 *
 * @author bao chau
 */
public class AnswerDAO extends BaseDAO{
    public ArrayList<Answer> getAnswer(int questionId) {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "select * from answer where question_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Answer answer = new Answer();
                answer.setId(rs.getInt("id"));
                answer.setQuestion_id(rs.getInt("question_id"));
                answer.setAnswer_content(rs.getString("answer_content"));
                answer.setIs_correct(rs.getInt("is_correct"));
                list.add(answer);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public void updateAnswerContent(int answerID,int questionID,String content){
        String sql="UPDATE `group6_lms`.`answer` SET `answer_content` = ? WHERE (`id` = ? and (`question_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content);
            st.setInt(2, answerID);
            st.setInt(3, questionID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Answer getAnswerById(int answerId) {
        String sql = "select * from answer where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, answerId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Answer answer = new Answer();
                answer.setId(rs.getInt("id"));
                answer.setQuestion_id(rs.getInt("question_id"));
                answer.setAnswer_content(rs.getString("answer_content"));
                answer.setIs_correct(rs.getInt("is_correct"));
                return answer;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void updateIsCorrect(int answerId ,int isCorrect,int questionId){
        String sql = "UPDATE `group6_lms`.`answer` SET `is_correct` = ? WHERE (`id` = ?) and (`question_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, isCorrect);
            st.setInt(2, answerId);
            st.setInt(3, questionId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void addAnswer(int isCorrect,int questionId,String answerContent){
        String sql = "INSERT INTO `group6_lms`.`answer` "
                + "(`question_id`, `answer_content`, `is_correct`) VALUES (?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionId);
            st.setString(2, answerContent);
            st.setInt(3, isCorrect);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void deleteAnswer(int questionId,int answerId){
        String sql = "DELETE FROM `group6_lms`.`answer` WHERE (`id` = ?) and (`question_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, answerId);
            st.setInt(2, questionId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        AnswerDAO d = new AnswerDAO();
        for(Answer i: d.getAnswer(123)){
            System.out.println(i.toString());
        }
    }
}
