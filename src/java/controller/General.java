/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.GeneralDAO;
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
import java.util.List;
import model.Chapter;
import model.Dimension;
import model.Subject;
import model.User;

/**
 *
 * @author ADMIN
 */
public class General extends HttpServlet {

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
            out.println("<title>Servlet General</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet General at " + request.getContextPath() + "</h1>");
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
    List<Dimension> dimensionPage;
 List<Chapter> chapterPage;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String formType = request.getParameter("formType");
        String action = request.getParameter("action");
        int checkSort = 0;

        if (action != null) {
            switch (action) {
                case "sort":
                    System.out.println(1);
                    String s;
                    if (request.getParameter("s") == null) {
                        s = "asc";
                    } else {
                        s = request.getParameter("s");
                    }
                    if (s.equals("asc")) {
                        s = "desc";
                    } else {
                        s = "asc";
                    }
                    dimensionPage = sort(request, response, 6, s);
                    checkSort = 1;
                    break;
          
        
              case "sortchap":
               
                    if (request.getParameter("s") == null) {
                        s = "asc";
                    } else {
                        s = request.getParameter("s");
                    }
                    if (s.equals("asc")) {
                        s = "desc";
                    } else {
                        s = "asc";
                    }
                chapterPage = sortchap(request, response, 6, s);
                checkSort = 1;
                break;
                  }
        }
        if ("ActiveDeactive".equals(formType)) {
            GeneralDAO gd = new GeneralDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            Dimension dimen = gd.getOne(id);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userID = 0;
            if (user != null) {
                userID = user.getId();
            }
            dimen.setUpdated_by(userID);

            if (dimen.getIs_active() == 1) {
                dimen.setIs_active(0);
                gd.activeAndDeactive(dimen);
            } else {
                dimen.setIs_active(1);
                gd.activeAndDeactive(dimen);
            }
            request.setAttribute("txt", "Success");
        }

        if ("ActiveDeactiveChap".equals(formType)) {
            GeneralDAO gd = new GeneralDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            Chapter chap = gd.getOneChap(id);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userID = 0;
            if (user != null) {
                userID = user.getId();
            }
            chap.setUpdated_by(userID);

            if (chap.getIs_active() == 1) {
                chap.setIs_active(0);
                gd.activeAndDeactiveChap(chap);
            } else {
                chap.setIs_active(1);
                gd.activeAndDeactiveChap(chap);
            }
            request.setAttribute("txt", "Success");
        }
        GeneralDAO gd = new GeneralDAO();
        int numberProductPerPage = 6;
        String href;

        List<Integer> lstPage = new ArrayList<>();
        int pageCur = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

        int dimensionListSize = gd.getDimensionListSize();
        int chapterListSize = gd.getChapterListSize();

        int totalDimensionPages = dimensionListSize % numberProductPerPage == 0
                ? dimensionListSize / numberProductPerPage
                : dimensionListSize / numberProductPerPage + 1;

        int totalChapterPages = chapterListSize % numberProductPerPage == 0
                ? chapterListSize / numberProductPerPage
                : chapterListSize / numberProductPerPage + 1;
        if (checkSort == 0) {
            dimensionPage = gd.getListDimensionPerPage(numberProductPerPage, pageCur);
        }
        if(checkSort == 0){
        chapterPage = gd.getListChapterPerPage(numberProductPerPage, pageCur);
        }
        String dimensionHref = "General?";
        String chapterHref = "General?";

        SubjectDAO sd = new SubjectDAO();
        List<Subject> s = new ArrayList<>();
        s = sd.getSubjectList();
        List<Dimension> dc = new ArrayList<>();
        dc = gd.getType();

        for (int i = 1;
                i <= totalDimensionPages;
                i++) {
            lstPage.add(i);
        }

        request.setAttribute(
                "listtype", dc);
        request.setAttribute(
                "href", dimensionHref);
        request.setAttribute(
                "href", chapterHref);
        request.setAttribute(
                "lst", dimensionPage);
        request.setAttribute(
                "lstc", chapterPage);
        request.setAttribute(
                "lstPage", lstPage);
        request.setAttribute(
                "pageCur", pageCur);
        request.setAttribute(
                "totalPage", totalChapterPages);
        request.setAttribute(
                "listsubject", s);
        request.getRequestDispatcher("view/manager/general.jsp").forward(request, response);
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
        String formType = request.getParameter("formType");
        GeneralDAO gd = new GeneralDAO();

