/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChapterDAO;
import dao.ClassAssignmentDAO;
import dao.ClassDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Map;
import model.Chapter;
import model.Subject;
import model.ClassAssignment;
import model.User;
import model.Classs;

/**
 *
 * @author dangn
 */
public class ClassAssignments extends HttpServlet {

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
            out.println("<title>Servlet ClassAssignment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassAssignment at " + request.getContextPath() + "</h1>");
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
    SubjectDAO sd = new SubjectDAO();
    ChapterDAO cd = new ChapterDAO();
    ClassDAO cld = new ClassDAO();
    ClassAssignmentDAO cad = new ClassAssignmentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ClassAssignments casm = new ClassAssignments();
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                casm.asmList(request, response);
                break;
            case "activeAndDeactived":
                casm.activeAndDeactivedAssignment(request, response);
                casm.asmList(request, response);
                break;
            case "searchAssignment":
                casm.searchAssignment(request, response);
                break;
            case "addAsm":
                casm.addAssignment(request, response);
                break;
            case "detailAsm":
                String id = request.getParameter("sid");
                casm.detailAsm(request, response, id);
                break;
            case "updateAsm":
                casm.updateAsm(request, response);
                break;
            case "sort":
                casm.Sort(request, response);
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

    }

    private void asmList(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        ArrayList<ClassAssignment> list = cad.getCasmList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
//        ArrayList<ClassAssignment> classList = cad.getClassList();
//        ArrayList<Classs> classList = cld.getAllClass();

        ArrayList<Subject> subjectList = sd.getSubjectList();
        int numOfAsm = list.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfAsm / 10;
        if (numOfAsm % 10 != 0) {
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
        end = Math.min(page * 10, numOfAsm);
        ArrayList<ClassAssignment> listByPage = cad.getClassAsmByPage(list, start, end);

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
        request.setAttribute("listA", listByPage);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("subjectList", subjectList);
        Map<Integer, String> classList = cad.getIDAndNameClasses();
        request.setAttribute("map", classList);
        request.getRequestDispatcher("/view/trainer/AssignmentList.jsp").forward(request, response);
    }

    private void Sort(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int page = Integer.parseInt(request.getParameter("page"));
        ArrayList<ClassAssignment> list = cad.getCasmList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        ArrayList<ClassAssignment> classList = cad.getClassList();
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Classs> classList2 = cld.getAllClass();

        int numOfAsm = list.size();
        int startPage = 1, endPage;
        int maxPage = numOfAsm / 10;
        if (numOfAsm % 10 != 0) {
            maxPage++;
        }
        String spage = request.getParameter("page");
        String type = request.getParameter("type");
        String iasc = request.getParameter("iasc");
        String tasc = request.getParameter("tasc");
        String casc = request.getParameter("casc");
        String sasc = request.getParameter("sasc");
        String easc = request.getParameter("easc");
        String dasc = request.getParameter("dasc");
        String ssasc = request.getParameter("ssasc");

        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfAsm);

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

        ArrayList<ClassAssignment> listByPage = new ArrayList();
        //Sorting title
        if ("id".equals(type)) {
            listByPage = SortByComponent(cad.getClassAsmByPage(list, start, end), type, iasc);
            if ("0".equals(iasc)) {
                request.setAttribute("iasc", "1");
            } else {
                request.setAttribute("iasc", "0");
            }
            request.setAttribute("tasc", tasc);
            request.setAttribute("casc", casc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("easc", easc);
            request.setAttribute("dasc", dasc);
            request.setAttribute("ssasc", ssasc);

            //Sorting subject
        } else if ("name".equals(type)) {
            listByPage = SortByComponent(cad.getClassAsmByPage(list, start, end), type, tasc);
            if ("0".equals(tasc)) {
                request.setAttribute("tasc", "1");
            } else {
                request.setAttribute("tasc", "0");
            }
            request.setAttribute("iasc", iasc);
            request.setAttribute("casc", casc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("easc", easc);
            request.setAttribute("dasc", dasc);
            request.setAttribute("ssasc", ssasc);

            //Sorting chapter
        } else if ("class_id".equals(type)) {
            listByPage = SortByComponent(cad.getClassAsmByPage(list, start, end), type, casc);
            if ("0".equals(casc)) {
                request.setAttribute("casc", "1");
            } else {
                request.setAttribute("casc", "0");
            }
            request.setAttribute("iasc", iasc);
            request.setAttribute("tasc", tasc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("easc", easc);
            request.setAttribute("dasc", dasc);
            request.setAttribute("ssasc", ssasc);

            //Sorting status
        } else if ("subject".equals(type)) {
            listByPage = SortByComponent(cad.getClassAsmByPage(list, start, end), type, sasc);
            if ("0".equals(sasc)) {
                request.setAttribute("sasc", "1");
            } else {
                request.setAttribute("sasc", "0");
            }
            request.setAttribute("iasc", iasc);
            request.setAttribute("tasc", tasc);
            request.setAttribute("casc", casc);
            request.setAttribute("easc", easc);
            request.setAttribute("dasc", dasc);
            request.setAttribute("ssasc", ssasc);

            //Sorting lesson type
        } else if ("chapter".equals(type)) {
            listByPage = SortByComponent(cad.getClassAsmByPage(list, start, end), type, easc);
            if ("0".equals(easc)) {
                request.setAttribute("easc", "1");
            } else {
                request.setAttribute("easc", "0");
            }
            request.setAttribute("iasc", iasc);
            request.setAttribute("tasc", tasc);
            request.setAttribute("casc", casc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("dasc", dasc);
            request.setAttribute("ssasc", ssasc);

        } else if ("due_date".equals(type)) {
            listByPage = SortByComponent(cad.getClassAsmByPage(list, start, end), type, dasc);
            if ("0".equals(dasc)) {
                request.setAttribute("dasc", "1");
            } else {
                request.setAttribute("dasc", "0");
            }
            request.setAttribute("iasc", iasc);
            request.setAttribute("tasc", tasc);
            request.setAttribute("casc", casc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("easc", easc);
            request.setAttribute("ssasc", ssasc);

        } else {
            listByPage = SortByComponent(cad.getClassAsmByPage(list, start, end), type, ssasc);
            if ("0".equals(ssasc)) {
                request.setAttribute("ssasc", "1");
            } else {
                request.setAttribute("ssasc", "0");
            }
            request.setAttribute("iasc", iasc);
            request.setAttribute("tasc", tasc);
            request.setAttribute("casc", casc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("easc", easc);
            request.setAttribute("dasc", dasc);
        }

        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("listA", listByPage);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("classList", classList);
        request.getRequestDispatcher("/view/trainer/AssignmentList.jsp").forward(request, response);
    }

    private void searchAssignment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ClassAssignmentDAO cad = new ClassAssignmentDAO();
        String searchQuery = request.getParameter("searchQuery");
        String chapter = request.getParameter("searchChapter");
        String status = request.getParameter("searchStatus");
        String classes = request.getParameter("searchClass");
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        //ArrayList<ClassAssignment> classList = cad.getClassList();
        ArrayList<ClassAssignment> list = cad.searchAssignment(searchQuery, chapter, classes, status);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);

        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("searchChapter", chapter);
        request.setAttribute("searchClass", classes);
        request.setAttribute("statusSaved", status);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("subjectList", subjectList);
//       request.setAttribute("classList", classList);
        Map<Integer, String> classList = cad.getIDAndNameClasses();
        request.setAttribute("map", classList);
        request.setAttribute("listA", list);

        request.getRequestDispatcher("/view/trainer/AssignmentList.jsp").forward(request, response);
    }

    public ArrayList<ClassAssignment> SortByComponent(ArrayList<ClassAssignment> list, String type, String asc) {
        if ("id".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o1.getId() - o2.getId();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o2.getId() - o1.getId();
                    }
                });
            }
        } else if ("name".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o1.getName().compareTo(o2.getName());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o2.getName().compareTo(o1.getName());
                    }
                });
            }
        } else if ("class_id".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o1.getClasss().getId() - o2.getClasss().getId();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o2.getClasss().getId() - o1.getClasss().getId();
                    }
                });
            }
        } else if ("subject".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o1.getSubject().getId() - o2.getSubject().getId();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o2.getSubject().getId() - o1.getSubject().getId();
                    }
                });
            }
        } else if ("chapter".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o1.getChapter().getChapter_id() - o2.getChapter().getChapter_id();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o2.getChapter().getChapter_id() - o1.getChapter().getChapter_id();
                    }
                });
            }
        } else if ("due_date".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o1.getDue_date().compareTo(o2.getDue_date());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o2.getDue_date().compareTo(o1.getDue_date());
                    }
                });
            }

        } else {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o1.getIs_active() - o2.getIs_active();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<ClassAssignment>() {
                    public int compare(ClassAssignment o1, ClassAssignment o2) {
                        return o2.getIs_active() - o1.getIs_active();
                    }
                });
            }

        }
        return list;

    }

    private void addAssignment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            String dlString = request.getParameter("due_date");
            SimpleDateFormat dlDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date parsedDL = dlDateFormat.parse(dlString);
            Timestamp due_date = new Timestamp(parsedDL.getTime());

            String chapterId = request.getParameter("chapter_id");
            String classId = request.getParameter("class_id");
            String subjectId = request.getParameter("subject_id");
            String isActive = request.getParameter("is_active");
            int chapter_id = (chapterId != null) ? Integer.parseInt(chapterId) : 0;
            int class_id = (classId != null) ? Integer.parseInt(classId) : 0;
            int subject_id = (subjectId != null) ? Integer.parseInt(subjectId) : 0;
            int is_active = (isActive != null) ? Integer.parseInt(isActive) : 0;

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int id = 0;
            if (user != null) {
                id = user.getId();
            }
            ClassAssignmentDAO dao = new ClassAssignmentDAO();
            dao.addAssignment(name, subject_id, chapter_id, class_id, description, due_date, is_active, id);
            request.setAttribute("txt", "Notification: Add Successfully!");
            request.getRequestDispatcher("casm?action=list").forward(request, response);
        } catch (ParseException ex) {
            System.out.println(ex);
        }
    }
