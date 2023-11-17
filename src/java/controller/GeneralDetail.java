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
import model.Dimension;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class GeneralDetail extends HttpServlet {

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
            out.println("<title>Servlet GeneralDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GeneralDetail at " + request.getContextPath() + "</h1>");
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
        Dimension dimen = gd.getOne(ID);
        List<Dimension> dc = new ArrayList<>();
        dc = gd.getType();
        request.setAttribute("listtype", dc);
        request.setAttribute("listsubject", s);
        request.setAttribute("d", dimen);
        request.getRequestDispatcher("view/manager/general-detail.jsp").forward(request, response);
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

        if ("UpdateDimension".equals(formType)) {
            GeneralDAO gd = new GeneralDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            String type = request.getParameter("type");
            String name = request.getParameter("name");
            int status = Integer.parseInt(request.getParameter("status"));
            int sid;

            sid = Integer.parseInt(request.getParameter("sid"));
            Dimension d = gd.getOne(id);
            Subject s = d.getSubject_id();
            d.setType(type);
            d.setName(name);
            d.setIs_active(status);
            s.setId(sid);
            gd.update(d, id);
            HttpSession session = request.getSession();
            session.setAttribute("txt", "Success");
            response.sendRedirect("General");
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