        if ("SearchDimension".equals(formType)) {
            String search = request.getParameter("search");

            List<Dimension> lst = gd.Search(search);
            request.setAttribute("lst", lst);
            request.setAttribute("search", search);
            request.setAttribute("txt", "Success");

            request.getRequestDispatcher("view/manager/general.jsp").forward(request, response);
        }
        if ("Filter".equals(formType)) {
            String type = request.getParameter("type");
            String name = request.getParameter("name");
            int status = Integer.parseInt(request.getParameter("status"));
            List<Dimension> lst = gd.filter(type, name, status);

            request.setAttribute("lst", lst);

            request.getRequestDispatcher("view/manager/general.jsp").forward(request, response);
        }
        if ("FilterChap".equals(formType)) {
            String title = request.getParameter("title");
            int status = Integer.parseInt(request.getParameter("status"));

            List<Chapter> lst = gd.filterChap(title, status);

            request.setAttribute("lstc", lst);

            request.getRequestDispatcher("view/manager/general.jsp").forward(request, response);
        }
        if ("AddDimension".equals(formType)) {
            String type = request.getParameter("type");
            String name = request.getParameter("name");
            int sid = Integer.parseInt(request.getParameter("sid"));
            int status = Integer.parseInt(request.getParameter("status"));
            Dimension d = new Dimension();
            d.setType(type);
            d.setName(name);
            d.setIs_active(status);
            Subject s = new Subject();
            s.setId(sid);
            d.setSubject_id(s);
            gd.addDimension(d);
            HttpSession session = request.getSession();
            session.setAttribute("txt", "Success");

            response.sendRedirect("General");

        }
        if ("AddChapter".equals(formType)) {
            String title = request.getParameter("title");
            int sid = Integer.parseInt(request.getParameter("sid"));
            int status = Integer.parseInt(request.getParameter("status"));
            String descript = request.getParameter("description");
            Chapter c = new Chapter();
            c.setTitle(title);
            c.setIs_active(status);
            c.setDescription(descript);
            c.setSubject_id(sid);
            gd.addChap(c);
            HttpSession session = request.getSession();
            session.setAttribute("txt", "Success");

            response.sendRedirect("General");
        }
        if ("DeleteDemensions".equals(formType)) {
            String idStr = request.getParameter("id");
            int ID = Integer.parseInt(idStr);
            gd.delete(ID);
            HttpSession session = request.getSession();
            session.setAttribute("txt", "Success");

            response.sendRedirect("General");
        }
        if ("DeleteChapter".equals(formType)) {
            String idStr = request.getParameter("id");
            int ID = Integer.parseInt(idStr);
            gd.deleteChap(ID);
            HttpSession session = request.getSession();
            session.setAttribute("txt", "Success");

            response.sendRedirect("General");
        }
    }

    private List<Dimension> sort(HttpServletRequest request, HttpServletResponse response, int numberProductPerPage, String s) throws ServletException, IOException {
        String type = request.getParameter("type");
        GeneralDAO gd = new GeneralDAO();
        int pageCur = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        List<Dimension> d = new ArrayList<>();
        if (s.equals("asc")) {
            d = gd.getsortlstAcs(type, numberProductPerPage, pageCur);
        } else {
            d = gd.getsortlstDesc(type, numberProductPerPage, pageCur);
        }
        request.setAttribute("s", s);
        return d;
    }

    private List<Chapter> sortchap(HttpServletRequest request, HttpServletResponse response, int numberProductPerPage, String s) {
         String type = request.getParameter("type");
        GeneralDAO gd = new GeneralDAO();
        int pageCur = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        List<Chapter> c = new ArrayList<>();
        if (s.equals("asc")) {
            c = gd.getsortlstAcsChap(type, numberProductPerPage, pageCur);
        } else {
            c = gd.getsortlstDescChap(type, numberProductPerPage, pageCur);
        }
        request.setAttribute("s", s);
        return c;
    }

}
