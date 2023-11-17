/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SubmittedAssigmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.SubmittedAssignment;
import model.User;

/**
 *
 * @author bao chau
 */
public class SubmittedAssignments extends HttpServlet {

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
            out.println("<title>Servlet SubmittedAssignment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmittedAssignment at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        switch (action) {
            case "getList":
                getList(request, response);
                break;
            case "grade":
                grade(request, response);
                break;
            case "dowload":
                dowloadAssignment(request, response);
        }
    }
    SubmittedAssigmentDAO submittedAsgdao = new SubmittedAssigmentDAO();

    protected void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtName = request.getParameter("txtName");
        String assignmentID = request.getParameter("assignmentID");
        String classId = request.getParameter("classID");
        String txtName2;
        int classId2;
        if ("''".equals(txtName)) {
            txtName2 = "%%";
            txtName = "";
        } else {
            txtName2 = "%" + txtName + "%";
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userID = 0;
        if (user != null) {
            userID = user.getId();
        }
        if ("0".equals(classId)) {
            classId2 = submittedAsgdao.getFirstClassIDListByTrainer(userID);
        } else {
            classId2 = Integer.parseInt(classId);
        }

        ArrayList<SubmittedAssignment> list = new ArrayList<>();
        if ("0".equals(assignmentID)) {
            list = submittedAsgdao.getSubmittedAssignmentListForAllAssignments(userID, txtName2, classId2);
        } else {
            list = submittedAsgdao.getSubmittedAssignmentList(userID, Integer.parseInt(assignmentID), txtName2, classId2);
        }
        request.setAttribute("txtName", txtName);
        request.setAttribute("assignmentID", assignmentID);
        request.setAttribute("classID", classId);
        request.setAttribute("assignmentList", submittedAsgdao.getAssignmentListByClass(classId2));
        request.setAttribute("classList", submittedAsgdao.getClassListByTrainer(userID));

        paging(request, response, list);

        request.getRequestDispatcher("/view/trainer/SubmittedAssignmentList.jsp").forward(request, response);
    }

    protected void paging(HttpServletRequest request, HttpServletResponse response, ArrayList<SubmittedAssignment> arr) throws ServletException, IOException {
        int numOfAssignment = arr.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfAssignment / 10;
        if (numOfAssignment % 10 != 0) {
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
        end = Math.min(page * 10, numOfAssignment);
        ArrayList<SubmittedAssignment> listByPage = submittedAsgdao.getListByPage(arr, start, end);
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
        if (listByPage.size() == 0) {
            maxPage = 1;
        }
        sort(request, response, listByPage);
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("AssignmentList", listByPage);

    }

    private void sort(HttpServletRequest request, HttpServletResponse response, ArrayList<SubmittedAssignment> arr) throws IOException, ServletException {
        String sortElement = request.getParameter("sortElement");
        String nasc = "0", masc = "0";
        if (!sortElement.equals("none")) {

            switch (sortElement) {
                case "name":
                    nasc = request.getParameter("nasc");
                    sortByComponent(arr, "name", nasc);
                    if ("0".equals(nasc) || "-1".equals(nasc)) {
                        nasc = "1";
                    } else {
                        nasc = "-1";
                    }
                    break;
                case "mark":
                    masc = request.getParameter("masc");
                    sortByComponent(arr, "mark", masc);
                    if ("0".equals(masc) || "-1".equals(masc)) {
                        masc = "1";
                    } else {
                        masc = "-1";
                    }
                    break;
            }
        }
        request.setAttribute("nasc", nasc);
        request.setAttribute("masc", masc);

    }

    public ArrayList<SubmittedAssignment> sortByComponent(ArrayList<SubmittedAssignment> list, String type, String asc) {

        if ("-1".equals(asc) || "0".equals(asc)) {
            Collections.sort(list, new Comparator<SubmittedAssignment>() {
                @Override
                public int compare(SubmittedAssignment o1, SubmittedAssignment o2) {
                    if ("name".equals(type)) {
                        return o1.getStudentName().compareTo(o2.getStudentName());
                    } else {
                        return (int) Math.round(o1.getGrade()) - (int) Math.round(o2.getGrade());
                    }
                }
            });
        } else {
            Collections.sort(list, new Comparator<SubmittedAssignment>() {
                @Override
                public int compare(SubmittedAssignment o1, SubmittedAssignment o2) {
                    if ("name".equals(type)) {
                        return o2.getStudentName().compareTo(o1.getStudentName());
                    } else {
                        return (int) Math.round(o2.getGrade()) - (int) Math.round(o1.getGrade());
                    }
                }
            });
        }

        return list;
    }

    private void grade(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        String studentID = request.getParameter("studentIDgrade");
        String assginmentIDgrade = request.getParameter("assginmentIDgrade");
        String markstring = request.getParameter("mark");
        String classIDgrade = request.getParameter("classIDgrade");
        try {
            if (Double.parseDouble(markstring) < 0 || Double.parseDouble(markstring) > 100) {
                request.setAttribute("studentIDgrade", studentID);
                request.setAttribute("assginmentIDgrade", assginmentIDgrade);
                request.setAttribute("mark", markstring);
                request.setAttribute("classIDgrade", classIDgrade);
                request.setAttribute("type", "1");
                request.setAttribute("err", "Invalid Input");
                request.getRequestDispatcher("submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none").forward(request, response);
            } else {
                out.write("b");
                submittedAsgdao.grade(Integer.parseInt(studentID), Integer.parseInt(assginmentIDgrade), Double.parseDouble(markstring), Integer.parseInt(classIDgrade));
                request.setAttribute("txt", "Success");
                request.getRequestDispatcher("submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none").forward(request, response);
            }
        } catch (NumberFormatException e) {
            out.write("c");
            request.setAttribute("studentIDgrade", studentID);
            request.setAttribute("assginmentIDgrade", assginmentIDgrade);
            request.setAttribute("mark", markstring);
            request.setAttribute("classIDgrade", classIDgrade);
            request.setAttribute("type", "1");
            request.setAttribute("err", "Invalid Input");
            request.getRequestDispatcher("submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none").forward(request, response);
        }
    }
    public int BUFFER_SIZE = 1024 * 1000;

    private void dowloadAssignment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String assignmentID = request.getParameter("assignmentID");
        String studentID = request.getParameter("studentID");
        String classID = request.getParameter("classID");
        String filename = submittedAsgdao.getFileName(Integer.parseInt(assignmentID), Integer.parseInt(studentID),Integer.parseInt(classID));
        if (filename!=null) {
            String path = getServletContext().getRealPath("") + "AsmSubmit" +File.separator + filename;
            File file = new File(path);
            OutputStream os = null;
            FileInputStream fis = null;
            String[] filesplit = filename.split("\\.");
            response.setHeader("Content-Disposition", String.format("attachment;filename="+filesplit[0]+"."+filesplit[1]));
            response.setContentType("application/octet-stream");
            if (file.exists()) {
                os = response.getOutputStream();
                fis = new FileInputStream(file);
                byte[] bf = new byte[BUFFER_SIZE];
                int byteRead = 1;
                while ((byteRead = fis.read(bf)) != -1) {
                    os.write(bf, 0, byteRead);
                }
            } else {
                request.setAttribute("type", "1");
                request.setAttribute("err", "System Error");
                request.getRequestDispatcher("submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none").forward(request, response);
            }
        } else {
            request.setAttribute("type", "1");
            request.setAttribute("err", "File not Exist");
            request.getRequestDispatcher("submittedaassignment?action=getList&txtName=&classID=0&assignmentID=0&sortElement=none").forward(request, response);
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
