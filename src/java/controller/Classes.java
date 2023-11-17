/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ClassDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import model.Classs;
import model.Setting;
import model.Subject;
import model.User;

/**
 *
 * @author OS
 */
public class Classes extends HttpServlet {

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
            out.println("<title>Servlet Classes</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Classes at " + request.getContextPath() + "</h1>");
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
    ClassDAO s = new ClassDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Classes set = new Classes();
        String action = request.getParameter("action");
        switch (action) {
            case "listClass":
                set.classList(request, response);
                break;
            case "addClass":
                set.addClass(request, response);
                break;
            case "delete":
                set.deleteClass(request, response);
                break;
            case "activate":
                set.activateClass(request, response);
                break;
            case "detailScreen":
                //           String subjectCode = request.getParameter("subjectcode");
                set.detailClass(request, response);
                break;
            case "updateSet":
                try {
                    ClassDAO dao = new ClassDAO();
                    id = Integer.parseInt(request.getParameter("id"));
                    Classs p = dao.getClassByID(id);
                    request.setAttribute("classes", p);
                    List<Setting> semesters = s.getSemesters();
                    List<Subject> subjects = s.getSubjects();
                    List<User> trainers = s.getTrainers();

                    request.setAttribute("semesters", semesters);
                    request.setAttribute("subjects", subjects);
                    request.setAttribute("trainers", trainers);
                    request.getRequestDispatcher("/view/admin/ClassUpdate.jsp").forward(request, response);
                } catch (Exception e) {
                    System.out.println(e);
                }
                try {
                    String sname = request.getParameter("class_name");
                    int ssemester = Integer.parseInt(request.getParameter("semester_id"));
                    int ssubject = Integer.parseInt(request.getParameter("subject_id"));
                    int strainer = Integer.parseInt(request.getParameter("trainer_id"));
                    int sactive = Integer.parseInt(request.getParameter("is_active"));
                    // Convert date strings to Timestamp
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date startDate = dateFormat.parse(request.getParameter("start_date"));
                    java.util.Date endDate = dateFormat.parse(request.getParameter("end_date"));

                    // Convert java.util.Date to java.sql.Date
                    java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
                    java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());

                    Timestamp sstart = new Timestamp(sqlStartDate.getTime());
                    Timestamp send = new Timestamp(sqlEndDate.getTime());
                    String sdes = request.getParameter("description");
                    HttpSession session = request.getSession();
                    User user = (User) session.getAttribute("user");
                    int userID = 0;
                    if (user != null) {
                        userID = user.getId();
                    }
                    int updated_by = userID;
                    Timestamp updated_at = new Timestamp(System.currentTimeMillis());
                    s.UpdateClass(ssemester, ssubject, sname, strainer, sstart, send, sdes, sactive, updated_by, updated_at, id);
                    request.setAttribute("updateSuccess", true);
                    response.sendRedirect("classes?action=updateSet&id=" + id + "&updateSuccess=true");
                } catch (Exception e) {
                    System.out.println(e);
                }
            break;
            case "addScreen":
                set.addScreen(request, response);
                break;
            case "checkValue":
                String className = request.getParameter("class_name");
                int semesterID = Integer.parseInt(request.getParameter("semester_id"));
                int subjectID = Integer.parseInt(request.getParameter("subject_id"));

                // Assuming you have a ClassDAO instance
                ClassDAO classDAO = new ClassDAO();

                boolean exists = classDAO.doesClassWithSubjectExistInSemester(className, semesterID, subjectID);

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

    private void classList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Set default values for search parameters
        String className = null;
        int semesterID = 0;
        int subjectID = 0;
        int trainerID = 0;
        int is_Active = -1;

        // If the request contains search parameters, update the values
        if (request.getParameter("searchLabel1") != null) {
            className = request.getParameter("searchLabel1");
        }
        if (request.getParameter("searchLabel2") != null) {
            semesterID = parseParameter(request.getParameter("searchLabel2"));
        }
        if (request.getParameter("searchLabel3") != null) {
            subjectID = parseParameter(request.getParameter("searchLabel3"));
        }
        if (request.getParameter("searchLabel4") != null) {
            trainerID = parseParameter(request.getParameter("searchLabel4"));
        }
        if (request.getParameter("searchLabel5") != null) {
            is_Active = parseParameter(request.getParameter("searchLabel5"));
        }
        request.setAttribute("searchLabel1", className);
        request.setAttribute("searchLabel2", semesterID);
        request.setAttribute("searchLabel3", subjectID);
        request.setAttribute("searchLabel4", trainerID);
        request.setAttribute("searchLabel5", is_Active);
        // Perform search logic based on the parameters
        List<Classs> classes;

