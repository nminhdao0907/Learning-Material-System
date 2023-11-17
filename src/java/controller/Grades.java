/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.GradeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Chapter;
import model.Grade;

/**
 *
 * @author OS
 */
public class Grades extends HttpServlet {

    GradeDAO a = new GradeDAO();

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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "gradeList" : request.getParameter("action");
        switch (action) {
            case "gradeList":
                gradeList(request, response);
                break;
            case "sort":
                Sort(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void gradeList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Grade> gradeList = a.getGradeList();
        int numOfSubject = gradeList.size();
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
        ArrayList<Grade> listByPage = a.getGradeByPage(gradeList, start, end);

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
        //      ArrayList<Subject> subjectList = sd.getLessonNameList();
        //      ArrayList<Chapter> chapterList = cd.getLesson_typeList();
        request.setAttribute("idasc", 0);
        request.setAttribute("nameasc", 0);
        request.setAttribute("itemasc", 0);
        request.setAttribute("typeasc", 0);
        request.setAttribute("weightasc", 0);
        request.setAttribute("totalasc", 0);

        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("gradeList", listByPage);
        //       request.setAttribute("subjectList", subjectList);
        //       request.setAttribute("chapterList", chapterList);
        request.getRequestDispatcher("/view/trainer/GradeList.jsp").forward(request, response);
    }

    private void Sort(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int page = Integer.parseInt(request.getParameter("page"));
        ArrayList<Grade> gradeList = a.getGradeList();
        int numOfGrade = gradeList.size();
        int startPage = 1, endPage;
        int maxPage = numOfGrade / 10;
        if (numOfGrade % 10 != 0) {
            maxPage++;
        }
        String spage = request.getParameter("page");
        String type = request.getParameter("type");
        String idasc = request.getParameter("idasc");
        String nameasc = request.getParameter("nameasc");
        String itemasc = request.getParameter("itemasc");
        String typeasc = request.getParameter("typeasc");
        String weightasc = request.getParameter("weightasc");
        String totalasc = request.getParameter("totalasc");

        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfGrade);

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

        ArrayList<Grade> listByPage = new ArrayList();
        //Sorting title
        if ("name".equals(type)) {
            listByPage = SortByComponent(a.getGradeByPage(gradeList, start, end), type, nameasc);
            if ("0".equals(nameasc)) {
                request.setAttribute("nameasc", "1");
            } else {
                request.setAttribute("nameasc", "0");
            }
            request.setAttribute("idasc", idasc);
            request.setAttribute("nameasc", nameasc);
            request.setAttribute("itemasc", itemasc);
            request.setAttribute("typeasc", typeasc);
            request.setAttribute("weightasc", weightasc);
            request.setAttribute("totalasc", totalasc);

            //Sorting subject
        } else if ("item".equals(type)) {
            listByPage = SortByComponent(a.getGradeByPage(gradeList, start, end), type, itemasc);
            if ("0".equals(itemasc)) {
                request.setAttribute("itemasc", "1");
            } else {
                request.setAttribute("itemasc", "0");
            }
            request.setAttribute("idasc", idasc);
            request.setAttribute("nameasc", nameasc);
            request.setAttribute("itemasc", itemasc);
            request.setAttribute("typeasc", typeasc);
            request.setAttribute("weightasc", weightasc);
            request.setAttribute("totalasc", totalasc);

            //Sorting chapter
        } else if ("type".equals(type)) {
            listByPage = SortByComponent(a.getGradeByPage(gradeList, start, end), type, typeasc);
            if ("0".equals(typeasc)) {
                request.setAttribute("typeasc", "1");
            } else {
                request.setAttribute("typeasc", "0");
            }
            request.setAttribute("idasc", idasc);
            request.setAttribute("nameasc", nameasc);
            request.setAttribute("itemasc", itemasc);
            request.setAttribute("typeasc", typeasc);
            request.setAttribute("weightasc", weightasc);
            request.setAttribute("totalasc", totalasc);

            //Sorting status
        } else if ("weight".equals(type)) {
            listByPage = SortByComponent(a.getGradeByPage(gradeList, start, end), type, weightasc);
            if ("0".equals(weightasc)) {
                request.setAttribute("weightasc", "1");
            } else {
                request.setAttribute("weightasc", "0");
            }
            request.setAttribute("idasc", idasc);
            request.setAttribute("nameasc", nameasc);
            request.setAttribute("itemasc", itemasc);
            request.setAttribute("typeasc", typeasc);
            request.setAttribute("weightasc", weightasc);
            request.setAttribute("totalasc", totalasc);

            //Sorting lesson type
        } else if ("total".equals(type)) {
            listByPage = SortByComponent(a.getGradeByPage(gradeList, start, end), type, totalasc);
            if ("0".equals(totalasc)) {
                request.setAttribute("totalasc", "1");
            } else {
                request.setAttribute("totalasc", "0");
            }
            request.setAttribute("idasc", idasc);
            request.setAttribute("nameasc", nameasc);
            request.setAttribute("itemasc", itemasc);
            request.setAttribute("typeasc", typeasc);
            request.setAttribute("weightasc", weightasc);
            request.setAttribute("totalasc", totalasc);

        } else {
            listByPage = SortByComponent(a.getGradeByPage(gradeList, start, end), type, idasc);
            if ("0".equals(idasc)) {
                request.setAttribute("idasc", "1");
            } else {
                request.setAttribute("idasc", "0");
            }
            request.setAttribute("idasc", idasc);
            request.setAttribute("nameasc", nameasc);
            request.setAttribute("itemasc", itemasc);
            request.setAttribute("typeasc", typeasc);
            request.setAttribute("weightasc", weightasc);
            request.setAttribute("totalasc", totalasc);

        }

        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("listA", listByPage);
//        request.setAttribute("subjectList", subjectList);
        //       request.setAttribute("chapterList", chapterList);
        request.setAttribute("gradeList", gradeList);
        request.getRequestDispatcher("/view/trainer/GradeList.jsp").forward(request, response);
    }

