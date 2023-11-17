/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnswerDAO;
import dao.QuestionDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.Answer;
import model.Chapter;
import model.Dimension;
import model.Question;
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

/**
 *
 * @author bao chau
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class Questions extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Question</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Question at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                questionList(request, response);
                break;
            case "changeStatus":
                changeStatus(request, response);
                break;
            case "add":
                addQuestion(request, response);
                break;
            case "details":
                detailsScreen(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "addAnswer":
                addAnswer(request, response);
                break;
            case "deleteAnswer":
                deleteAnswer(request, response);
                break;
            case "export":
                exportExcel(request, response);
                break;
            case "addDimension":
                addDimension(request, response);
                break;
            case "deleteDimension":
                deleteDimension(request, response);
                break;
            case "getTemplate":
                getTemplate(request, response);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subjectId2 = request.getParameter("subjectId2");

        if ("".equals(subjectId2)) {
            request.setAttribute("alert", "You do not manage any subjects");
            request.getRequestDispatcher("/view/manager/QuestionList.jsp").forward(request, response);
        } else {
            importExcel(request, response, subjectId2);
        }

    }
    QuestionDAO questiondao = new QuestionDAO();
    SubjectDAO subjectdao = new SubjectDAO();
    AnswerDAO answerdao = new AnswerDAO();

    private void questionList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String ssubjectId = request.getParameter("subjectId");
        String txtQuestion = request.getParameter("txtQuestion");
        String chapterId = request.getParameter("chapterId");
        String status = request.getParameter("status");
        String chapterId2;
        String txtQuestion2, status2;
        if ("0".equals(chapterId)) {
            chapterId2 = "%%";
        } else {
            chapterId2 = chapterId;
        }
        if ("''".equals(txtQuestion)) {
            txtQuestion2 = "%%";
            txtQuestion = "";
        } else {
            txtQuestion2 = "%" + txtQuestion + "%";
        }
        if ("-1".equals(status)) {
            status2 = "%%";
        } else {
            status2 = status;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        ArrayList<Subject> subjectList = subjectdao.getSubjectNameList2(userID);
        if (subjectList.isEmpty()) {
            request.setAttribute("alert", "You do not manage any subjects");
        } else {
            int subjectId;
            if (Integer.parseInt(ssubjectId) != 0) {
                subjectId = Integer.parseInt(ssubjectId);
            } else {
                subjectId = subjectList.get(0).getId();
            }
            ArrayList<Question> questionList = questiondao.getQuestionList(subjectId, txtQuestion2, chapterId2, status2);
            ArrayList<Chapter> chapterlist = questiondao.getChapterList(subjectId);
            ArrayList<Dimension> dimensionlist = questiondao.getDimensionList(subjectId);
            if (questionList.isEmpty()) {
                request.setAttribute("alert", "There no question");
            }
            request.setAttribute("status", status);
            request.setAttribute("txtQuestion", txtQuestion);
            request.setAttribute("chapterId", chapterId);
            request.setAttribute("subjectId", subjectId);
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("chapterList", chapterlist);
            request.setAttribute("dimensionList", dimensionlist);
            paging(request, response, questionList);
        }

        request.getRequestDispatcher("/view/manager/QuestionList.jsp").forward(request, response);
    }

    private void paging(HttpServletRequest request, HttpServletResponse response, ArrayList<Question> arr) throws IOException, ServletException {
        int numOfQuestion = arr.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfQuestion / 10;
        if (numOfQuestion % 10 != 0) {
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
        end = Math.min(page * 10, numOfQuestion);
        ArrayList<Question> listByPage = questiondao.getQuestionByPage(arr, start, end);
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
        sort(request, response, listByPage);
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("questionList", listByPage);

    }

    private void sort(HttpServletRequest request, HttpServletResponse response, ArrayList<Question> arr) throws IOException, ServletException {
        String sortElement = request.getParameter("sortElement");
        String qasc = "0", casc = "0", dasc = "0";
        if (!sortElement.equals("none")) {
            switch (sortElement) {
                case "question":
                    qasc = request.getParameter("qasc");
                    sortByComponent(arr, "question", qasc);
                    if ("0".equals(qasc) || "-1".equals(qasc)) {
                        qasc = "1";
                    } else {
                        qasc = "-1";
                    }
                    break;
                case "chapter":
                    casc = request.getParameter("casc");
                    sortByComponent(arr, "chapter", casc);
                    if ("0".equals(casc) || "-1".equals(casc)) {
                        casc = "1";
                    } else {
                        casc = "-1";
                    }
                    break;
            }
        }
        request.setAttribute("qasc", qasc);
        request.setAttribute("casc", casc);

    }

    public ArrayList<Question> sortByComponent(ArrayList<Question> list, String type, String asc) {

        if ("-1".equals(asc) || "0".equals(asc)) {
            Collections.sort(list, new Comparator<Question>() {
                @Override
                public int compare(Question o1, Question o2) {
                    if ("question".equals(type)) {
                        return o1.getQuestionContent().compareTo(o2.getQuestionContent());
                    } else {
                        return o1.getChapterName().compareTo(o2.getChapterName());
                    }
                }
            });
        } else {
            Collections.sort(list, new Comparator<Question>() {
                @Override
                public int compare(Question o1, Question o2) {
                    if ("question".equals(type)) {
                        return o2.getQuestionContent().compareTo(o1.getQuestionContent());
                    } else {
                        return o2.getChapterName().compareTo(o1.getChapterName());
                    }
                }
            });
        }

        return list;
    }

    private void changeStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        int isActive = Integer.parseInt(request.getParameter("isActive"));
        if (isActive == 1) {
            questiondao.updateStatus(id, 0);
        } else {
            questiondao.updateStatus(id, 1);
        }
        request.setAttribute("txt", "Success");
        questionList(request, response);
    }

    private void addQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String subjectId2 = request.getParameter("subjectId2");
        if ("".equals(subjectId2)) {
            request.setAttribute("alert", "You do not manage any subjects");
            request.getRequestDispatcher("/view/manager/QuestionList.jsp").forward(request, response);
        } else {

            String newChapterId = request.getParameter("newChapterId");
            String newStatus = request.getParameter("newStatus");
            String newQuesion = request.getParameter("newQuestion");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            Question question = new Question();
            question.setSubjectId(Integer.parseInt(subjectId2));
            question.setChapterId(Integer.parseInt(newChapterId));
            question.setIsActive(Integer.parseInt(newStatus));
            question.setQuestionContent(newQuesion);

            int userID = 0;
            if (user != null) {
                userID = user.getId();
            }
            question.setCreatedBy(userID);
            questiondao.newQuestion(question);
            request.setAttribute("txt", "Success");
            request.getRequestDispatcher("question?action=list&subjectId=" + subjectId2 + "&chapterId=0&txtQuestion=&status=-1&sortElement=none").forward(request, response);
        }
    }

    private void detailsScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String questionId = request.getParameter("qid");
        Question question = questiondao.getQuestion(Integer.parseInt(questionId));

        ArrayList<Chapter> chapterList = questiondao.getChapterList(question.getSubjectId());
        ArrayList<Dimension> dimensionList = questiondao.getDimensionList(question.getSubjectId());
        ArrayList<Answer> answerList = answerdao.getAnswer(Integer.parseInt(questionId));
        ArrayList<Dimension> questionDimensionList = questiondao.getQuestiondimensionList(Integer.parseInt(questionId));

        request.setAttribute("questionDimension", questionDimensionList);
        request.setAttribute("answerList", answerList);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("dimensionList", dimensionList);
        request.setAttribute("question", question);
        request.getRequestDispatcher("/view/manager/QuestionDetails.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String questionId = request.getParameter("qid");
        String chapterId = request.getParameter("chapterId");
        String status = request.getParameter("status");
        String questionContents = request.getParameter("txtQues");
        String explanationContents = request.getParameter("txtExp");
        String[] answerId = request.getParameterValues("isCorrect");
        String[] newanswer = request.getParameterValues("newanswer");

        Question question = questiondao.getQuestion(Integer.parseInt(questionId));
        question.setChapterId(Integer.parseInt(chapterId));
        question.setIsActive(Integer.parseInt(status));
        question.setQuestionContent(questionContents);
        question.setExplanation(explanationContents);
        if (newanswer != null) {
            for (String s : newanswer) {
                if (s.length() != 0) {
                    answerdao.addAnswer(0, Integer.parseInt(questionId), s);
                }
            }
        }
        for (Answer i : answerdao.getAnswer(Integer.parseInt(questionId))) {
            answerdao.updateIsCorrect(i.getId(), 0, Integer.parseInt(questionId));
        }
        if (answerId != null) {
            for (String i : answerId) {
                for (Answer j : answerdao.getAnswer(Integer.parseInt(questionId))) {
                    if (Integer.parseInt(i) == j.getId()) {
                        answerdao.updateIsCorrect(j.getId(), 1, Integer.parseInt(questionId));
                    }
                }
            }
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        question.setUpdatedBy(userID);
        questiondao.updateGeneral(question);
        questiondao.updateDetails(question);
        request.setAttribute("txt", "Success");
        request.getRequestDispatcher("question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none").forward(request, response);
    }

    private void addAnswer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String questionId = request.getParameter("qid2");
        String newAnswer = request.getParameter("newAnswer");
        String isCorrect = request.getParameter("isCorrect");

        Question question = questiondao.getQuestion(Integer.parseInt(questionId));
        answerdao.addAnswer(Integer.parseInt(isCorrect), Integer.parseInt(questionId), newAnswer);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        question.setUpdatedBy(userID);
        questiondao.updateDetails(question);
        request.setAttribute("txt", "Answer added");
        detailsScreen(request, response);
    }

    private void deleteAnswer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String questionId = request.getParameter("qid");
        String answerId = request.getParameter("answerId");
        Question question = questiondao.getQuestion(Integer.parseInt(questionId));
        answerdao.deleteAnswer(Integer.parseInt(questionId), Integer.parseInt(answerId));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        question.setUpdatedBy(userID);
        questiondao.updateDetails(question);
        request.setAttribute("txt", "Answer deleted");
        detailsScreen(request, response);
    }

    private void exportExcel(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String subjectId2 = request.getParameter("subjectId2");

        if ("".equals(subjectId2)) {
            request.setAttribute("alert", "You do not manage any subjects");
            request.getRequestDispatcher("/view/manager/QuestionList.jsp").forward(request, response);
        } else {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=question.xlsx");
            int subjectId = Integer.parseInt(subjectId2);
            String chapterId = request.getParameter("exportChapterId");

            if ("0".equals(chapterId)) {
                chapterId = "%%";
            }

            ArrayList<Question> questionList = questiondao.getQuestionList(subjectId, "%%", chapterId, "%%");

            try ( XSSFWorkbook wb = new XSSFWorkbook()) {
                XSSFSheet sheet = wb.createSheet("Question");
                XSSFRow headerRow = sheet.createRow(0);

                XSSFCell headerChapter = headerRow.createCell(0, CellType.STRING);
                headerChapter.setCellValue("Chapter");
                XSSFCell headerDimension = headerRow.createCell(1, CellType.STRING);
                headerDimension.setCellValue("Dimension");
                XSSFCell headerExplanation = headerRow.createCell(2, CellType.STRING);
                headerExplanation.setCellValue("Explanation");
                XSSFCell headerQuestion = headerRow.createCell(3, CellType.STRING);
                headerQuestion.setCellValue("Question");
                XSSFCell headerAnswer1 = headerRow.createCell(4, CellType.STRING);
                headerAnswer1.setCellValue("Answer 1");
                XSSFCell headerAnswer2 = headerRow.createCell(5, CellType.STRING);
                headerAnswer2.setCellValue("Answer 2");
                XSSFCell headerAnswer3 = headerRow.createCell(6, CellType.STRING);
                headerAnswer3.setCellValue("Answer 3");
                XSSFCell headerEtc = headerRow.createCell(7, CellType.STRING);
                headerEtc.setCellValue("...");

                for (int i = 0; i < questionList.size(); i++) {
                    XSSFRow row = sheet.createRow(i + 1);

                    XSSFCell chapterCell = row.createCell(0, CellType.STRING);
                    chapterCell.setCellValue(questionList.get(i).getChapterName());

                    XSSFCell dimensionCell = row.createCell(1, CellType.STRING);
                    dimensionCell.setCellValue("a" + "; " + "sd");

                    XSSFCell explanationCell = row.createCell(2, CellType.STRING);
                    explanationCell.setCellValue(questionList.get(i).getExplanation());

                    XSSFCell questionCell = row.createCell(3, CellType.STRING);
                    questionCell.setCellValue(questionList.get(i).getQuestionContent());

                    ArrayList<Answer> answerList = answerdao.getAnswer(questionList.get(i).getId());

                    for (int j = 4; j < (4 + answerList.size()); j++) {
                        XSSFCell answerCell = row.createCell(j, CellType.STRING);
                        answerCell.setCellValue(answerList.get(j - 4).getAnswer_content());
                    }
                }
                wb.write(response.getOutputStream());
                wb.close();
            }
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
            XSSFCell headerExplanation = headerRow.createCell(1, CellType.STRING);
            headerExplanation.setCellValue("Explanation");
            XSSFCell headerAnswer1 = headerRow.createCell(2, CellType.STRING);
            headerAnswer1.setCellValue("Answer 1");
            XSSFCell headerAnswer2 = headerRow.createCell(3, CellType.STRING);
            headerAnswer2.setCellValue("Answer 2");
            XSSFCell headerAnswer3 = headerRow.createCell(4, CellType.STRING);
            headerAnswer3.setCellValue("Answer 3");
            XSSFCell headerEtc = headerRow.createCell(5, CellType.STRING);
            headerEtc.setCellValue("etc...");

            wb.write(response.getOutputStream());
            wb.close();
        }
    }

    private void importExcel(HttpServletRequest request, HttpServletResponse response, String subjectId2) throws IOException, ServletException {
        String newChapterId = request.getParameter("newChapterId");

        int count = 0;
        Part filePart = request.getPart("excel");
        InputStream inputStream = filePart.getInputStream();
        Workbook wb = new XSSFWorkbook(inputStream);
        Sheet sheet = wb.getSheetAt(0);

        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            String question = (String) row.getCell(0).getStringCellValue();
            String explanation = (String) row.getCell(1).getStringCellValue();
            Question q = new Question();

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            q.setSubjectId(Integer.parseInt(subjectId2));
            q.setChapterId(Integer.parseInt(newChapterId));
            q.setExplanation(explanation);
            q.setIsActive(0);
            q.setQuestionContent(question);
            System.out.println(q);
            int userID = 0;
            if (user != null) {
                userID = user.getId();
            }
            q.setCreatedBy(userID);

            questiondao.newQuestion(q);
            q.setId(questiondao.getLastID());
            questiondao.addExplanation(q);
            for (int j = 2; j < row.getLastCellNum(); j++) {
                String answer;
                if (row.getCell(j).getCellType() == CellType.NUMERIC) {
                    answer = "" + (int) row.getCell(j).getNumericCellValue();
                } else {
                    answer = (String) row.getCell(j).getStringCellValue();
                }
                answerdao.addAnswer(0, questiondao.getQuestionId(), answer);
                q.setUpdatedBy(userID);
                questiondao.updateDetails(q);
            }
            count++;
        }
        response.sendRedirect("question?action=list&subjectId=0&chapterId=0&txtQuestion=&status=-1&sortElement=none");

    }

    private void addDimension(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String dimensionID = request.getParameter("newDimensionId");
        String questionID = request.getParameter("qid");

        if (questiondao.checkQuestionDimension(Integer.parseInt(questionID), Integer.parseInt(dimensionID)) == false) {
            questiondao.insertQuestionDimension(Integer.parseInt(questionID), Integer.parseInt(dimensionID));

        }
        request.setAttribute("txt", "Success");
        detailsScreen(request, response);
    }

    private void deleteDimension(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String dimensionID = request.getParameter("dimensionId");
        String questionID = request.getParameter("qid");
        questiondao.deleteDimension(Integer.parseInt(questionID), Integer.parseInt(dimensionID));
        request.setAttribute("txt", "Success");
        detailsScreen(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
