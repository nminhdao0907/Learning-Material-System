/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DiscussionDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Comment;
import model.Topic;
import model.Thread;
import model.User;

/**
 *
 * @author OS
 */
public class Discussions extends HttpServlet {

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

    DiscussionDAO s = new DiscussionDAO();
    int tid;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Discussions set = new Discussions();
        String action = request.getParameter("action");
        switch (action) {
            case "discussionScreen":
                set.discussionScreen(request, response);
                break;
            case "topicScreen":
                set.topicScreen(request, response);
                break;
            case "threadScreen":
                     try {
                tid = Integer.parseInt(request.getParameter("id"));
                List<Thread> threadx;
                threadx = s.GetThreadByID(tid);
                List<Comment> comment;
                comment = s.getCommentList(tid);
                request.setAttribute("threadInfo", threadx);
                request.setAttribute("commentList", comment);
                request.getRequestDispatcher("/view/user/Thread.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
            try {
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int userID = 0;
                if (user != null) {
                    userID = user.getId();
                }
                int updated_by = userID;
                Timestamp updated_at = new Timestamp(System.currentTimeMillis());
                s.UpdateThread(title, content, updated_by, updated_at, tid);
                response.sendRedirect("discussions?action=threadScreen&id=" + tid);
            } catch (Exception e) {
                System.out.println(e);
            }
            break;
            case "addScreen":
                set.addThread(request, response);
                break;
            case "deleteThread":
                set.deleteThread(request, response);
                break;
            case "deleteComment":
                set.deleteComment(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void deleteThread(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        DiscussionDAO b = new DiscussionDAO();
        try {
            tid = Integer.parseInt(request.getParameter("id"));
            b.DeleteThread(tid);
            response.sendRedirect("discussion?action=topicScreen?id=1");
        } catch (Exception e) {
        }
    }

    private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        DiscussionDAO b = new DiscussionDAO();
        try {
            tid = Integer.parseInt(request.getParameter("id"));
            b.DeleteComment(tid);
            response.sendRedirect("discussion?action=threadScreen?id=10");
        } catch (Exception e) {
        }
    }

    private void discussionScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        List<Category> category;
        List<Topic> topic;

        // If no search parameters are provided, get the whole class list
        category = s.getCategory();
        topic = s.getTopic();

        request.setAttribute("categoryList", category);
        request.setAttribute("topicList", topic);

        request.getRequestDispatcher("/view/user/Discussion.jsp").forward(request, response);
    }

    private void topicScreen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Thread> thread;
        tid = Integer.parseInt(request.getParameter("id"));
        thread = s.getThreadList(tid);

        int numOfSubject = thread.size();
        int page, startPage = 1, endPage;
        int maxPage = numOfSubject / 6;
        if (numOfSubject % 6 != 0) {
            maxPage++;
        }
        String spage = request.getParameter("page");
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }
        int start, end;
        start = (page - 1) * 6;
        end = Math.min(page * 6, numOfSubject);
        ArrayList<Thread> listByPage = s.getThreadByPage(thread, start, end);

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
        request.setAttribute("id", tid);
        request.setAttribute("threadList", listByPage);
        request.getRequestDispatcher("/view/user/Topic.jsp").forward(request, response);
    }

    private void addThread(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String ptitle = request.getParameter("title");
            String pcontent = request.getParameter("content");
            tid = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("id", tid);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userID = 0;
            if (user != null) {
                userID = user.getId();
            }
            int user_id = userID;
            s.AddThread(ptitle, pcontent, tid, user_id);
            request.setAttribute("addSuccess", false);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/ThreadAdd.jsp");
            dispatcher.forward(request, response);
            response.sendRedirect(request.getContextPath() + "/discussions?action=addScreen&addSuccess=true");

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
