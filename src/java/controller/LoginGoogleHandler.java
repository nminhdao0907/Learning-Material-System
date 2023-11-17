/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Constants;
import model.Setting;
import model.User;
import model.UserGoogle;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 *
 * @author Admin
 */
public class LoginGoogleHandler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogle user = getUserInfo(accessToken);
        String permittedDomain = userDAO.getPermittedMailDomain();
//         Invalid:         
        if (!user.getEmail().endsWith(permittedDomain)) {
            request.setAttribute("err", "Email is invalid! Example: abc@fpt.edu.vn");
            request.getRequestDispatcher("/view/authen/login.jsp").forward(request, response);
        }
        Setting rol = new Setting();
        rol.setId(4);
        User newUser = User.builder().email(user.getEmail()).role(rol).build();
        if (!userDAO.checkEmail(user.getEmail()) && isValidEmailByDomain(user.getEmail(), permittedDomain)) {
            userDAO.googleRegister(newUser);
        }
        User loginedUser = userDAO.googleLogin(newUser.getEmail());
        session.setAttribute("user", loginedUser);
//        System.out.println(loginedUser);
        switch (loginedUser.getRole().getId()) {
            case 1: //Admin
//                response.sendRedirect("subjectlist");
                request.getRequestDispatcher("/view/admin/SubjectList.jsp").forward(request, response);
                break;
            case 4: //Trainee
//                response.sendRedirect("home");
                request.getRequestDispatcher("/view/user/index.jsp").forward(request, response);
                break;
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
    }

    public boolean isValidEmail(String email, String[] regex) {
        for (String patternStr : regex) {
            Pattern pattern = Pattern.compile(patternStr);
            Matcher matcher = pattern.matcher(email);
            if (matcher.matches()) {
                return true;
            }
        }
        return false;
    }

    public boolean isValidEmailByDomain(String email, String permittedDomain) {
        return email.endsWith(permittedDomain);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
