/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnswerDAO;
import dao.ChapterDAO;
import dao.QuestionDAO;
import dao.QuizDAO;
import dao.SubjectDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Answer;
import model.Chapter;
import model.Question;
import model.Quiz;
import model.QuizResult;
import model.Subject;
import model.User;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import utils.Helpers;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)

public class Quizz extends HttpServlet {

    QuizDAO qd = new QuizDAO();
    SubjectDAO sd = new SubjectDAO();
    ChapterDAO cd = new ChapterDAO();
    QuestionDAO questiondao = new QuestionDAO();
    SubjectDAO subjectdao = new SubjectDAO();
    AnswerDAO answerdao = new AnswerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action") == null ? "list" : request.getParameter("action");
            switch (action) {
                case "list":
                    quizList(request, response);
                    break;
                case "search":
                    searchQuiz(request, response);
                    break;
                case "detailQuiz":
                    String quizID = request.getParameter("quizID");
                    detailQuiz(request, response, quizID);
                    break;
                case "sort":
                    sort(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "removeQuestion":
                    removeQuestion(request, response);
                    break;
                case "addQuiz":
                    addQuiz(request, response);
                    break;
                case "activeAndDeactive":
                    activeAndDeactivedQuiz(request, response);
                    quizList(request, response);
                    break;
                case "updateQuiz":
                    updateQuiz(request, response);
                    break;
                case "addQuestionToQuiz":
                    addQuestionToQuiz(request, response);
                    break;
                case "export":
                    exportExcel(request, response);
                    break;
                case "getTemplate":
                    getTemplate(request, response);
                    break;
                case "questionList":
                    questionList(request, response);
                    break;
                case "submitQuiz":
                    submitQuiz(request, response);
                    break;
                case "resultQuiz":
                    resultQuiz(request, response);
                    break;
                case "reviewQuiz":
                    viewQuestions(request, response);
                    break;
                case "searchQues":
                    searchQues(request, response);
                    break;

            }
            System.out.println(action);
        } catch (SQLException ex) {
            Logger.getLogger(Quizz.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void viewQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String quizID = request.getParameter("quizID");
        int questionsPerPage = 1;
        Quiz quiz = qd.getQuiz("quiz_id", quizID);
        ArrayList<Question> questionList = qd.getQuestionsForQuiz(Integer.parseInt(quizID));
        request.setAttribute("quiz", quiz);
        request.setAttribute("questionsPerPage", questionsPerPage);
        paging(request, response, questionList);

        request.getRequestDispatcher("/view/trainee/QuizReview.jsp").forward(request, response);
    }

    private void resultQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String qid_raw = request.getParameter("quizID");
        int qid = Helpers.parseInt(qid_raw);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        Quiz quiz = qd.getQuiz("quiz_id", qid_raw);
        request.setAttribute("quiz", quiz);
        request.getRequestDispatcher("view/trainee/QuizResult.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subjectId2 = request.getParameter("subjectId2");
        try {
            importExcel(request, response, subjectId2);
        } catch (SQLException ex) {
            Logger.getLogger(Quizz.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void quizList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Quiz> quizList = qd.getAllQuizzes();
        int numOfSubject = quizList.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfSubject / 10;
        if (numOfSubject % 10 != 0) {
            maxPage++;
        }
        String spage = request.getParameter("page");
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }
        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfSubject);
        ArrayList<Quiz> listByPage = qd.getQuizByPage(quizList, start, end);

        if (page >= 3) {
            if (page + 2 < maxPage) {
                endPage = page + 2;
            } else {
                endPage = maxPage;
            }
            if (maxPage >= 5) {
                startPage = endPage - 4;
            } else {
                startPage = page - 2;
            }
        } else {
            if (maxPage >= 5) {
                endPage = 5;
            } else {
                endPage = maxPage;
            }
        }
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        request.setAttribute("nasc", 0);
        request.setAttribute("sasc", 0);
        request.setAttribute("casc", 0);
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("quizList", listByPage);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/view/manager/QuizList.jsp").forward(request, response);
    }

    private void searchQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchContent = request.getParameter("searchContent");
        String subject = request.getParameter("searchBySubject");
        String chapter = request.getParameter("searchByChapter");
        ArrayList<Quiz> quizList = qd.searchQuiz(searchContent, subject, chapter);
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);
        request.setAttribute("searchContent", searchContent);
        request.setAttribute("searchBySubject", subject);
        request.setAttribute("searchByChapter", chapter);
        request.setAttribute("quizList", quizList);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/view/manager/QuizList.jsp").forward(request, response);
    }

    private void addQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int subjectId = Integer.parseInt(request.getParameter("subject"));
        int chapterId = Integer.parseInt(request.getParameter("chapter"));
        String name = request.getParameter("name");
        int status = Integer.parseInt(request.getParameter("status"));
        int isFixed = Integer.parseInt(request.getParameter("type"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = user.getId();
        Quiz quiz = new Quiz();
        Subject s = new Subject();
        Chapter c = new Chapter();
        s.setId(subjectId);
        c.setChapter_id(chapterId);
        quiz.setQuiz_name(name);
        quiz.setIs_active(status);
        quiz.setDuration(duration);
        quiz.setType(isFixed);
        quiz.setCreated_by(userID);
        quiz.setChapter(c);
        quiz.setSubject(s);
        if (isFixed == 1) {
            quiz.setTotal_questions(0);
            qd.addQuiz(quiz);
        } else {
            int total = Integer.parseInt(request.getParameter("total"));
            quiz.setTotal_questions(total);
            qd.addQuiz(quiz);

            int newQuizID = qd.getNewQuizID();
            ArrayList<Integer> listQuestionId = generateRandom(quiz);
            qd.addQuestionToQuiz(Integer.toString(newQuizID), listQuestionId, 0);
        }
        request.setAttribute("txt", "Success");
        request.getRequestDispatcher("Quizz?action=list").forward(request, response);
    }

    private void sort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        String type = request.getParameter("type");
        String nasc = request.getParameter("nasc");
        String sasc = request.getParameter("sasc");
        String casc = request.getParameter("casc");
        ArrayList<Quiz> quizList = qd.getAllQuizzes();
        int numOfSubject = quizList.size();
        int startPage = 1, endPage;
        int maxPage = numOfSubject / 10;
        if (numOfSubject % 10 != 0) {
            maxPage++;
        }
        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfSubject);
        ArrayList<Quiz> listByPage = new ArrayList();
        if ("name".equals(type)) {
            listByPage = sortByComponent(qd.getQuizByPage(quizList, start, end), type, nasc);
            if ("0".equals(nasc)) {
                request.setAttribute("nasc", 1);
            } else {
                request.setAttribute("nasc", "0");
            }
            request.setAttribute("sasc", sasc);
            request.setAttribute("casc", casc);
        } else if ("subject".equals(type)) {
            listByPage = sortByComponent(qd.getQuizByPage(quizList, start, end), type, sasc);
            if ("0".equals(sasc)) {
                request.setAttribute("sasc", 1);
            } else {
                request.setAttribute("sasc", "0");
            }
            request.setAttribute("casc", casc);
            request.setAttribute("nasc", nasc);
        } else {
            listByPage = sortByComponent(qd.getQuizByPage(quizList, start, end), type, casc);
            if ("0".equals(casc)) {
                request.setAttribute("casc", 1);
            } else {
                request.setAttribute("casc", "0");
            }
            request.setAttribute("nasc", nasc);
            request.setAttribute("sasc", sasc);
        }
        if (page >= 3) {
            if (page + 2 < maxPage) {
                endPage = page + 2;
            } else {
                endPage = maxPage;
            }
            if (maxPage >= 5) {
                startPage = endPage - 4;
            } else {
                startPage = page - 2;
            }
        } else {
            if (maxPage >= 5) {
                endPage = 5;
            } else {
                endPage = maxPage;
            }
        }
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("quizList", listByPage);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/view/manager/QuizList.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String quizID = request.getParameter("quizID");
        System.out.println(quizID);
