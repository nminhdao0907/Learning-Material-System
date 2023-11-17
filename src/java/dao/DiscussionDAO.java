/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Comment;
import model.Topic;
import model.Thread;

/**
 *
 * @author OS
 */
public class DiscussionDAO extends BaseDAO {

    public List<Category> getCategory() {
        List<Category> categorys = new ArrayList<>();
        String sql = "SELECT\n"
                + "    c.id AS id,\n"
                + "    c.name,\n"
                + "    COUNT(t.id) AS total_topics\n"
                + "FROM\n"
                + "    category c\n"
                + "LEFT JOIN\n"
                + "    topic t ON c.id = t.category_id\n"
                + "GROUP BY\n"
                + "    c.id, c.name;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("id"),
                        rs.getString("name"), // Assuming the column name is "name"
                        rs.getInt("total_topics")
                );
                categorys.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
        return categorys;
    }

    public List<Topic> getTopic() {
        List<Topic> topics = new ArrayList<>();
        String sql = "SELECT\n"
                + "    t.id AS id,\n"
                + "    t.category_id,\n"
                + "    t.name AS name,\n"
                + "    COUNT(th.id) AS total_threads\n"
                + "FROM\n"
                + "    topic t\n"
                + "LEFT JOIN\n"
                + "    thread th ON t.id = th.topic_id\n"
                + "GROUP BY\n"
                + "    t.id, t.name, t.category_id;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Topic topic = new Topic(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getInt("total_threads")
                );
                topics.add(topic);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }

        return topics;
    }

    public ArrayList<Thread> GetThreadByID(int id) {
        ArrayList<Thread> threadList = new ArrayList<>();
        String sql = "SELECT "
                + "    th.id AS thread_id, "
                + "    th.title, "
                + "    th.content, "
                + "    th.user_id AS thread_user_id, "
                + "    u.fullname AS user_name, "
                + "    u.avatar, "
                + "    th.created_at "
                + "FROM "
                + "    thread th "
                + "JOIN "
                + "    user u ON th.user_id = u.id "
                + "WHERE "
                + "    th.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Thread thread = new Thread(
                        rs.getInt("thread_id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("thread_user_id"),
                        rs.getString("user_name"),
                        rs.getString("avatar"),
                        rs.getDate("created_at")
                );
                threadList.add(thread);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return threadList;
    }

    public List<Topic> getThread() {
        List<Topic> topics = new ArrayList<>();
        String sql = "SELECT\n"
                + "    t.id AS id,\n"
                + "    t.category_id,\n"
                + "    t.name AS name,\n"
                + "    COUNT(th.id) AS total_threads\n"
                + "FROM\n"
                + "    topic t\n"
                + "LEFT JOIN\n"
                + "    thread th ON t.id = th.topic_id\n"
                + "GROUP BY\n"
                + "    t.id, t.name, t.category_id;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Topic topic = new Topic(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getInt("total_threads")
                );
                topics.add(topic);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }

        return topics;
    }

    public void DeleteThread(int id) {
        String sql = "delete from thread\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
        public void DeleteComment(int id) {
        String sql = "delete from comment\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

public ArrayList<Thread> getThreadList(int topic_id) {
    ArrayList<Thread> threadList = new ArrayList<>();
    String sql = "SELECT\n"
            + "    th.*,\n"
            + "    u.fullname AS user_name,\n"
            + "    u.avatar AS user_avatar\n"
            + "FROM\n"
            + "    thread th\n"
            + "JOIN\n"
            + "    user u ON th.user_id = u.id\n"
            + "WHERE\n"
            + "    th.topic_id = ?\n"
            + "ORDER BY\n"
            + "    th.id DESC;";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, topic_id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Thread thread = new Thread(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getString("content"),
                rs.getInt("topic_id"),
                rs.getInt("user_id"),
                rs.getDate("created_at"),
                rs.getInt("updated_by"),
                rs.getTimestamp("updated_at"),
                rs.getString("user_name"),
                rs.getString("user_avatar")
            );

            threadList.add(thread);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return threadList;
}

public ArrayList<Comment> getCommentList(int thread_id) {
    ArrayList<Comment> commentList = new ArrayList<>();
    String sql = "SELECT\n"
            + "    th.*,\n"
            + "    u.fullname AS user_name,\n"
            + "    u.avatar AS user_avatar\n"
            + "FROM\n"
            + "    comment th\n"
            + "JOIN\n"
            + "    user u ON th.user_id = u.id\n"
            + "WHERE\n"
            + "    th.thread_id = ?\n"
            + "ORDER BY\n"
            + "    th.id ASC;";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, thread_id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Comment comment = new Comment(
                rs.getInt("id"),
                rs.getString("content"),
                rs.getInt("thread_id"),
                rs.getInt("user_id"),
                rs.getDate("created_at"),
                rs.getInt("updated_by"),
                rs.getTimestamp("updated_at"),
                rs.getString("user_name"),
                rs.getString("user_avatar")
            );

            commentList.add(comment);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return commentList;
}

    public ArrayList<Thread> getThreadByPage(ArrayList<Thread> threadList, int start, int end) {
        ArrayList<Thread> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(threadList.get(i));
        }
        return arr;
    }
    
        public ArrayList<Comment> getCommentByPage(ArrayList<Comment> commentList, int start, int end) {
        ArrayList<Comment> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(commentList.get(i));
        }
        return arr;
    }

    public void UpdateThread(String title, String content, int updated_by, Timestamp updated_at, int id) {
        String sql = "update thread set \n"
                + "title = ?, content = ?, updated_by = ?, updated_at = ?\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setInt(3, updated_by);
            st.setTimestamp(4, updated_at);
            st.setInt(5, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void AddThread(String title, String content, int topic_id, int user_id) {
        String sql = "insert into thread (title,content,topic_id, user_id) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setInt(3, topic_id);
            st.setInt(4, user_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
public static void main(String[] args) {
    DiscussionDAO a = new DiscussionDAO();
    a.AddThread("hoho","6/11",1,20);
}
}
