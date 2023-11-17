/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SubjectDAO;
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
import model.Subject;
import model.SubjectManager;
import model.User;
import utils.InputValidation;

/**
 *
 * @author bao chau
 */
public class Subjects extends HttpServlet {

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
    SubjectDAO d = new SubjectDAO();
    InputValidation check = new InputValidation();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                subjectList(request, response);
                break;
            case "search":
                searchSubject(request, response);
                break;
            case "activeAndDeactive":
                activeAndDeactivedSubject(request, response);
                subjectList(request, response);
                break;
            case "addScreen":
                newSubjectScreen(request, response);
                break;
            case "addSubject":
                addSubject(request, response);
                break;
            case "detailScreen":
                String subjectID = request.getParameter("subjectID");
                detailScreen(request, response, subjectID);
                break;
            case "updateSubject":
                updateSubject(request, response);
                break;
            case "sort":
                sort(request, response);
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

    private void subjectList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Subject> subjectlist = d.getSubjectList();
        ArrayList<SubjectManager> managerList = d.getManagerList();
        int numOfSubject = subjectlist.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfSubject / 10;
        if (numOfSubject % 10 != 0) {
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
        end = Math.min(page * 10, numOfSubject);
        ArrayList<Subject> listByPage = d.getSubjectByPage(subjectlist, start, end);

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
        request.setAttribute("casc", 0);
        request.setAttribute("nasc", 0);
        request.setAttribute("masc", 0);
        request.setAttribute("managerList", managerList);
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("list", listByPage);
        request.getRequestDispatcher("/view/admin/SubjectList.jsp").forward(request, response);
    }

