/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;

import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;
import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserProfile", urlPatterns = {"/UserProfile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserProfile extends HttpServlet {

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
            out.println("<title>Servlet UserProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfile at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("view/user/user-profile.jsp").forward(request, response);
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
        boolean redirectToUserProfile = false;
        String formType = request.getParameter("formType");
        if ("personalDetails".equals(formType)) {
            User lstUserProfile = profiledao.getOne(user.getId());
            request.setAttribute("lstUserProfile", lstUserProfile);
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone_number = request.getParameter("phone_number");
            if (fullname == null || fullname.trim().isEmpty()
                    || email == null || email.trim().isEmpty()
                    || phone_number == null) {

                session.setAttribute("msg1", "Please fill in all fields.");
                redirectToUserProfile = true;
            } else if (!phone_number.matches("^0[0-9\\-\\+]{8,14}$")) {
                redirectToUserProfile = true;
                session.setAttribute("msg1", "Invalid phone number format. Phone numbers must start with '0' and contain 9 to 15 digits.");
            } else {

                session.setAttribute("msg1", "Change information Success");

                profiledao.update(fullname, email, phone_number, user.getId());
                redirectToUserProfile = true;
            }
        }
        if ("uploadAvatar".equals(formType)) {
            String uploadDirectory = request.getServletContext().getRealPath("view");
            uploadDirectory = uploadDirectory + File.separator + "img_user";
            Part filePart = request.getPart("avatar");
            String image = getFileName(filePart);

            if (!image.equals("")) {

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HHmmyyyyMMdd");
                LocalDateTime now = LocalDateTime.now();
                String timenow = dtf.format(now);

                String filePath = uploadDirectory + File.separator + timenow + ".png";
                File file = new File(filePath);

                OutputStream out = null;
                InputStream fileContent = null;
//                final PrintWriter writer = response.getWriter();
                redirectToUserProfile = true;
                try {
                    out = new FileOutputStream(file);
                    fileContent = filePart.getInputStream();

                    int read;
                    final byte[] bytes = new byte[1024];

                    while ((read = fileContent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    String avatarFileName = timenow + ".png";
                    profiledao.saveAvatar(user.getId(), avatarFileName);
                    System.out.println(avatarFileName);

                    session.setAttribute("userAvatar", avatarFileName);
//                    request.getRequestDispatcher("ProductServlet?type=" + type).forward(request, response);
                    System.out.println("Avatar file name in session: " + avatarFileName);
                } catch (FileNotFoundException fne) {
                    System.out.println(fne.getMessage());
                } finally {
                    if (out != null) {
                        out.close();
                    }
                    if (fileContent != null) {
                        fileContent.close();
                    }
//                    if (writer != null) {
//                        writer.close();
//                    }
                }
            } else {
//                request.getRequestDispatcher("ProductServlet?type=" + type).forward(request, response);
//                response.sendRedirect("UserProfile");
            }
        }

//        if (redirectToUserProfile) {
//            System.out.println("testesst");
        response.sendRedirect("UserProfile");
//        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    public static String hash(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        return DatatypeConverter.printHexBinary(digest).toUpperCase();
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
