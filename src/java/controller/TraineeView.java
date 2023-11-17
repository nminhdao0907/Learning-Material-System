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
import java.util.List;
import model.StudentClass;

import model.User;
import model.Classs;

/**
 *
 * @author ADMIN
 */
public class TraineeView extends HttpServlet {

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
            out.println("<title>Servlet TraineeView</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TraineeView at " + request.getContextPath() + "</h1>");
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
        int displayoder = Integer.parseInt(request.getParameter("displayoder"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        StudentClassDAO sc = new StudentClassDAO();
        List<Classs> c = new ArrayList<>();
        StudentClass clas = sc.getOne(sid);
        request.setAttribute("lst", clas);
        c = sc.getclasses();
        
        request.setAttribute("lstclass", c);
        request.setAttribute("cid", request.getParameter("cid"));

        request.getRequestDispatcher("view/trainee/TraineeDetail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        int cid = Integer.parseInt(request.getParameter("cId"));
        if ("updateliststudent".equals(formType)) {
            StudentClassDAO sc = new StudentClassDAO();
            int cidc = Integer.parseInt(request.getParameter("classid"));
            String name = request.getParameter("name");
            int displayoderr = Integer.parseInt(request.getParameter("displayorderr"));
            int status = Integer.parseInt(request.getParameter("status"));

            StudentClass s = sc.getOne(displayoderr);
            User u = new User();
            Classs c = new Classs();
            c.setId(cidc);
            u.setFullname(name);
            s.setClassid(c);
            s.setIs_active(status);
            s.setDisplay_order(displayoderr);
            sc.update(s, cid);

            session.setAttribute("txt", "Success");

            response.sendRedirect("TraineeDetail?cid=" + cid);
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
