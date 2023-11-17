/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SettingDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import model.Setting;
import model.User;

/**
 *
 * @author OS
 */
public class SettingList extends HttpServlet {

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
            out.println("<title>Servlet SettingListTest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingListTest at " + request.getContextPath() + "</h1>");
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
    int id;
    private static final long serialVersionUID = 1L;
    SettingDAO s = new SettingDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SettingList set = new SettingList();
        String action = request.getParameter("action");
        switch (action) {
            case "listSetting":
                set.settingList(request, response);
                break;
            case "addSetting":
                set.addSetting(request, response);
                break;
            case "delete":
                set.deleteSetting(request, response);
                break;
            case "activate":
                set.activateSetting(request, response);
                break;
            case "detailScreen":
                //           String subjectCode = request.getParameter("subjectcode");
                set.detailSetting(request, response);
                break;
            case "updateSet":
                    try {
                SettingDAO dao = new SettingDAO();
                id = Integer.parseInt(request.getParameter("id"));
                Setting p = dao.getSettingByID(id);
                request.setAttribute("setting", p);
                request.getRequestDispatcher("/view/admin/update-setting.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
            try {
                String sname = request.getParameter("setting_name");
                String svalue = request.getParameter("setting_value");
                int sactive = Integer.parseInt(request.getParameter("is_active"));
                int sorder = Integer.parseInt(request.getParameter("display_order"));
                String sdes = request.getParameter("description");
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int userID = 0;
                if (user != null) {
                    userID = user.getId();
                }
                int updated_by = userID;
                Timestamp updated_at = new Timestamp(System.currentTimeMillis());
                s.UpdateSetting(sname, svalue, sactive, sorder, sdes, updated_by, updated_at, id);
                request.setAttribute("updateSuccess", true);
                response.sendRedirect("settinglist?action=updateSet&id=" + id + "&updateSuccess=true");
            } catch (Exception e) {
                System.out.println(e);
            }
            break;
            case "addScreen":
                set.addScreen(request, response);
                break;
            case "checkValue":
                String settingValue = request.getParameter("setting_value");

                // Assuming you have a SettingDAO instance
                SettingDAO settingDAO = new SettingDAO();

                boolean exists = settingDAO.doesSettingValueExist(settingValue);

                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");

                if (exists) {
                    response.getWriter().write("exists");
                } else {
                    response.getWriter().write("not_exists");
                }
                break;
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

private void settingList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    // Set default values for search parameters
    String settingValue = null;
    String settingName = null;
    int isActive = -1;

    // If the request contains search parameters, update the values
    if (request.getParameter("searchLabel1") != null) {
        settingValue = request.getParameter("searchLabel1");
    }
    if (request.getParameter("searchLabel2") != null) {
        settingName = request.getParameter("searchLabel2");
    }
    if (request.getParameter("searchLabel3") != null) {
        isActive = parseParameter(request.getParameter("searchLabel3"));
    }

    // Perform search logic based on the parameters
    List<Setting> settings;

    if (!isEmpty(settingValue) || !isEmpty(settingName) || isActive != -1) {
        // If search parameters are provided, use the search method
        settings = s.searchSettings(settingValue, settingName, isActive);
    } else {
        // If no search parameters are provided, get the whole setting list
        settings = s.getSettingList();
    }
request.setAttribute("searchLabel1", settingValue);
request.setAttribute("searchLabel2", settingName);
request.setAttribute("searchLabel3", isActive);
    // Set the settings attribute and forward the request to the JSP
    request.setAttribute("settings", settings);
    request.getRequestDispatcher("/view/admin/setting-list.jsp").forward(request, response);
}
private boolean isEmpty(String s) {
    return s == null || s.trim().isEmpty();
}
private int parseParameter(String param) {
    try {
        return Integer.parseInt(param);
    } catch (NumberFormatException | NullPointerException e) {
        return 0; // Return 0 or another default value as needed
    }
}

    private void addSetting(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String pname = request.getParameter("setting_name");
            String pvalue = request.getParameter("setting_value");

            // Check if the setting value already exists
            boolean exists = s.doesSettingValueExist(pvalue);

            if (exists) {
                request.setAttribute("addFailure", true);
                // Forward to the add-setting.jsp page with an error message
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/add-setting.jsp");
                dispatcher.forward(request, response);
            } else {
                int pactive = Integer.parseInt(request.getParameter("is_active"));
                int porder = Integer.parseInt(request.getParameter("display_order"));
                String pdes = request.getParameter("description");
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int userID = 0;
                if (user != null) {
                    userID = user.getId();
                }
                int created_by = userID;
                Timestamp created_at = new Timestamp(System.currentTimeMillis());

                request.setAttribute("addSuccess", true);

                // Call your DAO method here
                s.AddSetting(pname, pvalue, pactive, porder, pdes, created_by, created_at);

                // Redirect to the add-setting.jsp page
                response.sendRedirect(request.getContextPath() + "/settinglist?action=addScreen&addSuccess=true");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void deleteSetting(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        SettingDAO b = new SettingDAO();
        try {
            id = Integer.parseInt(request.getParameter("id"));
            b.DeleteSetting(id);
            response.sendRedirect("settinglist?action=listSetting");
        } catch (Exception e) {
        }
    }

    private void activateSetting(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int status = Integer.parseInt(request.getParameter("status-then"));
            id = Integer.parseInt(request.getParameter("id"));
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int userID = 0;
                if (user != null) {
                    userID = user.getId();
                }
                int updated_by = userID;
                Timestamp updated_at = new Timestamp(System.currentTimeMillis());
            // Assuming you have a SettingDAO class that handles activation/deactivation
            SettingDAO dao = new SettingDAO();
            dao.ActivateSetting(status,updated_by,updated_at,id);

            // After performing the activation/deactivation, you can redirect to the appropriate page
                    response.sendRedirect("settinglist?action=listSetting");
        } catch (Exception e) {
            // Handle exceptions appropriately
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void detailSetting(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // Perform search logic based on the parameters
        List<Setting> settings;
        id = Integer.parseInt(request.getParameter("id"));
        settings = s.GetSettingByID(id);
        settings.clear();
        settings = s.GetSettingByID(id);

        // Set the settings attribute and forward the request to the JSP
        request.setAttribute("settings", settings);
        request.getRequestDispatcher("/view/admin/detail-setting.jsp").forward(request, response);
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

    private void addScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/view/admin/add-setting.jsp").forward(request, response);
    }

}
