/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Chapter;
import model.Lesson;
import model.Quiz;
import model.QuizResult;

/**
 *
 * @author bao chau
 */
public class LessonLearningDAO extends BaseDAO {

    public ArrayList<Chapter> getChapterList(int subjectID) {
        ArrayList<Chapter> chapterList = new ArrayList<>();
        String sql = "select * from chapter where subject_id = ? and is_active=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subjectID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                chapterList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return chapterList;
    }
    
    public Lesson getLesson(int lessonID) {
        String sql = "select * from lesson where lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Lesson l  = new Lesson();
                l.setLesson_id(rs.getInt("lesson_id"));
                l.setTitle(rs.getString("title"));
                l.setChapter_id(rs.getInt("chapter_id"));
                l.setDescription(rs.getString("description"));
                l.setLesson_type(rs.getInt("lesson_type"));
                l.setFile_attached(rs.getString("file_attached"));
                l.setQuiz_id(rs.getInt("quiz_id"));
                if(l.getLesson_type() == 1 && rs.getString("video_link").length()!=0) {                 
                    l.setVideo_link("https://www.youtube.com/embed/"+rs.getString("video_link").substring(32));
                }
                return l;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Lesson> getLessonList(int subjectID) {
        ArrayList<Lesson> lessonList = new ArrayList<>();
        String sql = "select lesson.lesson_id,lesson.title,lesson.lesson_type,lesson.chapter_id,lesson.description,lesson.file_attached,lesson.video_link,lesson.quiz_id from lesson\n"
                + "join chapter on chapter.chapter_id = lesson.chapter_id \n"
                + "join subject on subject.id = chapter.subject_id\n"
                + "where subject.id = chapter.subject_id and subject.id = ? and lesson.is_active = 1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subjectID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson();
                l.setLesson_id(rs.getInt(1));
                l.setTitle(rs.getString(2));
                l.setLesson_type(rs.getInt(3));
                l.setChapter_id(rs.getInt(4));
                l.setDescription(rs.getString(5));
                if (l.getLesson_type() == 2) {
                    l.setLinked_quiz(getLessonQuizz(l.getLesson_id()));
                }else if(l.getLesson_type() == 1 && rs.getString(7).length()!=0) {                 
                    l.setVideo_link("https://www.youtube.com/embed/"+rs.getString(7).substring(32));
                }
                l.setFile_attached(rs.getString(6));  
                l.setQuiz_id(rs.getInt(8));
                lessonList.add(l);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessonList;
    }

    public int getLessonQuizz(int lessonID) {

        String sql = "select quiz.quiz_id from quiz join lesson on lesson.lesson_id = quiz.lesson_id and lesson.lesson_id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public String getClassName(int classID) {
        String sql = "select class.class_name from class\n"
                + "where class.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, classID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }
    
    public int getLearingHistory(int userID,int classID) {
        String sql = "select * from learning_history\n" +
                        "where student_id = ? and class_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, classID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(2);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public void updateLearningHistory(int userID,int newLessonID,int classID){       
        String sql = "UPDATE `group6_lms`.`learning_history` SET `lesson_id` = ? WHERE (`student_id` = ?) and (`class_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newLessonID);
            st.setInt(2, userID);
            st.setInt(3, classID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public String getChapterName(int chapterID){
        String sql = "select title from chapter where chapter_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, chapterID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }
    public void addLearningHistory(int userID, int lessonID,int classID){
        String sql = "INSERT INTO `group6_lms`.`learning_history` (`student_id`, `lesson_id`, `class_id`) VALUES (?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, lessonID);
            st.setInt(3, classID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public boolean checkResultExist(int userID,int quizID){
        String sql="select * from quiz_result\n" +
                    "where user_id=? and quiz_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, quizID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    } 
    
    public QuizResult getQuizResult(int userID,int quizID){
        String sql="select * from quiz_result\n" +
                    "where user_id=? and quiz_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, quizID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                QuizResult qr = new QuizResult();
                qr.setResult_id(rs.getInt("result_id"));
                qr.setUser_id(rs.getInt("user_id"));
                qr.setQuiz_id(rs.getInt("quiz_id"));
                qr.setScore(rs.getFloat("score"));
                qr.setCompleted_at(rs.getString("completed_at"));
                return qr;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    } 
    public Quiz getQuiz(int quizID){
        String sql="select * from quiz \n" +
                    "where quiz_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Quiz q = new Quiz();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setTotal_questions(rs.getInt("total_questions"));
                q.setDuration(rs.getInt("duration"));
                return q;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public String getFilename(int lessonId){
        String sql= "select file_attached from lesson where lesson_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonId);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }

    public static void main(String[] args) {
        LessonLearningDAO d = new LessonLearningDAO();
        System.out.println(d.getFilename(1));
    }
}
