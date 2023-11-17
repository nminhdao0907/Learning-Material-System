/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Answer;
import model.Chapter;
import model.Dimension;
import model.Question;
import model.Quiz;
import model.Subject;
import model.QuizResult;
import model.StoreQuizAnswer;

/**
 *
 * @author Admin
 */
public class QuizDAO extends BaseDAO {

    public ArrayList<Quiz> getQuizzesBySubject(int subjectId, int chapterId) {
        String sql = "SELECT q.quiz_id, q.quiz_name, q.total_questions, q.type, q.duration, s.subject_name, c.title chapter_name "
                + "FROM quiz q "
                + "JOIN subject s ON s.id = q.subject_id "
                + "LEFT JOIN chapter c ON c.chapter_id = q.chapter_id "
                + "WHERE q.subject_id = ?";

        if (chapterId != 0) {
            sql += "AND q.chapter_id = ?";
        }

        ArrayList<Quiz> quizList = new ArrayList<>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, subjectId);
            if (chapterId != 0) {
                stmt.setInt(2, chapterId);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setType(rs.getInt("type"));
                q.setDuration(rs.getInt("duration"));
                q.setTotal_questions(rs.getInt("total_questions"));
                s.setName(rs.getString("name"));
                c.setTitle(rs.getString("title"));
                quizList.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return quizList;
    }

    public ArrayList<Quiz> searchQuizzes(int subjectId, String name, int chapterId) {
        String sql = "SELECT q.quiz_id, q.quiz_name, q.total_questions, q.type, q.duration, s.subject_name, c.title chapter_name "
                + "FROM quiz q "
                + "JOIN subject s ON s.id = q.subject_id "
                + "LEFT JOIN chapter c ON c.chapter_id = q.chapter_id "
                + "WHERE q.subject_id = ? AND q.quiz_name LIKE ?";

        if (chapterId != 0) {
            sql += " AND q.chapter_id = ?";
        }

        ArrayList<Quiz> quizList = new ArrayList<>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, subjectId);
            stmt.setString(2, "%" + name + "%");
            if (chapterId != 0) {
                stmt.setInt(3, chapterId);
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setType(rs.getInt("type"));
                q.setDuration(rs.getInt("duration"));
                q.setTotal_questions(rs.getInt("total_questions"));
                s.setName(rs.getString("name"));
                c.setTitle(rs.getString("title"));
                quizList.add(q);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return quizList;
    }