//        String page = request.getParameter("page");
        boolean quizExistsInResults = qd.isQuizInResults(quizID);
        System.out.println(quizExistsInResults);
        if (quizExistsInResults) {
//            request.setAttribute("page", page);
            request.setAttribute("alert", "Cannot delete this quiz !!");
            quizList(request, response);
        } else {
            qd.deleteQuizByID(quizID);
//            request.setAttribute("page", page);
            request.setAttribute("txt", "Success");
            quizList(request, response);
        }
    }

    private ArrayList<Quiz> sortByComponent(ArrayList<Quiz> quizByPage, String type, String asc) {
        if ("name".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(quizByPage, new Comparator<Quiz>() {
                    @Override
                    public int compare(Quiz o1, Quiz o2) {
                        return o1.getQuiz_name().compareTo(o2.getQuiz_name());
                    }
                });
            } else {
                Collections.sort(quizByPage, new Comparator<Quiz>() {
                    @Override
                    public int compare(Quiz o1, Quiz o2) {
                        return o2.getQuiz_name().compareTo(o1.getQuiz_name());
                    }
                });
            }
        } else if ("subject".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(quizByPage, new Comparator<Quiz>() {
                    @Override
                    public int compare(Quiz o1, Quiz o2) {
                        return o1.getSubject().getId() - o2.getSubject().getId();
                    }
                });
            } else {
                Collections.sort(quizByPage, new Comparator<Quiz>() {
                    @Override
                    public int compare(Quiz o1, Quiz o2) {
                        return o2.getSubject().getId() - o1.getSubject().getId();
                    }
                });
            }
        } else {
            if ("0".equals(asc)) {
                Collections.sort(quizByPage, new Comparator<Quiz>() {
                    @Override
                    public int compare(Quiz o1, Quiz o2) {
                        return o1.getChapter().getChapter_id() - o2.getChapter().getChapter_id();
                    }
                });
            } else {
                Collections.sort(quizByPage, new Comparator<Quiz>() {
                    @Override
                    public int compare(Quiz o1, Quiz o2) {
                        return o2.getChapter().getChapter_id() - o1.getChapter().getChapter_id();
                    }
                });
            }
        }
        return quizByPage;
    }

    private void activeAndDeactivedQuiz(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String id = request.getParameter("quizID");
        Quiz quiz = qd.getQuiz("q.quiz_id", id);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = user.getId();
        quiz.setUpdated_by(userID);
        if (quiz.getIs_active() == 1) {
            quiz.setIs_active(0);
            qd.activeAndDeactive(quiz);
        } else {
            quiz.setIs_active(1);
            qd.activeAndDeactive(quiz);
        }
        request.setAttribute("page", page);
        request.setAttribute("txt", "Success");
    }

    private void detailQuiz(HttpServletRequest request, HttpServletResponse response, String quizID) throws ServletException, IOException, SQLException {
        Quiz quiz = qd.getQuiz("quiz_id", quizID);
        ArrayList<Question> questionList = qd.getQuestionsByQuiz(quizID);
        ArrayList<Question> questionListToAdd = qd.getQuestionToAdd(quiz, "");
        ArrayList<Chapter> chapterList = qd.getChapterList(quiz.getSubject().getId());
        Map<String, Integer> dimCountMap = qd.getDimensionsWithQuestionCount(quizID);
        request.setAttribute("dimCountMap", dimCountMap);
        request.setAttribute("quiz", quiz);
        request.setAttribute("creater", sd.getManagerName(quiz.getCreated_by() + ""));
        request.setAttribute("updater", sd.getManagerName(quiz.getUpdated_by() + ""));
        request.setAttribute("subjectname", qd.getSubjectName(quiz.getSubject().getId() + ""));
        request.setAttribute("chaptername", qd.getChapterName(quiz.getChapter().getChapter_id() + ""));
        request.setAttribute("questionList", questionList);
        request.setAttribute("questionListToAdd", questionListToAdd);
        request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/view/manager/QuizDetails.jsp").forward(request, response);
    }

    private void removeQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String quizID = request.getParameter("quizID");
        String quesId = request.getParameter("quesId");
        qd.deleteQuesByID(quesId, quizID);
        request.setAttribute("txt", "Success");
