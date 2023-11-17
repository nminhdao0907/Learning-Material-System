/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.StudentClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Classs;
import model.Setting;
import model.User;

/**
 *
 * @author bao chau
 */
public class MyClasses extends HttpServlet {

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
            case "getClass":
                getClass(request, response);
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
    StudentClassDAO d = new StudentClassDAO();

    protected void getClass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String semesterID = request.getParameter("semesterID");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        ArrayList<Classs> classList = new ArrayList<>();
        if (semesterID == null || "0".equals(semesterID)) {
            classList = d.getMyClass(userID);
        } else {
            classList = d.getClassBySemester(userID, Integer.parseInt(semesterID));
              
        }
        request.setAttribute("selectedSemester", semesterID);  
        ArrayList<Setting> semesterList = d.getMySemesterList(userID);
        if(classList.isEmpty()){
            request.setAttribute("txt", "1");
        }else{
            request.setAttribute("txt", "0");
        }
        request.setAttribute("classList", classList);
        request.setAttribute("semesterList", semesterList);
        request.getRequestDispatcher("/view/trainee/MyClasses.jsp").forward(request, response);
    }

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