    /*
    private void searchGrade(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchQuery = request.getParameter("searchQuery");
        String chapter = request.getParameter("searchChapter");
        String subject = request.getParameter("searchSubject");
        String status = request.getParameter("searchStatus");
        ArrayList<Subject> subjectList = sd.getLessonNameList();
        ArrayList<Chapter> chapterList = cd.getLesson_typeList();
        ArrayList<Quiz> quizList = qd.getAllQuizzes();
        ArrayList<Grade> list = d.searchGrade(searchQuery, subject, chapter, status);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);

        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("searchChapter", chapter);
        request.setAttribute("searchSubject", subject);
        request.setAttribute("searchStatus", status);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("quizList", quizList);
        request.setAttribute("listA", list);

        request.getRequestDispatcher("view/manager/GradeList.jsp").forward(request, response);
    }
     */
    public ArrayList<Grade> SortByComponent(ArrayList<Grade> gradeList, String type, String asc) {
        if ("name".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o1.getStudentName().compareTo(o2.getStudentName());
                    }
                });
            } else {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o2.getStudentName().compareTo(o1.getStudentName());
                    }
                });
            }
        } /*else if ("item".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o1.getLessonName().getId() - o2.getLessonName().getId();
                    }
                });
            } else {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o2.getLessonName().getId() - o1.getLessonName().getId();
                    }
                });
            }
        } else if ("type".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o1.getLesson_type().getLesson_type_id() - o2.getLesson_type().getLesson_type_id();
                    }
                });
            } else {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o2.getLesson_type().getLesson_type_id() > o1.getLesson_type().getLesson_type_id() ? 1 : -1;
                    }
                });
            }
        } 
         */ else if ("weight".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return Float.compare(o1.getWeight(), o2.getWeight());
                    }
                });
            } else {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return Float.compare(o2.getWeight(), o1.getWeight());
                    }
                });
            }
        } else if ("total".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return Float.compare(o1.getScore(), o2.getScore());
                    }
                });
            } else {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return Float.compare(o2.getScore(), o1.getScore());
                    }
                });
            }
        } else {
            if ("0".equals(asc)) {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o1.getGrade_id() - o2.getGrade_id();
                    }
                });
            } else {
                Collections.sort(gradeList, new Comparator<Grade>() {
                    public int compare(Grade o1, Grade o2) {
                        return o2.getGrade_id() - o1.getGrade_id();
                    }
                });
            }
        }
        return gradeList;

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