//        request.getRequestDispatcher("Quizz?action=detailQuiz&quizID=" + quizID).forward(request, response);
        detailQuiz(request, response, quizID);
    }

    private void updateQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String quizID = request.getParameter("quizID");
        String name = request.getParameter("name");
        int total = Integer.parseInt(request.getParameter("total"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String chapterId = request.getParameter("chapterId");
        String status = request.getParameter("status");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = user.getId();
        Quiz quiz = qd.getQuiz("quiz_id", quizID);
        quiz.setQuiz_name(name);
        quiz.setTotal_questions(total);
        quiz.setDuration(duration);
        quiz.getChapter().setChapter_id(Integer.parseInt(chapterId));
        quiz.setIs_active(Integer.parseInt(status));
        quiz.setUpdated_by(userID);
        qd.updateQuiz(quiz);
//        request.getRequestDispatcher("Quizz?action=list").forward(request, response);
//        request.getRequestDispatcher("Quizz?action=detailQuiz&quizID=" + quizID).forward(request, response);
        request.setAttribute("txt", "Success");
        detailQuiz(request, response, quizID);

    }

    private void addQuestionToQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String quizID = request.getParameter("quizID");
        String str = request.getParameter("questionIdToAdd");
        if (str.length() != 0) {
            String[] strArray = str.split(",");
            ArrayList<Integer> listQuestionId = new ArrayList<>();
            for (String numStr : strArray) {
                listQuestionId.add(Integer.parseInt(numStr));
            }
            qd.addQuestionToQuiz(quizID, listQuestionId, 1);
        }
        request.setAttribute("txt", "Success");
//        request.getRequestDispatcher("Quizz?action=detailQuiz&quizID=" + quizID).forward(request, response);
        detailQuiz(request, response, quizID);
    }

    private ArrayList<Integer> generateRandom(Quiz quiz) {
        ArrayList<Integer> listQuestion = qd.geAllQuestionIdByChapterSubject(quiz);
        int[] listRandomNumbers = generateRandomNumbers(quiz.getTotal_questions(), 0, listQuestion.size() - 1);
        ArrayList<Integer> listQuestionId = new ArrayList<>();
        for (int i = 0; i < listRandomNumbers.length; i++) {
            listQuestionId.add(listQuestion.get(listRandomNumbers[i]));
        }
        return listQuestionId;
    }

    public int[] generateRandomNumbers(int count, int min, int max) {
        if (count > (max - min + 1)) {
            throw new IllegalArgumentException("Number of random numbers exceeds the range.");
        }
        // Tạo mảng ban đầu chứa các số từ min đến max
        int[] initialArray = new int[max - min + 1];
        for (int i = min; i <= max; i++) {
            initialArray[i - min] = i;
        }
        // Trộn lẫn thứ tự các số trong mảng
        Random random = new Random();
        for (int i = initialArray.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            int temp = initialArray[i];
            initialArray[i] = initialArray[j];
            initialArray[j] = temp;
        }
        // Chọn ? số đầu tiên và sắp xếp lại mảng
        int[] randomNumbers = Arrays.copyOf(initialArray, count);
        Arrays.sort(randomNumbers);
        return randomNumbers;
    }

    private void exportExcel(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String quizID = request.getParameter("quizID");

        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=question.xlsx");

        ArrayList<Question> questionList = qd.getQuestionListByQuizID(quizID);

        try ( XSSFWorkbook wb = new XSSFWorkbook()) {
            XSSFSheet sheet = wb.createSheet("Question");
            XSSFRow headerRow = sheet.createRow(0);

            XSSFCell headerQuestion = headerRow.createCell(0, CellType.STRING);
            headerQuestion.setCellValue("Question");
            XSSFCell headerAnswer1 = headerRow.createCell(1, CellType.STRING);
            headerAnswer1.setCellValue("Answer 1");
            XSSFCell headerAnswer2 = headerRow.createCell(2, CellType.STRING);
            headerAnswer2.setCellValue("Answer 2");
            XSSFCell headerAnswer3 = headerRow.createCell(3, CellType.STRING);
            headerAnswer3.setCellValue("Answer 3");
            XSSFCell headerEtc = headerRow.createCell(4, CellType.STRING);
            headerEtc.setCellValue("...");

            for (int i = 0; i < questionList.size(); i++) {
                XSSFRow row = sheet.createRow(i + 1);

                XSSFCell questionCell = row.createCell(0, CellType.STRING);
                questionCell.setCellValue(questionList.get(i).getQuestionContent());

                ArrayList<Answer> answerList = answerdao.getAnswer(questionList.get(i).getId());

                for (int j = 1; j < (1 + answerList.size()); j++) {
                    XSSFCell answerCell = row.createCell(j, CellType.STRING);
                    answerCell.setCellValue(answerList.get(j - 1).getAnswer_content());
                }
            }
            wb.write(response.getOutputStream());
            wb.close();
        }
    }

    private void getTemplate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=template.xlsx");

        try ( XSSFWorkbook wb = new XSSFWorkbook()) {
            XSSFSheet sheet = wb.createSheet("Question");
            XSSFRow headerRow = sheet.createRow(0);
            XSSFCell headerQuestion = headerRow.createCell(0, CellType.STRING);
            headerQuestion.setCellValue("Question");
            XSSFCell headerAnswer1 = headerRow.createCell(1, CellType.STRING);
            headerAnswer1.setCellValue("Answer 1");
            XSSFCell headerAnswer2 = headerRow.createCell(2, CellType.STRING);
            headerAnswer2.setCellValue("Answer 2");
            XSSFCell headerAnswer3 = headerRow.createCell(3, CellType.STRING);
            headerAnswer3.setCellValue("Answer 3");
            XSSFCell headerEtc = headerRow.createCell(4, CellType.STRING);
            headerEtc.setCellValue("...");

            wb.write(response.getOutputStream());
            wb.close();
        }
    }

    private void importExcel(HttpServletRequest request, HttpServletResponse response, String subjectId2) throws IOException, ServletException, SQLException {

        String quizID = request.getParameter("quizID");
        String subjectID = request.getParameter("subjectID");
        String chapterID = request.getParameter("chapterID");
        ArrayList<Integer> listQuestionId = new ArrayList<Integer>();
        Part filePart = request.getPart("excel");
        InputStream inputStream = filePart.getInputStream();
        Workbook wb = new XSSFWorkbook(inputStream);
        Sheet sheet = wb.getSheetAt(0);
        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            String question = (String) row.getCell(0).getStringCellValue();
            Question q = new Question();

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            q.setSubjectId(Integer.parseInt(subjectID));
            q.setChapterId(Integer.parseInt(chapterID));
            q.setIsActive(1);
            q.setQuestionContent(question);

            int userID = 0;
            if (user != null) {
                userID = user.getId();
            }
            q.setCreatedBy(userID);
            qd.newQuestionInQuiz(q);

            listQuestionId.add(questiondao.getQuestionId());
            for (int j = 1; j < row.getLastCellNum(); j++) {
                String answer = (String) row.getCell(j).getStringCellValue();
                answerdao.addAnswer(0, questiondao.getQuestionId(), answer);
            }
        }
        qd.addQuestionToQuiz(quizID, listQuestionId, 1);
        request.setAttribute("txt", " questions added");
        detailQuiz(request, response, quizID);
    }

    private void questionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String quizID = request.getParameter("quizID");
        int qid = Helpers.parseInt(quizID);

        HttpSession session = request.getSession();

        User u = (User) session.getAttribute("user");

        if (type != null && !type.isEmpty()) {
            switch (type) {
                case "retake":
                    qd.retakeQuiz(u.getId(), quizID);
                    break;
            }
        }

        int questionsPerPage = 1;
        Quiz quiz = qd.getQuiz("quiz_id", quizID);
        ArrayList<Question> questionList = qd.getQuestionsForQuiz(qid);

        request.setAttribute("quiz", quiz);
        request.setAttribute("questionsPerPage", questionsPerPage);
        request.setAttribute("type", type);
        paging(request, response, questionList);
        request.getRequestDispatcher("/view/trainee/QuizHandle.jsp").forward(request, response);
    }

    private void paging(HttpServletRequest request, HttpServletResponse response, ArrayList<Question> arr) throws IOException, ServletException {
        int numOfQuestion = arr.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfQuestion / 1;
        if (numOfQuestion % 1 != 0) {
            maxPage++;
        }
        String spage = request.getParameter("page");
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }
        int start, end;
        start = (page - 1) * 1;
        end = Math.min(page * 1, numOfQuestion);
        ArrayList<Question> listByPage = qd.getQuestionByPage(arr, start, end);
        if (page >= 3) {
            if (page + 2 < maxPage) {
                endPage = page + 2;
            } else {
                endPage = maxPage;
            }
            if (maxPage >= 5) {
                startPage = endPage - 4;
            } else {
                startPage = page - 2;
            }
        } else {
            if (maxPage >= 5) {
                endPage = 5;
            } else {
                endPage = maxPage;
            }
        }
        if (listByPage.size() == 0) {
            maxPage = 1;
        }
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("questionList", listByPage);
    }

    private void saveToSession(String params, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            System.out.println("params: " + params);
            session.setAttribute("selectedAnswers", params);
        } catch (Exception e) {
            System.out.println("error: saveTiSession");
        }
    }

    private void submitQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách checkbox đã chọn từ sessionStorage
        int quizID = Integer.parseInt(request.getParameter("quizID"));
        int totalQuestions = Integer.parseInt(request.getParameter("total"));
        saveToSession(request.getParameter("storeAnswer"), request);
        // Lấy thông tin câu trả lời của người dùng từ request
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = user.getId();

        String[] selectedCheckbox = getSelectedCheckbox(request);
        session.setAttribute("selectedAnswers", String.join(",", selectedCheckbox));

        QuizResult result = new QuizResult();
        result.setUser_id(userID);
        result.setQuiz_id(quizID);
        result.setScore(0);
        qd.saveQuizResult(result);
        int resultID = qd.getLastResultId();

        Map<Integer, ArrayList<Integer>> questionAnswersMap = new HashMap<>();
        for (String checkbox : selectedCheckbox) {
            String[] values = checkbox.split("_");
            if (values.length == 2) {
                int questionId = Integer.parseInt(values[0]);
                int answerId = Integer.parseInt(values[1]);
                // Kiểm tra xem questionId đã tồn tại trong map chưa
                if (!questionAnswersMap.containsKey(questionId)) {
                    questionAnswersMap.put(questionId, new ArrayList<>());
                }
                // Thêm answerId vào danh sách cho questionId tương ứng
                questionAnswersMap.get(questionId).add(answerId);
            }
        }
        // Lưu danh sách câu trả lời cho từng câu hỏi
        for (Map.Entry<Integer, ArrayList<Integer>> entry : questionAnswersMap.entrySet()) {
            int questionID = entry.getKey();
            ArrayList<Integer> answerIDs = entry.getValue();
            qd.saveUserAnswers(resultID, questionID, answerIDs);
        }

        qd.updateResultScore(userID, quizID, resultID);