// update không ch?y vào dây nay
    // update dùng hàm này đúng k day

    private void updateAsm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String asmId = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("desc1");

            String dlString = request.getParameter("due_date");
            SimpleDateFormat dlDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date parsedDL = dlDateFormat.parse(dlString);
            Timestamp due_date = new Timestamp(parsedDL.getTime());

            String chapterId = request.getParameter("chapter_id");
            String classId = request.getParameter("class_id");
            String subjectId = request.getParameter("subject_id");
            String isActive = request.getParameter("is_active");
            int chapter_id = (chapterId != null) ? Integer.parseInt(chapterId) : 0;
            int class_id = (classId != null) ? Integer.parseInt(classId) : 0;
            int subject_id = (subjectId != null) ? Integer.parseInt(subjectId) : 0;
            int is_active = (isActive != null) ? Integer.parseInt(isActive) : 0;

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int id = 0;
            if (user != null) {
                id = user.getId();
            }
            ClassAssignmentDAO dao = new ClassAssignmentDAO();
            dao.updateAssignment(asmId, name, subject_id, chapter_id, class_id, description, due_date, is_active, id);
            request.setAttribute("txt", "Notification: Updated Successfully!");
            request.getRequestDispatcher("casm?action=list").forward(request, response);
        } catch (ParseException ex) {
            System.out.println(ex);
        }
    }

    private void detailAsm(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, ServletException {
        try {
            ArrayList<Chapter> chapterList = cd.getChapterList();
            ArrayList<ClassAssignment> classList = cad.getClassList();
            ArrayList<Classs> allclassList = cld.getAllClass();
            ArrayList<Subject> subjectList = sd.getSubjectList();
            ClassAssignmentDAO d = new ClassAssignmentDAO();
            ClassAssignment list = d.getAssignmentByID(id);
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("chapterList", chapterList);
            request.setAttribute("classList", classList);
            request.setAttribute("allclassList", allclassList);
            request.setAttribute("asm", list);
            request.getRequestDispatcher("view/trainer/AssignmentDetails.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void activeAndDeactivedAssignment(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String class_id = request.getParameter("id");
        ClassAssignment cas = cad.getAssignmentByID(class_id);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = 0;
        if (user != null) {
            id = user.getId();
        }
        cas.setUpdated_by(id);
        if (cas.getIs_active() == 1) {
            cas.setIs_active(0);
            cad.activeAndDeactive(cas);
        } else {
            cas.setIs_active(1);
            cad.activeAndDeactive(cas);
        }
        request.setAttribute("page", page);
        request.setAttribute("txt", "Notification: Success!");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
