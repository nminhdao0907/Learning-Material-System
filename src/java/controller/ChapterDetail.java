/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.GeneralDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Chapter;
import model.Dimension;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class ChapterDetail extends HttpServlet {

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
            out.println("<title>Servlet ChapterDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChapterDetail at " + request.getContextPath() + "</h1>");
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
        String idStr = request.getParameter("id");
        int ID = Integer.parseInt(idStr);
        GeneralDAO gd = new GeneralDAO();
        SubjectDAO sd = new SubjectDAO();
        List<Subject> s = new ArrayList<>();
        s = sd.getSubjectList();
        request.setAttribute("listsubject", s);
        Chapter chap = gd.getOneChap(ID);
        List<Chapter> c = new ArrayList<>();
        c = gd.getdisplayorder();
        request.setAttribute("lstdisplayoder", c);
        request.setAttribute("c", chap);
        request.getRequestDispatcher("view/manager/chapter-detail.jsp").forward(request, response);
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

        String formType = request.getParameter("formType");

        if ("UpdateChapter".equals(formType)) {

            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            int status = Integer.parseInt(request.getParameter("status"));
            int sid = Integer.parseInt(request.getParameter("sid"));
            String descrip = request.getParameter("description");
            int displayorder = Integer.parseInt(request.getParameter("displayoder"));
            GeneralDAO gd = new GeneralDAO();

            Chapter c = gd.getOneChap(id);

            if (sid != 0) {
                c.setDescription(descrip);
                c.setTitle(title);
                c.setIs_active(status);
                c.setSubject_id(sid);
                c.setDisplay_order(displayorder);
                gd.updateChap(c, id);

                HttpSession session = request.getSession();
                session.setAttribute("txt", "Success");
                response.sendRedirect("General");
            } else {
                // If sid is 0, don't update, set a message or perform an action accordingly
                HttpSession session = request.getSession();
                session.setAttribute("txt", "Please choose your subject to update");
                response.sendRedirect("General"); // Redirect or perform an alternative action
            }

        }
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