//        request.getRequestDispatcher("/view/trainee/QuizResult.jsp").forward(request, response);
        response.sendRedirect(request.getContextPath() + "/Quizz?action=questionList&quizID=" + quizID);
    }

    private String[] getSelectedCheckbox(HttpServletRequest request) {
        HttpSession session = request.getSession();

        String selectedAnswers = (String) session.getAttribute("selectedAnswers");
        if (selectedAnswers != null && !selectedAnswers.isEmpty()) {
            String[] selectedAnswersArray = selectedAnswers.split(",");
            for (String answer : selectedAnswersArray) {
                System.out.println(answer); 
            }
            return selectedAnswersArray;
        }
        return new String[0];
    }

    private int calculateScore(String[] selectedCheckbox, int totalQuestions) {
        int correctAnswers = 0;
        Map<Integer, ArrayList<Integer>> questionAnswersMap = new HashMap<>();

        for (String checkbox : selectedCheckbox) {
            String[] values = checkbox.split("_");
            if (values.length == 2) {
                int questionId = Integer.parseInt(values[0]);
                int answerId = Integer.parseInt(values[1]);
                // Kiểm tra xem questionId đã tồn tại trong map chưa
                if (!questionAnswersMap.containsKey(questionId)) {
                    questionAnswersMap.put(questionId, new ArrayList<>());
                }
                // Thêm answerId vào danh sách cho questionId tương ứng
                questionAnswersMap.get(questionId).add(answerId);
                // Kiểm tra nếu answerId có is_correct = 1 trong bảng answer
                if (qd.isAnswerCorrect(answerId)) {
                    correctAnswers++;
                }
            }
        }
        if (totalQuestions > 0) {
            // Tính phần trăm câu trả lời đúng và làm tròn thành số nguyên
            return Math.round(((float) correctAnswers / totalQuestions) * 100);
        } else {
            return 0;
        }
    }

    private void searchQues(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String searchContent = request.getParameter("searchContent");
        String quizID = request.getParameter("quizID");
        Quiz quiz = qd.getQuiz("quiz_id", quizID);
        ArrayList<Question> questionListToAdd = qd.getQuestionToAdd(quiz, searchContent);
        request.setAttribute("quiz", quiz);
        request.setAttribute("searchContent", searchContent);
        request.setAttribute("questionListToAdd", questionListToAdd);

        ArrayList<Question> questionList = qd.getQuestionsByQuiz(quizID);
        ArrayList<Chapter> chapterList = qd.getChapterList(quiz.getSubject().getId());
        Map<String, Integer> dimCountMap = qd.getDimensionsWithQuestionCount(quizID);
        request.setAttribute("dimCountMap", dimCountMap);
        request.setAttribute("quiz", quiz);
        request.setAttribute("creater", sd.getManagerName(quiz.getCreated_by() + ""));
        request.setAttribute("updater", sd.getManagerName(quiz.getUpdated_by() + ""));
        request.setAttribute("subjectname", qd.getSubjectName(quiz.getSubject().getId() + ""));
        request.setAttribute("chaptername", qd.getChapterName(quiz.getChapter().getChapter_id() + ""));
        request.setAttribute("questionList", questionList);
        request.setAttribute("questionListToAdd", questionListToAdd);
        request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/view/manager/QuizDetails.jsp").forward(request, response);
    }
}
