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
import model.Subject;

/**
 *
 * @author dangn
 */
public class LessonDAO extends BaseDAO {

    public ArrayList<Lesson> getLesList() {
        ArrayList<Lesson> lessonList = new ArrayList<>();
        String sql = "select l.lesson_id,l.title,l.is_active,l.description,l.video_link,l.file_attached,l.lesson_type,s.id,s.subject_code,s.subject_name,c.title as chapter_name,c.chapter_id,q.quiz_id,q.quiz_name\n"
                + "from lesson l join subject s on l.subject_id = s.id\n"
                + "LEFT JOIN chapter c on l.chapter_id = c.chapter_id \n"
                + "LEFT JOIN quiz q on q.quiz_id = l.quiz_id\n"
                + "order by l.lesson_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Quiz quiz = new Quiz();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setTitle(rs.getString("title"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(Integer.parseInt(rs.getString("lesson_type")));
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("chapter_name"));
                quiz.setQuiz_id(rs.getInt("quiz_id"));
                quiz.setQuiz_name(rs.getString("quiz_name"));
                lesson.setSubject(subject);
                lesson.setChapter(chapter);
                lesson.setQuiz(quiz);
                lessonList.add(lesson);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lessonList;
    }

    public ArrayList<Lesson> getLessonByPage(ArrayList<Lesson> list, int start, int end) {
        ArrayList<Lesson> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void addLesson(Lesson l) {
        String sql = "insert into lesson(title,chapter_id,quiz_id,subject_id,is_active,description,video_link,file_attached,lesson_type,created_by,created_at)\n"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,NOW());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, l.getTitle());
            st.setInt(2, l.getChapter().getChapter_id());
            Integer quizId = (l.getQuiz() != null) ? l.getQuiz().getQuiz_id() : null;
            st.setObject(3, quizId, java.sql.Types.INTEGER);
            st.setInt(4, l.getSubject().getId());
            st.setInt(5, l.getIs_active());
            st.setString(6, l.getDescription());
            st.setString(7, l.getVideo_link());
            st.setString(8, l.getFile_attached());
            st.setInt(9, l.getLesson_type());
            st.setInt(10, l.getCreated_by());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteLesson(String lesson_id) {
        String sql = "DELETE FROM Lesson\n"
                + "WHERE (`lesson_id` = '" + lesson_id + "')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void activeAndDeactive(Lesson lesson) {
        String sql = "UPDATE lesson SET  \n"
                + "`is_active`=?,`updated_by`=?,`updated_at`= NOW()"
                + "where lesson_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson.getIs_active());
            st.setInt(2, lesson.getUpdated_by());
            st.setInt(3, lesson.getLesson_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Lesson> searchLesson(String searchQuery, String sub, String chap, String status) {
        ArrayList<Lesson> lessonList = new ArrayList<>();
        String sql = "select l.*,s.id,s.subject_code,s.subject_name,c.title as chapter_name,c.chapter_id,q.quiz_id,q.quiz_name"
                + " from lesson l join subject s on l.subject_id = s.id\n"
                + " LEFT JOIN chapter c on l.chapter_id = c.chapter_id \n"
                + " LEFT JOIN quiz q on q.quiz_id = l.quiz_id\n"
                + " where (l.title LIKE ? or l.lesson_id LIKE ?) and l.subject_id LIKE ? and l.chapter_id LIKE ? and l.is_active LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchQuery + "%");
            st.setString(2, "%" + searchQuery + "%");
            st.setString(3, "%" + sub + "%");
            st.setString(4, "%" + chap + "%");
            st.setString(5, "%" + status + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Quiz quiz = new Quiz();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setTitle(rs.getString("title"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(Integer.parseInt(rs.getString("lesson_type")));
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("chapter_name"));
                quiz.setQuiz_id(rs.getInt("quiz_id"));
                quiz.setQuiz_name(rs.getString("quiz_name"));
                lesson.setSubject(subject);
                lesson.setChapter(chapter);
                lesson.setQuiz(quiz);
                lessonList.add(lesson);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessonList;
    }

    public ArrayList<Lesson> searchLessonTest(String searchQuery) {
        ArrayList<Lesson> lessonList = new ArrayList<>();
        String sql = "select l.*,s.id,s.subject_code,s.subject_name,c.title as chapter_name,c.chapter_id,q.quiz_id,q.quiz_name"
                + " from lesson l join subject s on l.subject_id = s.id\n"
                + " LEFT JOIN chapter c on l.chapter_id = c.chapter_id \n"
                + " LEFT JOIN quiz q on q.quiz_id = l.quiz_id \n"
                + " where l.title LIKE ? or l.lesson_id LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchQuery + "%");
            st.setString(2, "%" + searchQuery + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Quiz quiz = new Quiz();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setTitle(rs.getString("title"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(Integer.parseInt(rs.getString("lesson_type")));
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("chapter_name"));
                quiz.setQuiz_id(rs.getInt("quiz_id"));
                quiz.setQuiz_name(rs.getString("quiz_name"));
                lesson.setSubject(subject);
                lesson.setChapter(chapter);
                lesson.setQuiz(quiz);
                lessonList.add(lesson);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessonList;
    }

    public Lesson getLessonByTitle(String title) {
        String sql = "select l.*,s.id,s.subject_code,s.subject_name,c.title as chapter_name,c.chapter_id,q.quiz_id,q.quiz_name"
                + " from lesson l join subject s on l.subject_id = s.id\n"
                + " LEFT JOIN chapter c on l.chapter_id = c.chapter_id \n"
                + " LEFT JOIN quiz q on q.quiz_id = l.quiz_id\n"
                + " where l.title = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Quiz quiz = new Quiz();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setTitle(rs.getString("title"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(Integer.parseInt(rs.getString("lesson_type")));
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("chapter_name"));
                quiz.setQuiz_id(rs.getInt("quiz_id"));
                quiz.setQuiz_name(rs.getString("quiz_name"));
                lesson.setSubject(subject);
                lesson.setChapter(chapter);
                lesson.setQuiz(quiz);
                return lesson;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        LessonDAO d = new LessonDAO();
        ArrayList<Lesson> list = d.getLesList();
//        d.updateLesson("abc1", "17", "Hello World", "hellow.com", "hellow.docx", "2", "11", 88, 0, "125");
        for (Lesson lesson : list) {
            System.out.println(lesson);
        }
    }

    public Lesson getLessonByURL(String url) {
        String sql = "select l.*,s.id,s.subject_code,s.subject_name,c.title as chapter_name,c.chapter_id,q.quiz_id,q.quiz_name"
                + " from lesson l join subject s on l.subject_id = s.id\n"
                + " LEFT JOIN chapter c on l.chapter_id = c.chapter_id \n"
                + " LEFT JOIN quiz q on q.quiz_id = l.quiz_id\n"
                + " where l.video_link = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, url);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Quiz quiz = new Quiz();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setTitle(rs.getString("title"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(Integer.parseInt(rs.getString("lesson_type")));
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("chapter_name"));
                quiz.setQuiz_id(rs.getInt("quiz_id"));
                quiz.setQuiz_name(rs.getString("quiz_name"));
                lesson.setSubject(subject);
                lesson.setChapter(chapter);
                lesson.setQuiz(quiz);
                return lesson;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateLesson(String title, String chapter_id, String description, String video_link, String file_attached, String lesson_type, String subject_id, int quiz_id, int updated_by, String lesson_id) {
        String sql = "Update Lesson \n"
                + "set title = ?, chapter_id = ?,description = ?,video_link = ?, file_attached = ?,lesson_type = ?,subject_id = ?,quiz_id = ?,updated_by = ?, updated_at = NOW()\n"
                + "where lesson_id = ?; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, chapter_id);
            st.setString(3, description);
            st.setString(4, video_link);
            st.setString(5, file_attached);
            st.setString(6, lesson_type);
            st.setString(7, subject_id);
            st.setInt(8, quiz_id);
            st.setInt(9, updated_by);
            st.setString(10, lesson_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

//    public static void main(String[] args) {
//        LessonDAO d = new LessonDAO();
//        d.updateLesson("abc", "20", "abcd", "abc.com", "abc.docs", "3", "8", 84, 0, "18");
//    }
    public Lesson getLessonByID(String lesson_id) {
        ResultSet rs;
        String sql = "select l.*,s.id,s.subject_code,s.subject_name,c.title as chapter_name,c.chapter_id,q.quiz_id,q.quiz_name\n"
                + "from lesson l join subject s on l.subject_id = s.id\n"
                + "LEFT JOIN chapter c on l.chapter_id = c.chapter_id\n"
                + "LEFT JOIN quiz q on q.quiz_id = l.quiz_id\n"
                + "where l.lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lesson_id);
            rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Quiz quiz = new Quiz();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setTitle(rs.getString("title"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(rs.getInt("lesson_type"));
                lesson.setCreated_at(rs.getString("created_at"));
                lesson.setCreated_by(rs.getInt("created_by"));
                lesson.setUpdated_at(rs.getString("updated_at"));
                lesson.setUpdated_by(rs.getInt("updated_by"));
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("chapter_name"));
                quiz.setQuiz_id(rs.getInt("quiz_id"));
                quiz.setQuiz_name(rs.getString("quiz_name"));
                lesson.setSubject(subject);
                lesson.setChapter(chapter);
                lesson.setQuiz(quiz);
                return lesson;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
