/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChapterDAO;
import dao.LessonDAO;
import dao.QuizDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.Chapter;
import model.Lesson;
import model.Quiz;
import model.Subject;
import model.User;
import utils.CheckInputLesson;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dangn
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class Lessons extends HttpServlet {

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
    LessonDAO d = new LessonDAO();
    SubjectDAO sd = new SubjectDAO();
    ChapterDAO cd = new ChapterDAO();
    QuizDAO qd = new QuizDAO();
    CheckInputLesson check = new CheckInputLesson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Lessons lesson = new Lessons();
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                lesson.lessonList(request, response);
                break;
            case "searchLesson":
                lesson.searchLesson(request, response);
                break;
            case "delete":
                lesson.deleteLesson(request, response);
                lesson.lessonList(request, response);
                break;
            case "addLesson":
                lesson.addLesson(request, response);
                break;
            case "addScreen":
                lesson.addScreen(request, response);
                break;
            case "detailLesson":
                String id = request.getParameter("sid");
                lesson.detailLesson(request, response, id);
                break;
            case "activeAndDeactived":
                lesson.activeAndDeactivedLesson(request, response);
                lesson.lessonList(request, response);
                break;
            case "updateLesson":
                lesson.updateLesson(request, response);
                break;
            case "sort":
                lesson.Sort(request, response);
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

    private void lessonList(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        ArrayList<Lesson> list = d.getLesList();
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        ArrayList<Quiz> quizList = qd.getAllQuizzes();
        int numOfLesson = list.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfLesson / 10;
        if (numOfLesson % 10 != 0) {
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
        end = Math.min(page * 10, numOfLesson);
        ArrayList<Lesson> listByPage = d.getLessonByPage(list, start, end);

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
        request.setAttribute("tasc", 0);
        request.setAttribute("sasc", 0);
        request.setAttribute("casc", 0);
        request.setAttribute("acasc", 0);
        request.setAttribute("lasc", 0);
        request.setAttribute("dasc", 0);
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("listA", listByPage);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("quizList", quizList);
        request.getRequestDispatcher("/view/manager/LessonList.jsp").forward(request, response);
    }

    private void Sort(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int page = Integer.parseInt(request.getParameter("page"));
        ArrayList<Lesson> list = d.getLesList();
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        ArrayList<Quiz> quizList = qd.getAllQuizzes();
        int numOfLesson = list.size();
        int startPage = 1, endPage;
        int maxPage = numOfLesson / 10;
        if (numOfLesson % 10 != 0) {
            maxPage++;
        }
        String spage = request.getParameter("page");
        String type = request.getParameter("type");
        String tasc = request.getParameter("tasc");
        String sasc = request.getParameter("sasc");
        String casc = request.getParameter("casc");
        String lasc = request.getParameter("lasc");
        String acasc = request.getParameter("acasc");
        String dasc = request.getParameter("dasc");

        int start, end;
        start = (page - 1) * 10;
        end = Math.min(page * 10, numOfLesson);

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

        ArrayList<Lesson> listByPage = new ArrayList();
        //Sorting title
        if ("title".equals(type)) {
            listByPage = SortByComponent(d.getLessonByPage(list, start, end), type, tasc);
            if ("0".equals(tasc)) {
                request.setAttribute("tasc", "1");
            } else {
                request.setAttribute("tasc", "0");
            }
            request.setAttribute("sasc", sasc);
            request.setAttribute("casc", casc);
            request.setAttribute("lasc", lasc);
            request.setAttribute("acasc", acasc);
            request.setAttribute("dasc", acasc);

            //Sorting subject
        } else if ("subject_id".equals(type)) {
            listByPage = SortByComponent(d.getLessonByPage(list, start, end), type, sasc);
            if ("0".equals(sasc)) {
                request.setAttribute("sasc", "1");
            } else {
                request.setAttribute("sasc", "0");
            }
            request.setAttribute("tasc", tasc);
            request.setAttribute("casc", casc);
            request.setAttribute("lasc", lasc);
            request.setAttribute("acasc", acasc);
            request.setAttribute("dasc", acasc);

            //Sorting chapter
        } else if ("chapter_id".equals(type)) {
            listByPage = SortByComponent(d.getLessonByPage(list, start, end), type, casc);
            if ("0".equals(casc)) {
                request.setAttribute("casc", "1");
            } else {
                request.setAttribute("casc", "0");
            }
            request.setAttribute("tasc", tasc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("lasc", lasc);
            request.setAttribute("acasc", acasc);
            request.setAttribute("dasc", acasc);

            //Sorting status
        } else if ("status".equals(type)) {
            listByPage = SortByComponent(d.getLessonByPage(list, start, end), type, acasc);
            if ("0".equals(acasc)) {
                request.setAttribute("acasc", "1");
            } else {
                request.setAttribute("acasc", "0");
            }
            request.setAttribute("tasc", tasc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("lasc", lasc);
            request.setAttribute("casc", casc);
            request.setAttribute("dasc", acasc);

            //Sorting lesson type
        } else if ("ltype".equals(type)) {
            listByPage = SortByComponent(d.getLessonByPage(list, start, end), type, lasc);
            if ("0".equals(lasc)) {
                request.setAttribute("lasc", "1");
            } else {
                request.setAttribute("lasc", "0");
            }
            request.setAttribute("tasc", tasc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("casc", casc);
            request.setAttribute("acasc", acasc);
            request.setAttribute("dasc", acasc);

        } else {
            listByPage = SortByComponent(d.getLessonByPage(list, start, end), type, dasc);
            if ("0".equals(dasc)) {
                request.setAttribute("dasc", "1");
            } else {
                request.setAttribute("dasc", "0");
            }
            request.setAttribute("tasc", tasc);
            request.setAttribute("sasc", sasc);
            request.setAttribute("casc", casc);
            request.setAttribute("acasc", acasc);
            request.setAttribute("lasc", lasc);

        }

        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("listA", listByPage);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("quizList", quizList);
        request.getRequestDispatcher("/view/manager/LessonList.jsp").forward(request, response);
    }

    private void searchLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchQuery = request.getParameter("searchQuery");
        String chapter = request.getParameter("searchByChapter");
        String subject = request.getParameter("searchBySubject");
        String status = request.getParameter("searchStatus");
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        ArrayList<Quiz> quizList = qd.getAllQuizzes();
        ArrayList<Lesson> list = d.searchLesson(searchQuery, subject, chapter, status);
        request.setAttribute("page", 1);
        request.setAttribute("startPage", 1);
        request.setAttribute("endPage", 1);
        request.setAttribute("maxPage", 1);

        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("searchByChapter", chapter);
        request.setAttribute("searchBySubject", subject);
        request.setAttribute("statusSaved", status);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("quizList", quizList);
        request.setAttribute("listA", list);

        request.getRequestDispatcher("view/manager/LessonList.jsp").forward(request, response);
    }

    private void deleteLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String lesson_id = request.getParameter("lesson_id");
        String page = request.getParameter("page");
        d.deleteLesson(lesson_id);
        request.setAttribute("page", page);
        request.setAttribute("txt", "Notification: Delete success!");
    }

    public ArrayList<Lesson> SortByComponent(ArrayList<Lesson> list, String type, String asc) {
        if ("title".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o1.getTitle().compareTo(o2.getTitle());
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o2.getTitle().compareTo(o1.getTitle());
                    }
                });
            }
        } else if ("subject_id".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o1.getSubject().getId() - o2.getSubject().getId();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o2.getSubject().getId() - o1.getSubject().getId();
                    }
                });
            }
        } else if ("chapter_id".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o1.getChapter().getChapter_id() - o2.getChapter().getChapter_id();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o2.getChapter().getChapter_id() > o1.getChapter().getChapter_id() ? 1 : -1;
                    }
                });
            }
        } else if ("status".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o1.getIs_active() - o2.getIs_active();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o2.getIs_active() - o1.getIs_active();
                    }
                });
            }
        } else if ("ltype".equals(type)) {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o1.getLesson_type() - o2.getLesson_type();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o2.getLesson_type() - o1.getLesson_type();
                    }
                });
            }
        } else {
            if ("0".equals(asc)) {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o1.getLesson_id() - o2.getLesson_id();
                    }
                });
            } else {
                Collections.sort(list, new Comparator<Lesson>() {
                    public int compare(Lesson o1, Lesson o2) {
                        return o2.getLesson_id() - o1.getLesson_id();
                    }
                });
            }
        }
        return list;

    }

    private void addLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("title");
        String description = request.getParameter("editor");
        String video_link = request.getParameter("video_link");
        String file_attached = request.getParameter("file_attached");
        String isActive = request.getParameter("is_active");
        String chapterId = request.getParameter("chapter_id");
        String lessonType = request.getParameter("lesson_type");
        String subjectId = request.getParameter("subject_id");
        String quizId = request.getParameter("quiz_id");
        int chapter_id = (chapterId != null) ? Integer.parseInt(chapterId) : 0;
        int lesson_type = (lessonType != null) ? Integer.parseInt(lessonType) : 0;
        int subject_id = (subjectId != null) ? Integer.parseInt(subjectId) : 0;
        Integer quiz_id = null;
        if (quizId != null && !quizId.isEmpty()) {
            quiz_id = Integer.parseInt(quizId);
        }
        int is_active = (isActive != null) ? Integer.parseInt(isActive) : 0;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = 0;
        if (user != null) {
            id = user.getId();
        }

        Lesson l = new Lesson();
        Subject s = new Subject();
        Chapter c = new Chapter();
        Quiz q = new Quiz();
        l.setTitle(title);
        l.setIs_active(is_active);
        l.setDescription(description);
        l.setVideo_link(video_link);
        l.setFile_attached(file_attached);
        l.setLesson_type(lesson_type);
        c.setChapter_id(chapter_id);
        s.setId(subject_id);
        l.setCreated_by(id);
        l.setSubject(s);
        l.setChapter(c);
        if (quiz_id != null) {
            q.setQuiz_id(quiz_id);
            l.setQuiz(q);
        }
        d.addLesson(l);
        request.setAttribute("txt", "Notification: Add Successfully!");
        request.getRequestDispatcher("lesson?action=list").forward(request, response);
    }

    private void updateLesson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String sid = request.getParameter("lesson_id");
        String subjectId = request.getParameter("subject_id");
        String title = request.getParameter("title");
        String chapterId = request.getParameter("chapter_id");
        String lesson_type = request.getParameter("lesson_type");
        int quizId = Integer.parseInt(request.getParameter("quiz_id"));
        String video_link = request.getParameter("video_link");
        String description = request.getParameter("content1");
        String file_attached = request.getParameter("file_attached");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = 0;
        if (user != null) {
            id = user.getId();
        }
        d.updateLesson(title, chapterId, description, video_link, file_attached, lesson_type, subjectId, quizId, id, sid);
        request.setAttribute("txt", "Notification: Updated successfully!");

