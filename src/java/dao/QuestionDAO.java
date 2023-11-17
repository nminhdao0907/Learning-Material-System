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
import model.Dimension;
import model.Question;

/**
 *
 * @author bao chau
 */
public class QuestionDAO extends BaseDAO {

    public ArrayList<Question> getQuestionList(int subjectId, String txtQuestion, String chapterId, String status) {
        QuestionDAO d = new QuestionDAO();
        ArrayList<Question> questionlist = new ArrayList<>();
        String sql = "select * \n"
                + "from question \n"
                + "where question.subject_id = ? and question.question_content like ? "
                + " and question.chapter_id like ? and question.is_active like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subjectId);
            st.setString(2, txtQuestion);
            st.setString(3, chapterId);
            st.setString(4, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("question_id"));
                question.setQuestionContent(rs.getString("question_content"));
                question.setChapterId(rs.getInt("chapter_id"));
                question.setChapterName(d.getChapterName(rs.getInt("chapter_id")));
                question.setSubjectId(rs.getInt("subject_id"));
                question.setExplanation(rs.getString("explanation"));
                question.setIsActive(rs.getInt("is_active"));
                questionlist.add(question);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return questionlist;
    }

    public int getLastID() {
        String sql = "Select  question_id from question order by question_id desc limit 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<Dimension> getQuestiondimensionList(int questionID) {
        String sql = "select question_dimention.question_id, question_dimention.dimension_id, dimension.name \n"
                + "  from question_dimention join dimension on question_dimention.dimension_id=dimension.dimension_id\n"
                + "  where question_id = ? and dimension.is_active=1";
        ArrayList<Dimension> dimensionList = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Dimension d = new Dimension();
                d.setId(rs.getInt("question_dimention.dimension_id"));
                d.setName(rs.getString("dimension.name"));
                dimensionList.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return dimensionList;
    }

    public Question getQuestion(int questionId) {
        QuestionDAO d = new QuestionDAO();
        String sql = "select * from question\n"
                + "where question_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("question_id"));
                question.setQuestionContent(rs.getString("question_content"));
                question.setChapterId(rs.getInt("chapter_id"));
                question.setChapterName(d.getChapterName(rs.getInt("chapter_id")));
                question.setSubjectId(rs.getInt("subject_id"));
                question.setIsActive(rs.getInt("is_active"));
                question.setCreateAt(rs.getString("created_at"));
                question.setCreatedBy(rs.getInt("created_by"));
                question.setUpdateAt(rs.getString("updated_at"));
                question.setUpdatedBy(rs.getInt("updated_by"));
                question.setExplanation(rs.getString("explanation"));
                question.setCreaterName(d.getUserName(rs.getInt("created_by")));
                question.setUpdater(d.getUserName(rs.getInt("updated_by")));
                question.setSubjectName(d.getSubjectName(rs.getInt("subject_id")));
                return question;
                //lmg co subjectname
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getQuestionId() {
        QuestionDAO d = new QuestionDAO();
        String sql = "select question_id from question order by question_id desc limit 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void updateGeneral(Question question) {
        String sql = "UPDATE `group6_lms`.`question` SET "
                + " `chapter_id` = ?, `is_active` = ?,"
                + " `updated_by` = ?, `updated_at` = NOW() WHERE (`question_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, question.getChapterId());
            st.setInt(2, question.getIsActive());
            st.setInt(3, question.getUpdatedBy());
            st.setInt(4, question.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addExplanation(Question question) {
        String sql = "UPDATE `group6_lms`.`question` SET `explanation` = ? WHERE (`question_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, question.getExplanation());
            st.setInt(2, question.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateDetails(Question question) {
        String sql = "UPDATE `group6_lms`.`question` SET `question_content` = ?, "
                + "`explanation` = ?, `updated_by` = ?, `updated_at` = NOW() WHERE (`question_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, question.getQuestionContent());
            st.setString(2, question.getExplanation());
            st.setInt(3, question.getUpdatedBy());
            st.setInt(4, question.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Question> getQuestionByPage(ArrayList<Question> list, int start, int end) {
        ArrayList<Question> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public String getChapterName(int chapterId) {
        String sql = "select chapter.title from chapter\n"
                + "where chapter_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, chapterId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getDimensionName(int dimensionId) {
        String sql = "select name\n"
                + "from dimension\n"
                + "where dimension_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, dimensionId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getUserName(int userId) {
        String sql = "select user.fullname from user where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getSubjectName(int subjectId) {
        String sql = "select subject.subject_name from subject where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subjectId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Chapter> getChapterList(int subjectId) {
        ArrayList<Chapter> chapterlist = new ArrayList<>();
        String sql = "select chapter.chapter_id,chapter.title\n"
                + "from chapter\n"
                + "where subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subjectId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("title"));
                chapterlist.add(chapter);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return chapterlist;
    }

    public boolean checkQuestionDimension(int questionID, int dimensionID) {
        String sql = "select * from question_dimention\n"
                + " where question_id = ? and dimension_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionID);
            st.setInt(2, dimensionID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    public void insertQuestionDimension(int questionID,int dimensionID){
        String sql="INSERT INTO `group6_lms`.`question_dimention` (`question_id`, `dimension_id`) VALUES (?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionID);
            st.setInt(2, dimensionID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void deleteDimension(int questionID,int dimensionID){
        String sql="DELETE FROM `group6_lms`.`question_dimention` WHERE (`question_id` = ?) and (`dimension_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionID);
            st.setInt(2, dimensionID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public ArrayList<Dimension> getDimensionList(int subjectId) {
        ArrayList<Dimension> dimensionlist = new ArrayList<>();
        String sql = "select dimension_id,name\n"
                + "from dimension\n"
                + "where subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subjectId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Dimension dimension = new Dimension();
                dimension.setId(rs.getInt("dimension_id"));
                dimension.setName(rs.getString("name"));
                dimensionlist.add(dimension);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return dimensionlist;
    }

    public void updateStatus(int questionId, int status) {
        String sql = "UPDATE `group6_lms`.`question` SET `is_active` = ? WHERE (`question_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, questionId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void newQuestion(Question question) {
        String sql = "INSERT INTO `group6_lms`.`question` (`question_content`, `chapter_id`,"
                + " `subject_id`, `is_active`, `created_by`, `created_at`) VALUES (?, ?, ?, ?, ?, NOW());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, question.getQuestionContent());
            st.setInt(2, question.getChapterId());
            st.setInt(3, question.getSubjectId());
            st.setInt(4, question.getIsActive());
            st.setInt(5, question.getCreatedBy());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        QuestionDAO d = new QuestionDAO();
        Question q = new Question();
        q.setId(95);
        q.setExplanation("a");
        d.addExplanation(q);
    }
}
