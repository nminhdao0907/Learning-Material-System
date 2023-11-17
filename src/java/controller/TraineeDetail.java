/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.StudentClassDAO;
import dao.UserDAO;
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
public class TraineeDetail extends HttpServlet {

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
            out.println("<title>Servlet TraineeDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TraineeDetail at " + request.getContextPath() + "</h1>");
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
         String formType = request.getParameter("formType");
          StudentClassDAO sc = new StudentClassDAO();
          
          if ("ActiveDeactive".equals(formType)) {
            
            int displayorder = Integer.parseInt(request.getParameter("display"));
            StudentClass stuclass = sc.getOnedisplay(displayorder);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userID = 0;
            if (user != null) {
                userID = user.getId();
            }
            stuclass.setUpdated_by(userID );
              System.out.println(stuclass);
            if (stuclass.getIs_active() == 1) {
                stuclass.setIs_active(0);
                sc.activeAndDeactive(stuclass);
            } else {
                stuclass.setIs_active(1);
                sc.activeAndDeactive(stuclass);
            }
            request.setAttribute("txt", "Success");
         
        }
      if ("DeleteTrainee".equals(formType)) {
            int sid = Integer.parseInt(request.getParameter("sid"));
           
            sc.delete(sid);
            HttpSession session = request.getSession();
            session.setAttribute("txt", "Success");
        }  
      
      List<model.Classs> c = new ArrayList<>();
           c = sc.getclasses();
        
        request.setAttribute("lstclass", c);
        request.setAttribute("lstStudent", new UserDAO().filterRole("4"));
        request.setAttribute("cid", request.getParameter("cid"));
        List<StudentClass> StudentClassPage;
        int numberProductPerPage = 4;
        String href;
        int id = Integer.parseInt(request.getParameter("cid"));
        
        List<Integer> lstPage = new ArrayList<>();
        int pageCur = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

        int studentlistsize = sc.getStudentListSize(id);
        int totalPages = studentlistsize % numberProductPerPage == 0
                ? studentlistsize / numberProductPerPage
                : studentlistsize / numberProductPerPage + 1;
     

        String TrainneeDetailHref = "TraineeDetail?";
        for (int i = 1;
                i <= totalPages;
                i++) {
            lstPage.add(i);
        }
           StudentClassPage = sc.getListStudentPerPage( numberProductPerPage, pageCur,id);
           HttpSession session = request.getSession();
        session.setAttribute("cid", id);
        request.setAttribute(
                "href", TrainneeDetailHref);
        request.setAttribute(
                "lst", StudentClassPage);
        request.setAttribute(
                "lstPage", lstPage);
        request.setAttribute(
                "pageCur", pageCur);
        request.getRequestDispatcher("view/trainee/TraineeList.jsp").forward(request, response);
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
//        processRequest(request, response);
        int cid = Integer.parseInt(request.getParameter("cid"));
        int sid = Integer.parseInt(request.getParameter("studentId"));
        StudentClassDAO scDAO = new StudentClassDAO();
        StudentClass sc = new StudentClass();
        Classs c = new Classs();
        c.setId(cid);
        User u = new User();
        u.setId(sid);
        sc.setClassid(c);
        sc.setUser(u);
        scDAO.addStudentClass(sc);
        response.sendRedirect("TraineeDetail?cid=" + cid);
        
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