    private void searchSubject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchContent = request.getParameter("searchContent");
        String subjectStatus = request.getParameter("searchByStatus");
        String managerID = request.getParameter("searchByManagerID");
        ArrayList<Subject> subjectlist = new ArrayList<>();
        ArrayList<SubjectManager> managerList = d.getManagerList();
        if (managerID != "") {
            subjectlist = d.searchSubject(searchContent, subjectStatus, managerID);
        } else {
            subjectlist = d.searchSubjectWithoutMId(searchContent, subjectStatus);
        }
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);

        request.setAttribute("managerList", managerList);
        request.setAttribute("searchContent", searchContent);
        request.setAttribute("searchByStatus", subjectStatus);
        request.setAttribute("searchByManagerID", managerID);
        request.setAttribute("list", subjectlist);
        request.getRequestDispatcher("/view/admin/SubjectList.jsp").forward(request, response);
    }

    private void activeAndDeactivedSubject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String page = request.getParameter("page");
        String id = request.getParameter("subjectID");
        Subject subject = d.getSubject("subject.id", id);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        subject.setUpdatedBy(userID);

        if (subject.getIsActive() == 1) {
            subject.setIsActive(0);
            d.activeAndDeactive(subject);
        } else {
            subject.setIsActive(1);
            d.activeAndDeactive(subject);
        }

        request.setAttribute("page", page);
        request.setAttribute("txt", "Success");
    }

    private void newSubjectScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<SubjectManager> managerList = d.getManager();
        request.setAttribute("managerList", managerList);
        request.getRequestDispatcher("/view/admin/SubjectAdd.jsp").forward(request, response);
    }

    private void addSubject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String code = request.getParameter("subjectCode");
        String name = request.getParameter("subjectName");
        String status = request.getParameter("subjectStatus");

        Subject subject = new Subject();
        subject.setCode(code);
        subject.setName(name);
        subject.setIsActive(Integer.parseInt(status));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        subject.setCreatedBy(userID);
        String codeError = check.newSubjectCodeValidation(code);
        String nameError = check.newSubjectNameValidation(name);

        if (codeError.length() == 0 && nameError.length() == 0) {
            d.addSubject(subject);
            request.setAttribute("txt", "Success");
            subjectList(request, response);
        } else {
            request.setAttribute("err", "Error");
            request.setAttribute("codeError", codeError);
            request.setAttribute("nameError", nameError);
            request.setAttribute("subject", subject);
            subjectList(request, response);
        }
    }

    private void detailScreen(HttpServletRequest request, HttpServletResponse response, String subjectID) throws IOException, ServletException {
        Subject subject = d.getSubject("subject.id", subjectID);
        ArrayList<SubjectManager> managerList = d.getManager();
        request.setAttribute("subject", subject);
        request.setAttribute("manager",  d.getManagerName(subject.getManagerID() + ""));
        request.setAttribute("managerList", managerList);
        request.getRequestDispatcher("/view/admin/SubjectDetails.jsp").forward(request, response);
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("subjectID");
        String code = request.getParameter("subjectCode");
        String name = request.getParameter("subjectName");
        String manager = request.getParameter("managerID");
        String status = request.getParameter("status");
        String description = request.getParameter("description");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        Subject subject = d.getSubject("subject.id", id);
        subject.setCode(code);
        subject.setName(name);
        subject.setDescription(description);
        subject.setUpdatedBy(userID);
        String codeError = check.updateSubjectCodeValidation(Integer.parseInt(id), code);
        String nameError = check.updateSubjectNameValidation(Integer.parseInt(id), name);
        String descriptError = check.subjectDescriptionValidation(description);
        if (codeError.length() == 0 && nameError.length() == 0 && descriptError.length() == 0) {
            if (manager != "") {
                subject.setManagerID(Integer.parseInt(manager));
                subject.setManagerName(d.getManagerName(manager));
                d.updateSubject(subject);
                d.assignSubjectManager(subject);
            } else {
                d.unAssignSubjectManager(id);
                d.updateSubject(subject);
            }
            d.updateSubjectStatus(Integer.parseInt(id), Integer.parseInt(status));
            request.setAttribute("txt", "Success");
            request.getRequestDispatcher("subject?action=list").forward(request, response);
        } else {
            request.setAttribute("err", "Error");
            request.setAttribute("codeError", codeError);
            request.setAttribute("nameError", nameError);
            request.setAttribute("descriptError", descriptError);
            request.setAttribute("managerID", manager);
            request.setAttribute("subject", subject);
            request.setAttribute("manager",d.getManagerName(subject.getManagerID() + ""));
            request.setAttribute("managerList", d.getManager());
            request.getRequestDispatcher("/view/admin/SubjectDetails.jsp").forward(request, response);
        }
    }

    private void sort(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int page = Integer.parseInt(request.getParameter("page"));
        String type = request.getParameter("type");
        String search = request.getParameter("search");
        String casc = request.getParameter("casc");
        String nasc = request.getParameter("nasc");
        String masc = request.getParameter("masc");
        
        ArrayList<Subject> subjectlist = d.getSubjectList();
        ArrayList<SubjectManager> managerList = d.getManagerList();
        int numOfSubject = subjectlist.size();
        int startPage = 1, endPage;
        int maxPage = numOfSubject / 10;
        if (numOfSubject % 10 != 0) {
            maxPage++;
        }
        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfSubject);
        ArrayList<Subject> listByPage = new ArrayList<>();
        if ("code".equals(type)) {
            listByPage = sortByComponent(d.getSubjectByPage(subjectlist, start, end), type, casc);
            if("0".equals(casc)){
                request.setAttribute("casc", 1);
            }else{
                request.setAttribute("casc", "0");
            }
            request.setAttribute("nasc", nasc);
            request.setAttribute("masc", masc);
        }else if("name".equals(type)){
            listByPage = sortByComponent(d.getSubjectByPage(subjectlist, start, end), type, nasc);
            if("0".equals(nasc)){
                request.setAttribute("nasc", 1);
            }else{
                request.setAttribute("nasc", "0");
            }
            request.setAttribute("casc", casc);
            request.setAttribute("masc", masc);
        }else{
            listByPage = sortByComponent(d.getSubjectByPage(subjectlist, start, end), type, masc);
            if("0".equals(masc)){
                request.setAttribute("masc", 1);
            }else{
                request.setAttribute("masc", "0");
            }
            request.setAttribute("nasc", nasc);
            request.setAttribute("casc", casc);
        }
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
        request.setAttribute("managerList", managerList);
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("list", listByPage);
        request.getRequestDispatcher("/view/admin/SubjectList.jsp").forward(request, response);
    }

    public ArrayList<Subject> sortByComponent(ArrayList<Subject> list, String type, String asc) {
        if ("code".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject o1, Subject o2) {
                        return o1.getCode().compareTo(o2.getCode());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject o1, Subject o2) {
                        return o2.getCode().compareTo(o1.getCode());
                    }
                });
            }
        } else if ("name".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject o1, Subject o2) {
                        return o1.getName().compareTo(o2.getName());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject o1, Subject o2) {
                        return o2.getName().compareTo(o1.getName());
                    }
                });
            }
        } else {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject o1, Subject o2) {
                        return o1.getManagerID() - o2.getManagerID();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject o1, Subject o2) {
                        return o2.getManagerID() - o1.getManagerID();
                    }
                });
            }
        }
        return list;
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
