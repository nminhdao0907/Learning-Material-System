/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.xml.bind.DatatypeConverter;
import model.Setting;
import model.User;

/**
 *
 * @author Admin
 */
public class Account extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "login";
        }
        switch (action) {
            case "register":
                register(request, response);
                break;
            case "verify":
                verify(request, response);
                break;
            case "login":
                login(request, response);
                break;
            case "forgot":
                forgotPassword(request, response);
                break;
            case "validateOtp":
                validateOtp(request, response);
                break;
            case "reset":
                resetPassword(request, response);
                break;
            default:
                login(request, response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserDAO userDAO = new UserDAO();
            HttpSession session = request.getSession();
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confPassword = request.getParameter("confPassword");
            String permittedDomain = userDAO.getPermittedMailDomain();
            switch (checkInput(email, permittedDomain, password, confPassword)) {
                case 5:
                    request.setAttribute("fullname", fullname);
                    request.setAttribute("email", email);
                    request.setAttribute("password", password);
                    request.setAttribute("confPassword", confPassword);
                    request.setAttribute("err", "Password must be match the Confirm Password");
                    request.getRequestDispatcher("/view/authen/register.jsp").forward(request, response);
                    break;
                case 4:
                    request.setAttribute("fullname", fullname);
                    request.setAttribute("email", email);
                    request.setAttribute("password", password);
                    request.setAttribute("confPassword", confPassword);
                    request.setAttribute("err", "Password must be at least 6 characters and contain at least 1 number");
                    request.getRequestDispatcher("/view/authen/register.jsp").forward(request, response);
                    break;
                case 3:
                    request.setAttribute("fullname", fullname);
                    request.setAttribute("email", email);
                    request.setAttribute("password", password);
                    request.setAttribute("confPassword", confPassword);
                    request.setAttribute("err", "Email is invalid! Example: abc@fpt.edu.vn");
                    request.getRequestDispatcher("/view/authen/register.jsp").forward(request, response);
                    break;
                case 2:
                    request.setAttribute("fullname", fullname);
                    request.setAttribute("email", email);
                    request.setAttribute("password", password);
                    request.setAttribute("confPassword", confPassword);
                    request.setAttribute("err", "Email already exists!");
                    request.getRequestDispatcher("/view/authen/register.jsp").forward(request, response);
                    break;
                case 1:
                    int otpvalue = Random();
                    sendMail(email, otpvalue);
                    request.setAttribute("err", "OTP code has been sent to your email!");
                    request.getRequestDispatcher("/view/authen/verifyCode.jsp").forward(request, response);
                    session.setAttribute("otp", otpvalue);
                    session.setAttribute("fullname", fullname);
                    session.setAttribute("email", email);
                    session.setAttribute("password", password);
                    break;
            }
        } catch (Exception e) {
        }
    }

    private void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fullname = (String) session.getAttribute("fullname");
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");
        int value = Integer.parseInt(request.getParameter("otp"));
        int otp = (int) session.getAttribute("otp");
        if (value == otp) {
            try {
                UserDAO userDAO = new UserDAO();
                Setting rol = new Setting();
                rol.setId(4);
                User user = User.builder().fullname(fullname).email(email).password(hash(password)).role(rol).build();
                userDAO.register(user);
                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("err", "Your account is verified. Login and enjoy with us!");
                request.getRequestDispatcher("view/authen/login.jsp").forward(request, response);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            request.setAttribute("err", "WRONG OTP. Please try again!");
            request.getRequestDispatcher("view/authen/register.jsp").forward(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if (email == null || password == null) {
            response.sendRedirect("login");
        } else {
            try {
                User checkUser = userDAO.login(email, hash(password));
//                int roleID = checkUser.getRole().getId();
                if (checkUser != null) {
                    Cookie ce = new Cookie("cemail", email);
                    Cookie cp = new Cookie("cpass", password);
                    Cookie cr = new Cookie("crem", remember);
                    if (remember != null) {
                        ce.setMaxAge(60 * 60 * 24);
                        cp.setMaxAge(60 * 60 * 24);
                        cr.setMaxAge(60 * 60 * 24);
                    } else {
                        ce.setMaxAge(0);
                        cp.setMaxAge(0);
                        cr.setMaxAge(0);
                    }
                    response.addCookie(ce);
                    response.addCookie(cp);
                    response.addCookie(cr);
                    session.setAttribute("user", checkUser);
                    session.setAttribute("isLoggedIn", true);
                    int roleID = checkUser.getRole().getId();
                    session.setAttribute("roleID", roleID);
                    switch (roleID) {
                        case 1: //Admin
                            response.sendRedirect("subject?action=list");
                            break;
                        case 2: //Subject Manager
                            response.sendRedirect("Quizz");
                            break;
                        case 3: //Trainer
                            response.sendRedirect("grades");
                            break;
                        case 4: //Trainee
//                            request.getRequestDispatcher("/view/user/index.jsp").forward(request, response);
                            response.sendRedirect("myclasses?action=getClass");
                            break;
                    }
                } else {
                    request.setAttribute("email", email);
                    request.setAttribute("password", password);
                    request.setAttribute("err", "Login Failed!");
                    request.getRequestDispatcher("/view/authen/login.jsp").forward(request, response);
                }
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void forgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        int otpvalue = 0;
        HttpSession session = request.getSession();
        if (email != null || !email.equals("")) {
            Random rand = new Random();
            otpvalue = rand.nextInt(2222222);
            String to = email;
            Properties props = new Properties();
            props.put("mail.smtp.host", "sandbox.smtp.mailtrap.io");
//            props.put("mail.smtp.socketFactory.port", "465");
//            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "2525");
            Session mysession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("9c238c260b4a45", "18e2b341d58aba");
                }
            });
            try {
                MimeMessage message = new MimeMessage(mysession);
                message.setFrom(new InternetAddress(email));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                // subject
                message.setSubject("Reset your password");
                // content
                message.setText("Your OTP is: " + otpvalue);
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("err", "OTP is sent to your email");
            request.getRequestDispatcher("/view/authen/enterOTP.jsp").forward(request, response);
            session.setAttribute("otp", otpvalue);
            session.setAttribute("email", email);
        }
    }

    private void validateOtp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        if (value == otp) {
            request.setAttribute("email", request.getParameter("email"));
            request.getRequestDispatcher("view/authen/reset-password.jsp").forward(request, response);
        } else {
            request.setAttribute("err", "WRONG OTP! Please try again!");
            request.getRequestDispatcher("view/authen/forget-password.jsp").forward(request, response);
        }
    }

    private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();
        User user = new User();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword) && isValidPassword(newPassword)) {
            try {
                user.setEmail(session.getAttribute("email").toString());
                user.setPassword(hash(newPassword));
                boolean resetPasswordSuccess = userDAO.resetPassword(user);
                if (resetPasswordSuccess) {
                    request.setAttribute("err", "Reset password successfully!");
                    request.getRequestDispatcher("view/authen/login.jsp").forward(request, response);
                } else {
                    request.setAttribute("password", newPassword);
                    request.setAttribute("confPassword", confPassword);
                    request.setAttribute("err", "Cannot reset password. Please try again!");
                    request.getRequestDispatcher("view/authen/reset-password.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("password", newPassword);
            request.setAttribute("confPassword", confPassword);
            request.setAttribute("err", "Cannot reset password. Please try again!");
            request.getRequestDispatcher("view/authen/reset-password.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/authen/login.jsp").forward(request, response);
    }

// Utility 
    public static String hash(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        return DatatypeConverter.printHexBinary(digest).toUpperCase();
    }

    public int Random() {
        int otpvalue = 0;
        Random rand = new Random();
        otpvalue = rand.nextInt(2222222);
        return otpvalue;
    }

    public void sendMail(String email, int otpvalue) {
        if (email != null || !email.equals("")) {
            String to = email;
            Properties props = new Properties();
            props.put("mail.smtp.host", "sandbox.smtp.mailtrap.io");
//            props.put("mail.smtp.socketFactory.port", "465");
//            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "2525");
            Session mysession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("9c238c260b4a45", "18e2b341d58aba");
                }
            });
            try {
                MimeMessage message = new MimeMessage(mysession);
                message.setFrom(new InternetAddress(email));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Verify your account");
                message.setText("Your OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }
    }

//    return: 1: hop le -> gui otp
//            2: da ton tai -> ve register.jsp
//            3: mail khong dung form: form mail va dung domain
    public int checkInput(String email, String permittedDomain, String password, String confPassword) {
        if (!password.equals(confPassword)) {
            return 5;
        }
        //check pass
        if (!isValidPassword(password)) {
            return 4;
        }
//        kiem tra mail dung form:
        if (!email.endsWith(permittedDomain)) {
            return 3;
        }
//          Kiem tra ton tai: 
        UserDAO userDAO = new UserDAO();
        if (userDAO.checkEmail(email)) {
            return 2;
        }
//          Email hop le va chua ton taii
        return 1;
    }

    public static boolean isValidPassword(String password) {
        if (password.length() < 6) {
            return false;
        }
        boolean hasNumber = false;
        for (char c : password.toCharArray()) {
            if (Character.isDigit(c)) {
                hasNumber = true;
                break;
            }
        }
        if (!hasNumber) {
            return false;
        }
        return true;
    }

}
