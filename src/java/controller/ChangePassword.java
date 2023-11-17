/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.UserProfile.hash;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        UserDAO profiledao = new UserDAO();
        User lstUserProfile = profiledao.getOne(user.getId());
        request.setAttribute("lstUserProfile", lstUserProfile);
        request.getRequestDispatcher("view/user/change-password.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        UserDAO profiledao = new UserDAO();

        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String reNewPass = request.getParameter("reNewPass");
        if (oldPass == null || newPass.trim().isEmpty()
                || reNewPass == null) {

            session.setAttribute("msg", "Please fill in all fields.");
            response.sendRedirect("ChangePassword");
        }
        try {
            if (!hash(oldPass).equals(user.getPassword())) {
                response.sendRedirect("ChangePassword");
                session.setAttribute("msg", "Old Password is wrong");
            } else {
                if (hash(newPass).equals(hash(oldPass))) {
                    response.sendRedirect("ChangePassword");
                    session.setAttribute("msg", "New and old is equal enter again");
                } else {
                    if (!newPass.equals(reNewPass)) {
                        response.sendRedirect("ChangePassword");
                        session.setAttribute("msg", "New and renew is not equal enter again");
                    } else {
                        boolean isChangePasswordSucces = profiledao.changePassword(user.getId(), hash(newPass));
                        user.setPassword(newPass);
                        session.setAttribute("usercur", user);
                        if (isChangePasswordSucces) {

                            request.setAttribute("txt", "Success");
                            request.getRequestDispatcher("/view/authen/login.jsp").forward(request, response);
                            session.setAttribute("msg", "Change password Success");
                        } else {
                            response.sendRedirect("ChangePassword");
                            session.setAttribute("msg", "Change password Fail");
                        }
                    }
                }

            }

        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserProfile.class.getName()).log(Level.SEVERE, null, ex);
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