    public ArrayList<Quiz> getAllQuizzes() {
        ArrayList<Quiz> quizList = new ArrayList<>();
        String sql = "SELECT q.quiz_id, q.quiz_name, q.total_questions, q.type, q.duration, q.is_active, s.id, s.subject_code, c.title chapter_name, c.chapter_id FROM quiz q JOIN subject s ON s.id = q.subject_id LEFT JOIN chapter c ON c.chapter_id = q.chapter_id ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setType(rs.getInt("type"));
                q.setDuration(rs.getInt("duration"));
                q.setTotal_questions(rs.getInt("total_questions"));
                q.setIs_active(rs.getInt("is_active"));
                s.setId(rs.getInt("id"));
                s.setCode(rs.getString("subject_code"));
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("chapter_name"));
                q.setSubject(s);
                q.setChapter(c);
                quizList.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizList;
    }

    public ArrayList<Quiz> getQuizByPage(ArrayList<Quiz> quizList, int start, int end) {
        ArrayList<Quiz> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(quizList.get(i));
        }
        return arr;
    }

    public ArrayList<Quiz> searchQuiz(String searchContent, String subject, String chapter) {
        ArrayList<Quiz> quizList = new ArrayList<>();
        String sql = "SELECT * FROM quiz q "
                + "JOIN subject s ON s.id = q.subject_id "
                + "LEFT JOIN chapter c ON c.chapter_id = q.chapter_id\n"
                + "where q.quiz_name like ? and q.subject_id like ? and q.chapter_id like ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchContent + "%");
            st.setString(2, "%" + subject + "%");
            st.setString(3, "%" + chapter + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setType(rs.getInt("type"));
                q.setDuration(rs.getInt("duration"));
                q.setTotal_questions(rs.getInt("total_questions"));
                s.setId(rs.getInt("id"));
                s.setCode(rs.getString("subject_code"));
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                q.setSubject(s);
                q.setChapter(c);
                quizList.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return quizList;
    }

    public void deleteQuizByID(String quizID) {
        String sql = "DELETE FROM quiz_question WHERE (`quiz_id` = '" + quizID + "');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return;
        }

        sql = "DELETE FROM quiz WHERE (`quiz_id` = '" + quizID + "');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return;
        }
    }

    public Quiz getQuiz(String getBy, String value) {
        QuizDAO qd = new QuizDAO();
        String sql = "SELECT * from quiz q \n"
                + "where " + getBy + " = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                s.setId(rs.getInt("subject_id"));
                c.setChapter_id(rs.getInt("chapter_id"));
                q.setType(rs.getInt("type"));
                q.setDuration(rs.getInt("duration"));
                q.setDimension_id(rs.getInt("dimension_id"));
                q.setDimensionName(qd.getDimensionName(rs.getInt("dimension_id")));
                q.setTotal_questions(rs.getInt("total_questions"));
                q.setIs_active(rs.getInt("is_active"));
                q.setCreated_by(rs.getInt("created_by"));
                q.setCreated_at(rs.getString("created_at"));
                q.setUpdated_by(rs.getInt("updated_by"));
                q.setUpdated_at(rs.getString("updated_at"));
                q.setSubject(s);
                q.setChapter(c);
                q.setQuizType(rs.getInt("quiz_type"));
                return q;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void activeAndDeactive(Quiz quiz) {
        String sql = "UPDATE quiz SET  \n"
                + "`is_active`=?,`updated_by`=?,`updated_at`=NOW()"
                + "where quiz_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz.getIs_active());
            st.setInt(2, quiz.getUpdated_by());
            st.setInt(3, quiz.getQuiz_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addQuiz(Quiz quiz) {
        String sql = "INSERT INTO quiz\n"
                + "(`quiz_name`,`subject_id`,`chapter_id`,`type`,`duration`,`total_questions`,`is_active`,`created_by`,`created_at`)\n"
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quiz.getQuiz_name());
            st.setInt(2, quiz.getSubject().getId());
            st.setInt(3, quiz.getChapter().getChapter_id());
            st.setInt(4, quiz.getType());
            st.setInt(5, quiz.getDuration());
            st.setInt(6, quiz.getTotal_questions());
            st.setInt(7, quiz.getIs_active());
            st.setInt(8, quiz.getCreated_by());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getSubjectName(String subjectId) {
        String sql = "select subject_name \n"
                + "from subject\n"
                + "where subject.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, subjectId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("subject_name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public String getChapterName(String chapterId) {
        String sql = "select title \n"
                + "from chapter\n"
                + "where chapter_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, chapterId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("title");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public String getDimensionName(int dimensionID) {
        String sql = "select name\n"
                + "from dimension\n"
                + "where dimension_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, dimensionID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateQuiz(Quiz quiz) {
        String sql = "UPDATE quiz SET  \n"
                + "`quiz_name`=?,`total_questions`=?, `duration`=?, `chapter_id`=?, `is_active`=?, "
                + "`updated_by`=?,`updated_at`=NOW() "
                + "where quiz_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quiz.getQuiz_name());
            st.setInt(2, quiz.getTotal_questions());
            st.setInt(3, quiz.getDuration());
            st.setInt(4, quiz.getChapter().getChapter_id());
            st.setInt(5, quiz.getIs_active());
            st.setInt(6, quiz.getUpdated_by());
            st.setInt(7, quiz.getQuiz_id());

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Question> getQuestionsByQuiz(String quizId) {
        ArrayList<Question> questionList = new ArrayList<>();
        String sql = "SELECT q.question_id, q.question_content \n"
                + "FROM question q INNER JOIN quiz_question qq \n"
                + "ON qq.question_id = q.question_id \n"
                + "WHERE q.is_active = 1 AND qq.quiz_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, quizId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("question_id");
                String content = rs.getString("question_content");
                Question ques = new Question();
                ques.setId(id);
                ques.setQuestionContent(content);
                questionList.add(ques);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionList;
    }

    public void deleteQuesByID(String quesId, String quizId) {
        String sql = "DELETE FROM quiz_question WHERE (`question_id` = '" + quesId + "') AND `quiz_id` = '" + quizId + "';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        sql = "UPDATE quiz SET total_questions = total_questions - 1 where quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quizId);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Question> getQuestionToAdd(Quiz quiz, String searchContent) {
        ArrayList<Question> questionListToAdd = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM question q\n"
                + "WHERE question_id NOT IN (\n"
                + "    SELECT question_id\n"
                + "    FROM quiz_question\n"
                + "    WHERE quiz_id = ?\n"
                + ") And q.subject_id = ? And q.chapter_id = ? And q.is_active = ?";

        if (searchContent != null && !searchContent.isEmpty()) {
            sql += " AND question_content LIKE ?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz.getQuiz_id());
            ps.setInt(2, quiz.getSubject().getId());
            ps.setInt(3, quiz.getChapter().getChapter_id());
            ps.setInt(4, 1);

            if (searchContent != null && !searchContent.isEmpty()) {
                ps.setString(5, "%" + searchContent + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("question_id");
                String content = rs.getString("question_content");
                Question ques = new Question();
                ques.setId(id);
                ques.setQuestionContent(content);
                questionListToAdd.add(ques);
            }
            return questionListToAdd;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addQuestionToQuiz(String quizId, ArrayList<Integer> listQuestionId, int isFixed) {
        try {
            for (int i = 0; i < listQuestionId.size(); i++) {
                String sql = "INSERT INTO quiz_question (quiz_id, question_id)\n"
                        + "SELECT * FROM (SELECT " + quizId + " AS quiz_id, " + listQuestionId.get(i) + " AS question_id) AS temp\n"
                        + "WHERE NOT EXISTS (\n"
                        + "    SELECT * FROM quiz_question\n"
                        + "    WHERE quiz_id = " + quizId + " AND question_id = " + listQuestionId.get(i) + "\n"
                        + ");";

                PreparedStatement st = connection.prepareStatement(sql);
                st.executeUpdate();
            }

            if (isFixed != 0) {
                String sql = "UPDATE quiz SET total_questions = total_questions + ? WHERE quiz_id = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setInt(1, listQuestionId.size()); // tăng lên số câu hỏi đã thêm
                stmt.setString(2, quizId);
                stmt.executeUpdate();
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int getNewQuizID() {
        String sql = "SELECT  quiz_id FROM quiz\n"
                + "ORDER BY quiz_id DESC \n"
                + "LIMIT 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quiz_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public ArrayList<Integer> geAllQuestionIdByChapterSubject(Quiz quiz) {
        ArrayList<Integer> questionIdList = new ArrayList<>();
        String sql = "SELECT question_id FROM question\n"
                + "WHERE subject_id = ? And chapter_id = ? AND is_active = 1;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz.getSubject().getId());
            ps.setInt(2, quiz.getChapter().getChapter_id());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("question_id");
                questionIdList.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionIdList;
    }

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

    public ArrayList<Question> getQuestionByPage(ArrayList<Question> list, int start, int end) {
        ArrayList<Question> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void newQuestionInQuiz(Question question) {
        String sql = "INSERT INTO question (question_content, chapter_id,"
                + "  subject_id, is_active, created_by, created_at) VALUES (?, ?, ?, ?, ?, NOW());";
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

    public ArrayList<Question> getQuestionListByQuizID(String quizID) {
        ArrayList<Question> questionList = new ArrayList<>();
        String sql = "select q.question_id, q.question_content from quiz_question qq \n"
                + "inner join question q \n"
                + "on qq.question_id = q.question_id \n"
                + "where quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quizID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("question_id"));
                question.setQuestionContent(rs.getString("question_content"));
                questionList.add(question);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return questionList;
    }

    public ArrayList<Question> getQuestionsForQuiz(int quizID) {
        ArrayList<Question> questionList = new ArrayList<>();
        try {
            String sql = "SELECT q.question_id, q.question_content, q.explanation, a.id, a.answer_content, qq.quiz_id \n"
                    + "FROM question q LEFT JOIN answer a ON q.question_id = a.question_id \n"
                    + "LEFT JOIN quiz_question qq ON q.question_id = qq.question_id \n"
                    + "LEFT JOIN quiz qz ON qq.quiz_id = qz.quiz_id \n"
                    + "WHERE qz.quiz_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int questionID = rs.getInt("question_id");
                String questionContent = rs.getString("question_content");
                String explanation = rs.getString("explanation");
                int answerID = rs.getInt("id");
                String answerContent = rs.getString("answer_content");
                int quizIDFromQuizQuestion = rs.getInt("quiz_id");
                if (quizIDFromQuizQuestion == quizID) {
                    // Kiểm tra xem câu hỏi đã tồn tại trong danh sách hay chưa
                    boolean questionExists = false;
                    for (Question question : questionList) {
                        if (question.getId() == questionID) {
                            questionExists = true;
                            if (answerID > 0) {
                                Answer answer = new Answer();
                                answer.setId(answerID);
                                answer.setAnswer_content(answerContent);
                                question.getAnswers().add(answer);
                            }
                            break;
                        }
                    }
                    // Nếu câu hỏi chưa tồn tại trong danh sách, thêm mới câu hỏi và tùy chọn đáp án
                    if (!questionExists) {
                        Question question = new Question();
                        question.setId(questionID);
                        question.setQuestionContent(questionContent);
                        question.setExplanation(explanation);
                        question.setAnswers(new ArrayList<>());
                        if (answerID > 0) {
                            Answer answer = new Answer();
                            answer.setId(answerID);
                            answer.setAnswer_content(answerContent);
                            question.getAnswers().add(answer);
                        }
                        questionList.add(question);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionList;
    }

    public void saveQuizResult(QuizResult result) {
        try {
            String sql = "INSERT INTO quiz_result (user_id, quiz_id, score, completed_at) VALUES (?, ?, ?, NOW())";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, result.getUser_id());
            st.setInt(2, result.getQuiz_id());
            st.setFloat(3, result.getScore());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateResultScore(int userId, int quizId, int resultId) {
        try {
            String update = "UPDATE `quiz_result` SET `score` = ? WHERE `result_id` = ?";
            PreparedStatement stUpdate = connection.prepareStatement(update);
            stUpdate.setFloat(1, (float) calculateScore(userId, quizId));
            stUpdate.setInt(2, resultId);
            stUpdate.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void saveUserAnswers(int resultID, int questionID, ArrayList<Integer> answerIDs) {
        try {
            for (int answerID : answerIDs) {
                String sql = "INSERT INTO quiz_answer (result_id, question_id, answer_options) VALUES (?, ?, ?)";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, resultID);
                st.setInt(2, questionID);
                st.setInt(3, answerID);
                st.executeUpdate();
            }
        } catch (SQLException e) {
        } finally {
        }
    }

    public int getLastResultId() {
        try {
            String sql = "SELECT * FROM quiz_result ORDER BY result_id desc;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public boolean isAnswerCorrect(int answerID) {
        boolean isCorrect = false;
        try {
            String sql = "SELECT is_correct FROM answer WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st = connection.prepareStatement(sql);
            st.setInt(1, answerID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int isCorrectValue = rs.getInt("is_correct");
                isCorrect = (isCorrectValue == 1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isCorrect;
    }

    public Map<String, Integer> getDimensionsWithQuestionCount(String quizID) throws SQLException {
        Map<String, Integer> dimCountMap = new HashMap<>();
        String sql = "SELECT d.name AS dimension_name, COUNT(q.question_id) AS num_questions\n"
                + "FROM quiz z\n"
                + "INNER JOIN quiz_question qz ON z.quiz_id = qz.quiz_id\n"
                + "INNER JOIN question q ON qz.question_id = q.question_id\n"
                + "INNER JOIN dimension d ON q.dimension_id = d.dimension_id\n"
                + "WHERE z.quiz_id = ?\n"
                + "GROUP BY d.name";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, quizID);
            try ( ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    String dimensionName = rs.getString("dimension_name");
                    int numQuestions = rs.getInt("num_questions");
                    dimCountMap.put(dimensionName, numQuestions);
                }
            }
        }
        return dimCountMap;
    }

    public List<Dimension> getAllDimension() {
        List<Dimension> list = new ArrayList<>();
        try {
            String sql = "SELECT `dimension`.`dimension_id`,\n"
                    + "    `dimension`.`type`,\n"
                    + "    `dimension`.`name`,\n"
                    + "    `dimension`.`subject_id`,\n"
                    + "    `dimension`.`is_active`,\n"
                    + "    `dimension`.`created_by`,\n"
                    + "    `dimension`.`created_at`,\n"
                    + "    `dimension`.`updated_by`,\n"
                    + "    `dimension`.`updated_at`\n"
                    + "FROM `dimension`";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Subject subject = getSubject("subject.id", rs.getString("subject_id"));
                Dimension dimension = new Dimension(rs.getInt(1), rs.getString(2), rs.getString(3), subject,
                        rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getInt(8), rs.getDate(9));
                list.add(dimension);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Subject getSubject(String getBy, String value) {
        String sql = "select subject.id,subject.subject_code,subject.subject_name,subject.description,\n"
                + "subject.manager_id,subject.is_active,subject.created_by,subject.created_at,subject.updated_by,subject.updated_at,subject.manager_name\n"
                + "from subject "
                + "where " + getBy + " = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setManagerID(rs.getInt("manager_id"));
                subject.setManagerName(rs.getString("manager_name"));
                subject.setIsActive(rs.getInt("is_active"));
                subject.setCreatedBy(rs.getInt("created_by"));
                subject.setCreatedAt(rs.getString("created_at"));
                subject.setUpdatedBy(rs.getInt("updated_by"));
                subject.setUpdatedAt(rs.getString("updated_at"));
                return subject;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int countDemensition(int qid, int did) {
        String sql = "SELECT COUNT(question.dimension_id)  \n"
                + "FROM `question` inner join quiz_question\n"
                + "on quiz_question.question_id = question.question_id\n"
                + "WHERE `question`.`dimension_id` = ? and quiz_question.quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, did);
            st.setInt(2, qid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotaQuizCorrect(int userId, int quizId) {
        ArrayList<Question> question = getQuestionsForQuiz(quizId);
        Collections.sort(question, (Question q1, Question q2) -> {
            if (q1.getId() > q2.getId()) {
                return 1;
            }
            return -1;
        });
        int correct = 0;
        for (Question q : question) {
            if (isCorrectQuestion(userId, quizId, q.getId())) {
                correct++;
            }
        }
        return correct;
    }

    public int getTotalCorrectAnswers(int userId, String quizId, String questionId, String isCorrect) {
        String sql = "SELECT COUNT(distinct quiz_answer.answer_optiONs ) as 'totalCorrectByCheckbox'\n"
                + "	FROM `quiz_questiON` INNER JOIN  quiz \n"
                + "	ON quiz.quiz_id = quiz_questiON.quiz_id INNER JOIN  quiz_result\n"
                + "	ON quiz.quiz_id = quiz_result.quiz_id INNER JOIN answer\n"
                + "	ON answer.questiON_id = quiz_questiON.questiON_id LEFT JOIN quiz_answer\n"
                + "	ON answer.id = quiz_answer.answer_optiONs \n"
                + "	WHERE quiz.quiz_id = ? AND quiz_result.user_id = ? AND quiz_questiON.questiON_id = ? AND answer.is_correct = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quizId);
            st.setInt(2, userId);
            st.setString(3, questionId);
            st.setString(4, isCorrect);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalCorrectRequired(String questionId, String isCorrect) {
        String sql = "SELECT COUNT(is_correct) as 'totalQuestiONCorrects' FROM answer\n"
                + "	WHERE answer.questiON_id = ? AND answer.is_correct = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, questionId);
            st.setString(2, isCorrect);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalAnswerSent(int userId, String quizId, String questionId) {
        String sql = "SELECT  COUNT(*) as 'totalAnswerSent' "
                + "     FROM quiz_answer INNER JOIN answer\n"
                + "     ON answer.id = quiz_answer.answer_options INNER JOIN quiz_result \n"
                + "     ON quiz_answer.result_id = quiz_result.result_id\n"
                + "     WHERE quiz_result.quiz_id = ? AND quiz_result.user_id = ? AND quiz_answer.questiON_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quizId);
            st.setInt(2, userId);
            st.setString(3, questionId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public boolean isCorrectQuestion(int userId, int quizId, int questionId) {
        System.out.println("userId: " + userId);
        System.out.println("quizId: " + quizId);
        System.out.println("questionId: " + questionId);
        boolean isCorr = true;
        try {
            String sql = "SELECT  totalCorrectByCheckbox.totalCorrectByCheckbox, totalAnswerSent.totalAnswerSent, totalCorrectOfQuestiON.totalQuestiONCorrects\n"
                    + "                    FROM\n"
                    + "                    (SELECT  COUNT(*) as 'totalAnswerSent'\n"
                    + "                    	FROM quiz_answer \n"
                    + "                        INNER JOIN answer\n"
                    + "                        ON answer.id = quiz_answer.answer_options\n"
                    + "                        INNER JOIN quiz_result \n"
                    + "                        ON quiz_answer.result_id = quiz_result.result_id\n"
                    + "                        WHERE quiz_result.quiz_id = ? AND quiz_result.user_id = ? AND quiz_answer.questiON_id = ?\n"
                    + "                    ) as totalAnswerSent,\n"
                    + "                    \n"
                    + "                    (SELECT COUNT(is_correct) as 'totalQuestiONCorrects'\n"
                    + "                    	FROM answer\n"
                    + "                    	WHERE answer.questiON_id = ? AND answer.is_correct = 1\n"
                    + "                    ) as totalCorrectOfQuestion,\n"
                    + "                    \n"
                    + "                    (SELECT COUNT(distinct quiz_answer.answer_optiONs ) as 'totalCorrectByCheckbox'\n"
                    + "                    	FROM `quiz_questiON` \n"
                    + "                    	INNER JOIN  quiz \n"
                    + "                    	ON quiz.quiz_id = quiz_questiON.quiz_id\n"
                    + "                    	INNER JOIN  quiz_result\n"
                    + "                    	ON quiz.quiz_id = quiz_result.quiz_id\n"
                    + "                    	INNER JOIN answer\n"
                    + "                    	ON answer.questiON_id = quiz_questiON.questiON_id\n"
                    + "                    	LEFT JOIN quiz_answer\n"
                    + "                    	ON answer.id = quiz_answer.answer_optiONs \n"
                    + "                    	WHERE quiz.quiz_id = ? AND quiz_result.user_id = ?  AND quiz_questiON.questiON_id = ? AND answer.is_correct = 1\n"
                    + "                    ) AS totalCorrectByCheckbox";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizId);
            st.setInt(2, userId);
            st.setInt(3, questionId);
            st.setInt(4, questionId);
            st.setInt(5, quizId);
            st.setInt(6, userId);
            st.setInt(7, questionId);
            ResultSet rs = st.executeQuery();
            if (!rs.next()) {
                return false;
            }
            int totalCorrectAnswers = rs.getInt("totalCorrectByCheckbox.totalCorrectByCheckbox");
            int totalAnswerSent = rs.getInt("totalAnswerSent.totalAnswerSent");
            int totalCorrectRequired = rs.getInt("totalCorrectOfQuestiON.totalQuestiONCorrects");
            System.out.println("totalCorrectAnswers" + totalCorrectAnswers);
            System.out.println("totalAnswerSent" + totalCorrectAnswers);
            System.out.println("totalCorrectRequired" + totalCorrectRequired);
            System.out.println("======================");
            if (totalAnswerSent != totalCorrectRequired) {
                isCorr = false;
            }
            if (totalCorrectAnswers != totalCorrectRequired) {
                System.out.println("totalAnswerSent != totalCorrectRequired: " + (totalCorrectAnswers != totalCorrectRequired));
                isCorr = false;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println("isCorrect: " + isCorr);
        return isCorr;
    }

    public float calculateScore(int userId, int quizId) {
        try {
            ArrayList<Question> question = getQuestionsForQuiz(quizId);
            float pointPerQuestion = (float) 10 / question.size();
            int correct = getTotaQuizCorrect(userId, quizId);
            float score = (float) Math.ceil(correct * pointPerQuestion * 100) / 100;
            System.out.println("question.size: " + question.size());
            System.out.println("pointPerQuestion: " + pointPerQuestion);
            System.out.println("correct: " + correct);
            System.out.println("score: " + score);
            return score;
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<StoreQuizAnswer> getAnswersForView(int questionId, int resultId) {
        List<StoreQuizAnswer> list = new ArrayList<>();
        try {

            String sql = "SELECT  *\n"
                    + "FROM quiz_answer\n"
                    + "RIGHT JOIN answer\n"
                    + "ON answer.id = quiz_answer.answer_options\n"
                    + "WHERE answer.question_id = ? AND quiz_answer.result_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, questionId);
            st.setInt(2, resultId);
            System.out.println("resultId: " + resultId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                StoreQuizAnswer s = new StoreQuizAnswer(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Question getQuestionByQuizIdAndOffset(int quizId, int offset) {
        try {
            String sql = "SELECT `question`.`question_id`,\n"
                    + "    `question`.`question_content`,\n"
                    + "    `question`.`dimension_id`,\n"
                    + "    `question`.`subject_id`,\n"
                    + "    `question`.`is_active`,\n"
                    + "    `question`.`created_by`,\n"
                    + "    `question`.`created_at`,\n"
                    + "    `question`.`updated_by`,\n"
                    + "    `question`.`updated_at`,\n"
                    + "    `question`.`chapter_id`,\n"
                    + "    `question`.`explanation`\n"
                    + "FROM `question`\n"
                    + "INNER JOIN quiz_question\n"
                    + "ON quiz_question.question_id = question.question_id\n"
                    + "INNER JOIN quiz\n"
                    + "ON quiz.quiz_id = quiz_question.quiz_id\n"
                    + "WHERE quiz.quiz_id = ?\n"
                    + "LIMIT 1 OFFSET " + (offset - 1);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String sub = "SELECT * FROM answer\n"
                        + "WHERE answer.question_id = ?";
                PreparedStatement st1 = connection.prepareStatement(sub);
                st1.setInt(1, rs.getInt("question_id"));
                ResultSet rs1 = st1.executeQuery();
                ArrayList<Answer> answers = new ArrayList<>();
                while (rs1.next()) {
                    Answer answer = new Answer(rs1.getInt(1), rs1.getInt(2), rs1.getString(3), rs1.getInt(4), rs1.getInt(5), rs1.getDate(6), rs1.getInt(7), rs1.getDate(8));
                    answers.add(answer);
                }
                Question question = new Question(rs.getInt("question_id"), rs.getString("question_content"), rs.getInt("chapter_id"),
                        "", rs.getInt("dimension_id"), "", rs.getInt("subject_id"), "", rs.getString("explanation"),
                        rs.getInt("is_active"), rs.getInt("created_by"), sql, "", rs.getInt("updated_by"),
                        "", "", answers);
                return question;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getResultQuizIdByQuizId(int userId, String quizId) {
        String sql = "SELECT * FROM quiz_result\n"
                + "WHERE quiz_id = ? AND user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quizId);
            st.setInt(2, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public QuizResult getResultByQuizId(int userId, int quizId) {
        String sql = "SELECT * FROM quiz_result\n"
                + "WHERE user_id = ? AND quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, quizId);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new QuizResult(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getFloat(4), rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean isFinishedQuiz(int userId, int quizId) {
        try {
            QuizResult result = getResultByQuizId(userId, quizId);

            if (result != null) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void retakeQuiz(int userId, String quizId) {
        try {
            int result_id = getResultQuizIdByQuizId(userId, quizId);
            if (result_id > 0) {
                String sql = "DELETE FROM quiz_answer WHERE quiz_answer.result_id = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, result_id);
                st.executeUpdate();
                String sql1 = "DELETE FROM quiz_result WHERE quiz_result.result_id = ?";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, result_id);
                st1.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Chapter> getChapterList(int id) {
        ArrayList<Chapter> chapterlist = new ArrayList<>();
        String sql = "select chapter.chapter_id,chapter.title\n"
                + "from chapter\n"
                + "where subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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

    public List<Question> searchQuestion(String searchContent) throws SQLException {
        String sql = "SELECT * FROM question WHERE question_content LIKE ?";
        List<Question> questions = new ArrayList<>();
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, "%" + searchContent + "%");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Question question = new Question();
            question.setId(rs.getInt("question_id"));
            question.setQuestionContent(rs.getString("question_content"));
            questions.add(question);
        }
        return questions;
    }

    public boolean isQuizInResults(String quizID) {
        String sql = "SELECT COUNT(*) AS result_count FROM quiz_result WHERE quiz_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, quizID);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int resultCount = rs.getInt("result_count");
                    return resultCount > 0; 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }

}
