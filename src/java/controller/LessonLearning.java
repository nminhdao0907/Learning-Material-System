/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LessonLearningDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import model.Lesson;
import model.User;

/**
 *
 * @author bao chau
 */
@WebServlet(name = "LessonLearning", urlPatterns = {"/lessonlearning"})
public class LessonLearning extends HttpServlet {

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
            out.println("<title>Servlet LessonLearning</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonLearning at " + request.getContextPath() + "</h1>");
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
            case "getLearningScreen":
                getLearningScreen(request, response);
                break;
            case "changeLesson":
                changeLesson(request, response);
                break;
            case "dowload":
                dowload(request, response);
                break;

        }
    }
    SubjectDAO subjectdao = new SubjectDAO();
    LessonLearningDAO lessondao = new LessonLearningDAO();

    protected void getLearningScreen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String classID = request.getParameter("classID");
        String subjectID = request.getParameter("subjectID");
        ArrayList<Lesson> lessonList = lessondao.getLessonList(Integer.parseInt(subjectID));
        Lesson lesson;

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }

        if (lessondao.getLearingHistory(userID, Integer.parseInt(classID)) != 0) {
            lesson = lessondao.getLesson(lessondao.getLearingHistory(userID, Integer.parseInt(classID)));
            request.setAttribute("selectedLesson", lessondao.getLearingHistory(userID, Integer.parseInt(classID)));

        } else {
            lesson = lessonList.get(0);
            lessondao.addLearningHistory(userID, lesson.getLesson_id(), Integer.parseInt(classID));
            request.setAttribute("selectedLesson", lessonList.get(0).getLesson_id());
        }
        switch (lesson.getLesson_type()) {
            case 1:
                request.setAttribute("type", 1);
                break;
            case 2:
                if (lessondao.checkResultExist(userID, lesson.getQuiz_id()) == true) {
                    request.setAttribute("checkAttemp", 1);
                    request.setAttribute("quizResult", lessondao.getQuizResult(userID, lesson.getQuiz_id()));
                } else {
                    request.setAttribute("checkAttemp", 0);
                }
                request.setAttribute("type", 2);
                break;
            default:
                request.setAttribute("type", 3);
                break;
        }
        request.setAttribute("quiz", lessondao.getQuiz(lesson.getQuiz_id()));
        request.setAttribute("classID", classID);
        request.setAttribute("subjectID", subjectID);
        request.setAttribute("chapterName", lessondao.getChapterName(lesson.getChapter_id()));
        request.setAttribute("lesson", lesson);
        request.setAttribute("className", lessondao.getClassName(Integer.parseInt(classID)));
        request.setAttribute("lessonList", lessonList);
        request.getRequestDispatcher("/view/trainee/LessonLearning.jsp").forward(request, response);
    }

    protected void changeLesson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String classID = request.getParameter("classID");
        String subjectID = request.getParameter("subjectID");
        String newLessonID = request.getParameter("lessonId");
        ArrayList<Lesson> lessonList = lessondao.getLessonList(Integer.parseInt(subjectID));
        Lesson lesson = lessondao.getLesson(Integer.parseInt(newLessonID));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }

        lessondao.updateLearningHistory(userID, Integer.parseInt(newLessonID), Integer.parseInt(classID));

        switch (lesson.getLesson_type()) {
            case 1:
                request.setAttribute("type", 1);
                break;
            case 2:
                if (lessondao.checkResultExist(userID, lesson.getQuiz_id()) == true) {
                    request.setAttribute("checkAttemp", 1);
                    request.setAttribute("quizResult", lessondao.getQuizResult(userID, lesson.getQuiz_id()));
                } else {
                    request.setAttribute("checkAttemp", 0);
                }
                request.setAttribute("type", 2);
                break;
            default:
                request.setAttribute("type", 3);
                break;
        }
        request.setAttribute("quiz", lessondao.getQuiz(lesson.getQuiz_id()));
        request.setAttribute("classID", classID);
        request.setAttribute("subjectID", subjectID);
        request.setAttribute("selectedLesson", newLessonID);
        request.setAttribute("chapterName", lessondao.getChapterName(lesson.getChapter_id()));
        request.setAttribute("lesson", lesson);
        request.setAttribute("className", lessondao.getClassName(Integer.parseInt(classID)));
        request.setAttribute("lessonList", lessonList);
        request.getRequestDispatcher("/view/trainee/LessonLearning.jsp").forward(request, response);
    }
    public int BUFFER_SIZE = 1024 * 1000;

    private void dowload(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String lessonID = request.getParameter("lessonId");
        String classID = request.getParameter("classID");
        String subjectID = request.getParameter("subjectID ");

        String filename = lessondao.getFilename(Integer.parseInt(lessonID));
        if (filename != null) {
            String path = getServletContext().getRealPath("") + "AsmSubmit" + File.separator + filename;
            File file = new File(path);
            OutputStream os = null;
            FileInputStream fis = null;
            String[] filesplit = filename.split("\\.");
            response.setHeader("Content-Disposition", String.format("attachment;filename=" + filesplit[0] + "." + filesplit[1]));
            response.setContentType("application/octet-stream");
            if (file.exists()) {
                os = response.getOutputStream();
                fis = new FileInputStream(file);
                byte[] bf = new byte[BUFFER_SIZE];
                int byteRead = 1;
                while ((byteRead = fis.read(bf)) != -1) {
                    os.write(bf, 0, byteRead);
                }
            } else {
                request.setAttribute("err", "System Error");
            }
        } else {
            request.setAttribute("err", "File not Exist");

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
        processRequest(request, response);
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
