/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.Lesson;
import model.User;
import utils.CheckInputUser;

/**
 *
 * @author bao chau
 */
public class Users extends HttpServlet {

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
            out.println("<title>Servlet Subjects</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Subjects at " + request.getContextPath() + "</h1>");
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
    UserDAO d = new UserDAO();
    CheckInputUser check = new CheckInputUser();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Users user = new Users();
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                user.userList(request, response);
                break;
            case "searchUser":
                user.searchUser(request, response);
                break;
            case "addUser":
                user.addUser(request, response);
                break;
            case "addScreen":
                user.addScreen(request, response);
                break;
            case "detailUser":
                String id = request.getParameter("sid");
                user.detailUser(request, response, id);
                break;
            case "updateUser":
                user.updateUser(request, response);
                break;
            case "activeAndDeactived":
                user.activeAndDeactivedUser(request, response);
                user.userList(request, response);
                break;
            case "sort":
                user.Sort(request, response);
                break;
//            case "searchRole":
//                user.searchRole(request, response);
//                break;
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

    private void userList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<User> list = d.getUserList();
        int numOfUser = list.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfUser / 10;
        if (numOfUser % 10 != 0) {
            maxPage++;
        }

        String spage = request.getParameter("page");
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }

        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfUser);
        ArrayList<User> listByPage = d.getUserByPage(list, start, end);

        if (page >= 3) {
            if (page + 2 < maxPage) {
                endPage = page + 2;
            } else {
                endPage = maxPage;
            }
            if (maxPage >= 5) {
                startPage = endPage - 4;
            } else {
                startPage = page - 2;
            }
        } else {
            if (maxPage >= 5) {
                endPage = 5;
            } else {
                endPage = maxPage;
            }
        }
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("list", listByPage);
        request.getRequestDispatcher("/view/admin/UserList.jsp").forward(request, response);
    }

    private void activeAndDeactivedUser(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String userId = request.getParameter("id");
        User user = d.getUserByID(userId);
        if (user != null) {
            if (!user.isStatus()) {
                user.setStatus(true);
            } else {
                user.setStatus(false);
            }
            d.activeAndDeactive(user);
            request.setAttribute("page", page);
            request.setAttribute("txt", "Notification: Success!");
        } else {
            System.out.println("Error");
        }

    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchQuery = request.getParameter("searchQuery");
        String status = request.getParameter("searchStatus");
        String role = request.getParameter("searchRole");
        ArrayList<User> list = d.searchUser(searchQuery, status, role);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);

        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("searchStatus", status);
        request.setAttribute("searchRole", role);
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/admin/UserList.jsp").forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fullname = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String statusParam = request.getParameter("status");
        int status = 0; // Default value or any other appropriate default
        if (statusParam != null && !statusParam.isEmpty()) {
            status = Integer.parseInt(statusParam);
        }
        String role_id = "4"; //auto set after adding 
        UserDAO dao = new UserDAO();
        dao.addUser(fullname, email, phone, status, role_id);
        request.setAttribute("txt", "Notification: Successfully!");
        request.getRequestDispatcher("users?action=list").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String uid = request.getParameter("id");
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String uphone = request.getParameter("phone");
        String uavatar = request.getParameter("avatar");
        String statusParam = request.getParameter("status");
        String roleParam = request.getParameter("role");
        // Check if statusParam and roleParam are not null and not empty before parsing
        int ustatus = (statusParam != null && !statusParam.isEmpty()) ? Integer.parseInt(statusParam) : 0;
        int urole = (roleParam != null && !roleParam.isEmpty()) ? Integer.parseInt(roleParam) : 0;
        int created_by = 1;
        String nameError = check.nameValid(uname);
        if (nameError.length() == 0) {
            UserDAO dao = new UserDAO();
            dao.updateUser(uid, uavatar, uname, uemail, uphone, uavatar, ustatus, urole, created_by);
            request.setAttribute("txt", "Notification: Updated successfully!");
            request.getRequestDispatcher("users?action=list").forward(request, response);

        } else {
            request.setAttribute("err", "Notification: Failed to update!");
            request.setAttribute("nameError", nameError);
            request.getRequestDispatcher("view/admin/UserDetail.jsp").forward(request, response);
        }
    }

    private void detailUser(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, ServletException {
        try {
            UserDAO d = new UserDAO();
            User list = d.getUserByID(id);
            request.setAttribute("us", list);
            request.getRequestDispatcher("view/admin/UserDetail.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void addScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("view/admin/UserAdd.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public ArrayList<User> SortByComponent(ArrayList<User> list, String type, String asc) {
        if ("name".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o1.getFullname().compareTo(o2.getFullname());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o2.getFullname().compareTo(o1.getFullname());
                    }
                });
            }
        } else if ("email".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o1.getEmail().compareTo(o2.getEmail());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o2.getEmail().compareTo(o1.getEmail());
                    }
                });
            }
        } else if ("phone_number".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o1.getPhone_number().compareTo(o2.getPhone_number());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o2.getPhone_number().compareTo(o1.getPhone_number());
                    }
                });
            }
        } else if ("role".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o1.getRole().getId()- o2.getRole().getId();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o2.getRole().getId()- o1.getRole().getId();
                    }
                });
            }
        } else if ("status".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return Boolean.compare(o1.isStatus(), o2.isStatus());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return Boolean.compare(o2.isStatus(), o1.isStatus());
                    }
                });
            }
        } else {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o1.getId() - o2.getId();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<User>() {
                    public int compare(User o1, User o2) {
                        return o2.getId() - o1.getId();
                    }
                });
            }
        }
        return list;
    }

    private void Sort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        ArrayList<User> list = d.getUserList();
        int numOfUser = list.size();
        int startPage = 1, endPage;
        int maxPage = numOfUser / 10;
        if (numOfUser % 10 != 0) {
            maxPage++;
        }

        String spage = request.getParameter("page");
        String type = request.getParameter("type");
        String iasc = request.getParameter("iasc");
        String nasc = request.getParameter("nasc");
        String easc = request.getParameter("easc");
        String pasc = request.getParameter("pasc");
        String rasc = request.getParameter("rasc");
        String sasc = request.getParameter("sasc");

        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfUser);

        if (page >= 3) {
            if (page + 2 < maxPage) {
                endPage = page + 2;
            } else {
                endPage = maxPage;
            }
            if (maxPage >= 5) {
                startPage = endPage - 4;
            } else {
                startPage = page - 2;
            }
        } else {
            if (maxPage >= 5) {
                endPage = 5;
            } else {
                endPage = maxPage;
            }
        }
        ArrayList<User> listByPage = new ArrayList<>();

        if ("name".equals(type)) {
            listByPage = SortByComponent(d.getUserByPage(list, start, end), type, nasc);
            if ("0".equals(nasc)) {
                request.setAttribute("nasc", "1");
            } else {
                request.setAttribute("nasc", "0");
            }
            request.setAttribute("iasc", sasc);
            request.setAttribute("easc", easc);
            request.setAttribute("pasc", pasc);
            request.setAttribute("rasc", rasc);
            request.setAttribute("sasc", sasc);

            //Sorting subject
        } else if ("id".equals(type)) {
            listByPage = SortByComponent(d.getUserByPage(list, start, end), type, iasc);
            if ("0".equals(iasc)) {
                request.setAttribute("iasc", "1");
            } else {
                request.setAttribute("iasc", "0");
            }
            request.setAttribute("nasc", sasc);
            request.setAttribute("easc", easc);
            request.setAttribute("pasc", pasc);
            request.setAttribute("rasc", rasc);
            request.setAttribute("sasc", sasc);

        } else if ("email".equals(type)) {
            listByPage = SortByComponent(d.getUserByPage(list, start, end), type, easc);
            if ("0".equals(easc)) {
                request.setAttribute("easc", "1");
            } else {
                request.setAttribute("easc", "0");
            }
            request.setAttribute("nasc", sasc);
            request.setAttribute("iasc", iasc);
            request.setAttribute("pasc", pasc);
            request.setAttribute("rasc", rasc);
            request.setAttribute("sasc", sasc);
        } else if ("phone_number".equals(type)) {
            listByPage = SortByComponent(d.getUserByPage(list, start, end), type, pasc);
            if ("0".equals(pasc)) {
                request.setAttribute("pasc", "1");
            } else {
                request.setAttribute("pasc", "0");
            }
            request.setAttribute("nasc", nasc);
            request.setAttribute("iasc", iasc);
            request.setAttribute("easc", easc);
            request.setAttribute("rasc", rasc);
            request.setAttribute("sasc", sasc);
        } else if ("role".equals(type)) {
            listByPage = SortByComponent(d.getUserByPage(list, start, end), type, rasc);
            if ("0".equals(rasc)) {
                request.setAttribute("rasc", "1");
            } else {
                request.setAttribute("rasc", "0");
            }
            request.setAttribute("nasc", nasc);
            request.setAttribute("iasc", iasc);
            request.setAttribute("pasc", pasc);
            request.setAttribute("easc", easc);
            request.setAttribute("sasc", sasc);
        } else if ("status".equals(type)) {
            listByPage = SortByComponent(d.getUserByPage(list, start, end), type, sasc);
            if ("0".equals(sasc)) {
                request.setAttribute("sasc", "1");
            } else {
                request.setAttribute("sasc", "0");
            }
            request.setAttribute("nasc", nasc);
            request.setAttribute("iasc", iasc);
            request.setAttribute("pasc", pasc);
            request.setAttribute("rasc", rasc);
            request.setAttribute("easc", easc);
        }

        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("list", listByPage);
        request.getRequestDispatcher("/view/admin/UserList.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