        if (!isEmpty(className) || semesterID != 0 || subjectID != 0 || trainerID != 0 || is_Active != -1) {
            // If search parameters are provided, use the search method
            classes = s.searchClasses(className, semesterID, subjectID, trainerID, is_Active);
        } else {
            // If no search parameters are provided, get the whole class list
            classes = s.getClassList();
        }

        List<Setting> semesters = s.getSemesters();
        List<Subject> subjects = s.getSubjects();
        List<User> trainers = s.getTrainers();

        request.setAttribute("semesters", semesters);
        request.setAttribute("subjects", subjects);
        request.setAttribute("trainers", trainers);

        // Set the classs attribute and forward the request to the JSP
        request.setAttribute("classes", classes);
        request.getRequestDispatcher("/view/admin/ClassList.jsp").forward(request, response);
    }

    private int parseParameter(String param) {
        try {
            return Integer.parseInt(param);
        } catch (NumberFormatException | NullPointerException e) {
            return 0; // Return 0 or another default value as needed
        }
    }

    private boolean isEmpty(String s) {
        return s == null || s.trim().isEmpty();
    }

    private void addClass(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String pname = request.getParameter("class_name");
            int psemester = Integer.parseInt(request.getParameter("semester_id"));
            int psubject = Integer.parseInt(request.getParameter("subject_id"));

            // Check if the class value already exists
            boolean exists = s.doesClassWithSubjectExistInSemester(pname, psemester, psubject);

            if (exists) {
                request.setAttribute("addFailure", true);
                // Forward to the add-class.jsp page with an error message
                List<Setting> semesters = s.getSemesters();
                List<Subject> subjects = s.getSubjects();
                List<User> trainers = s.getTrainers();

                request.setAttribute("semesters", semesters);
                request.setAttribute("subjects", subjects);
                request.setAttribute("trainers", trainers);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/ClassAdd.jsp");
                dispatcher.forward(request, response);
            } else {
                int ptrainer = Integer.parseInt(request.getParameter("trainer_id"));
                int pactive = Integer.parseInt(request.getParameter("is_active"));
                // Convert date strings to Timestamp
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date startDate = dateFormat.parse(request.getParameter("start_date"));
                java.util.Date endDate = dateFormat.parse(request.getParameter("end_date"));

                // Convert java.util.Date to java.sql.Date
                java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
                java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());

                Timestamp pstart = new Timestamp(sqlStartDate.getTime());
                Timestamp pend = new Timestamp(sqlEndDate.getTime());
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
                s.AddClass(psemester, psubject, pname, ptrainer, pstart, pend, pdes, pactive, created_by, created_at);

                // Redirect to the add-class.jsp page
                response.sendRedirect(request.getContextPath() + "/classes?action=addScreen&addSuccess=true");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void deleteClass(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        ClassDAO b = new ClassDAO();
        try {
            id = Integer.parseInt(request.getParameter("id"));
            b.DeleteClass(id);
            response.sendRedirect("classes?action=listClass");
        } catch (Exception e) {
        }
    }

    private void activateClass(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
            // Assuming you have a ClassDAO class that handles activation/deactivation
            ClassDAO dao = new ClassDAO();
            dao.ActivateClass(status, updated_by, updated_at, id);

            // After performing the activation/deactivation, you can redirect to the appropriate page
            response.sendRedirect("classes?action=listClass");
        } catch (Exception e) {
            // Handle exceptions appropriately
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void detailClass(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // Perform search logic based on the parameters
        List<Classs> classes;
        id = Integer.parseInt(request.getParameter("id"));
        classes = s.GetClassByID(id);
        classes.clear();
        classes = s.GetClassByID(id);

        // Set the classs attribute and forward the request to the JSP
        request.setAttribute("classes", classes);
        request.getRequestDispatcher("/view/admin/ClassDetail.jsp").forward(request, response);
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
        List<Setting> semesters = s.getSemesters();
        List<Subject> subjects = s.getSubjects();
        List<User> trainers = s.getTrainers();

        request.setAttribute("semesters", semesters);
        request.setAttribute("subjects", subjects);
        request.setAttribute("trainers", trainers);
        request.getRequestDispatcher("/view/admin/ClassAdd.jsp").forward(request, response);
    }

}