//        request.setAttribute("err", "Notification: Failed to update!");
//        request.setAttribute("nameError", nameError);
        request.getRequestDispatcher("lesson?action=list").forward(request, response);
    }

    private void detailLesson(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, ServletException {
        try {
            ArrayList<Subject> subjectList = sd.getSubjectList();
            ArrayList<Chapter> chapterList = cd.getChapterList();
            ArrayList<Quiz> quizList = qd.getAllQuizzes();
            LessonDAO d = new LessonDAO();
            Lesson list = d.getLessonByID(id);
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("chapterList", chapterList);
            request.setAttribute("quizList", quizList);
            request.setAttribute("lesson", list);
            request.getRequestDispatcher("view/manager/LessonDetail.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void addScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Subject> subjectList = sd.getSubjectList();
        ArrayList<Chapter> chapterList = cd.getChapterList();
        ArrayList<Quiz> quizList = qd.getAllQuizzes();
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("chapterList", chapterList);
        request.setAttribute("quizList", quizList);
        request.getRequestDispatcher("view/manager/LessonAdd.jsp").forward(request, response);
    }

    private void activeAndDeactivedLesson(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String lesson_id = request.getParameter("lesson_id");
        Lesson lesson = d.getLessonByID(lesson_id);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = 0;
        if (user != null) {
            id = user.getId();
        }
        lesson.setUpdated_by(id);
        if (lesson.getIs_active() == 1) {
            lesson.setIs_active(0);
            d.activeAndDeactive(lesson);
        } else {
            lesson.setIs_active(1);
            d.activeAndDeactive(lesson);
        }
        request.setAttribute("page", page);
        request.setAttribute("txt", "Notification: Success!");
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
