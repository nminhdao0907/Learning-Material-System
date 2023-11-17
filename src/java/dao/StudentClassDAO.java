/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Classs;
import model.Setting;
import model.StudentClass;
import model.User;

/**
 *
 * @author bao chau
 */
public class StudentClassDAO extends BaseDAO {

    public ArrayList<Classs> getMyClass(int userID) {
        ArrayList<Classs> classList = new ArrayList<>();
        String sql = "select class.id, class.semester_id, class.class_name, class.subject_id, subject.subject_code, class.trainer_id, user.fullname, setting.setting_value\n"
                + "from student_class join class on class.id = student_class.class_id \n"
                + "join subject on subject.id = class.subject_id \n"
                + "join user on user.id = class.trainer_id \n"
                + "join setting on setting.id = class.semester_id\n"
                + "where student_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs c = new Classs();
                c.setId(rs.getInt(1));
                c.setSemester_id(rs.getInt(2));
                c.setClass_name(rs.getString(3));
                c.setSubject_id(rs.getInt(4));
                c.setSubject_code(rs.getString(5));
                c.setTrainer_id(rs.getInt(6));
                c.setTrainer_name(rs.getString(7));
                c.setSemester_name(rs.getString(8));
                classList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classList;
    }

    public ArrayList<Setting> getMySemesterList(int userID) {
        ArrayList<Setting> semesterList = new ArrayList<>();
        String sql = "select distinct setting.id,setting.setting_value\n"
                + "from setting join class on class.semester_id = setting.id\n"
                + "join student_class on student_class.class_id= class.id\n"
                + "join user on user.id = student_class.student_id\n"
                + "where user.id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setId(rs.getInt(1));
                s.setSetting_value(rs.getString(2));
                semesterList.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return semesterList;
    }

    public ArrayList<Classs> getClassBySemester(int userID, int semesterID) {
        ArrayList<Classs> classList = new ArrayList<>();
        String sql = "select class.id, class.semester_id, class.class_name, class.subject_id, subject.subject_code, class.trainer_id, user.fullname, setting.setting_value\n"
                + "from student_class join class on class.id = student_class.class_id \n"
                + "join subject on subject.id = class.subject_id \n"
                + "join user on user.id = class.trainer_id \n"
                + "join setting on setting.id = class.semester_id\n"
                + "where student_id = ? and class.semester_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, semesterID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs c = new Classs();
                c.setId(rs.getInt(1));
                c.setSemester_id(rs.getInt(2));
                c.setClass_name(rs.getString(3));
                c.setSubject_id(rs.getInt(4));
                c.setSubject_code(rs.getString(5));
                c.setTrainer_id(rs.getInt(6));
                c.setTrainer_name(rs.getString(7));
                c.setSemester_name(rs.getString(8));
                classList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classList;
    }

    public static void main(String[] args) {
        StudentClassDAO d = new StudentClassDAO();
        System.out.println(d.getMySemesterList(20).size());
    }

    public boolean update(StudentClass obj, int classid) {
        int check = 0;
        String sql = "UPDATE group6_lms.student_class s "
                + "JOIN group6_lms.user u ON s.student_id = u.id "
                + "SET s.class_id = ?, u.fullname = ?, s.is_active = ? "
                + "WHERE s.display_order = ? AND s.class_id = ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, obj.getClassid().getId());  // Assuming getClassid() returns the 'Classs' object and getId() retrieves its ID
            ps.setObject(2, obj.getUser().getFullname());
            ps.setObject(3, obj.getIs_active());
            ps.setObject(4, obj.getDisplay_order());
            ps.setObject(5, classid);  // Using the provided 'classid' parameter

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public List<StudentClass> getListStudentPerPage(int numberProductPerPage, int pageCur, int id) {
        String sql = "SELECT distinct u.fullname, u.email, c.class_name, c.subject_id, s.is_active, s.display_order, u.id\n"
                + "                                  FROM group6_lms.student_class s join group6_lms.class c on s.class_id = c.id join  group6_lms.user u \n"
                + "                                  on s.student_id = u.id   where s.class_id = ?   \n"
                + "                              ORDER BY s.display_order \n"
                + "                                      LIMIT ?, ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, id);
            ps.setObject(2, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(3, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<StudentClass> list = new ArrayList<>();
            while (rs.next()) {
                StudentClass sc = new StudentClass();
                User u = new User();
                Classs c = new Classs();
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setId(rs.getInt("id"));
                c.setClass_name(rs.getString("class_name"));
                c.setSubject_id(rs.getInt("subject_id"));
                sc.setIs_active(rs.getInt("is_active"));
                sc.setUser(u);
                sc.setClassid(c);
                sc.setDisplay_order(rs.getInt("display_order"));

                list.add(sc);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int getStudentListSize(int id) {
        int size = 0;
        String query = "SELECT COUNT(*) FROM group6_lms.student_class s "
                + "JOIN group6_lms.class c ON s.class_id = c.id "
                + "JOIN group6_lms.user u ON s.student_id = u.id "
                + "WHERE s.class_id = ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id); // Set the parameter for the class_id
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    size = resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
        return size;
    }

    public boolean delete(int id) {
        int check = 0;
        String sql = "DELETE FROM `group6_lms`.`student_class`\n"
                + "WHERE student_id IN (SELECT id FROM user WHERE id = ?);";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public void activeAndDeactive(StudentClass stuclass) {
        String sql = "UPDATE `group6_lms`.`student_class`  SET \n"
                + "            is_active = ?, updated_by= ?, updated_at =NOW() \n"
                + "          WHERE student_id IN (SELECT id FROM user WHERE id = ?)";
        Connection connection = new BaseDAO().connection;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stuclass.getIs_active());
            st.setInt(2, stuclass.getUpdated_by());
            st.setInt(3, stuclass.getUser().getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public static void main(String[] args) {
//        System.out.println(new StudentClassDAO().getOnedisplay(1));
//    }

    public List<Classs> getclasses() {

        String sql = "SELECT distinct  c.class_name, c.id \n"
                + "                                  FROM  group6_lms.class c ";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            List<Classs> list = new ArrayList<>();//

            while (rs.next()) {
                StudentClass sc = new StudentClass();
                Classs c = new Classs();
                c.setClass_name(rs.getString("class_name"));
                c.setId(rs.getInt("id"));

                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public StudentClass getOnedisplay(int ID) {

        String sql = "SELECT distinct u.fullname, u.email,c.id, c.class_name, c.subject_id, s.is_active, s.display_order, u.id\n"
                + "                                FROM group6_lms.student_class s join group6_lms.class c on s.class_id = c.id join  group6_lms.user u \n"
                + "                                     on s.student_id = u.id where  s.display_order = ?";//

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, ID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                StudentClass sc = new StudentClass();
                User u = new User();
                Classs c = new Classs();
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setId(rs.getInt(8));
                c.setClass_name(rs.getString("class_name"));
                c.setId(rs.getInt(3));
                c.setSubject_id(rs.getInt("subject_id"));
                sc.setIs_active(rs.getInt("is_active"));
                sc.setUser(u);
                sc.setClassid(c);
                sc.setDisplay_order(rs.getInt("display_order"));

                return sc;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public StudentClass getOne(int ID) {

        String sql = "SELECT distinct u.fullname, u.email,c.id, c.class_name, c.subject_id, s.is_active, s.display_order, u.id\n"
                + "                                       FROM group6_lms.student_class s join group6_lms.class c on s.class_id = c.id join  group6_lms.user u \n"
                + "                                       on s.student_id = u.id where  u.id = ? ";//

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, ID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                StudentClass sc = new StudentClass();
                User u = new User();
                Classs c = new Classs();
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setId(rs.getInt("id"));
                c.setClass_name(rs.getString("class_name"));
                c.setId(rs.getInt("id"));
                c.setSubject_id(rs.getInt("subject_id"));
                sc.setIs_active(rs.getInt("is_active"));
                sc.setUser(u);
                sc.setClassid(c);
                sc.setDisplay_order(rs.getInt("display_order"));

                return sc;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public void addStudentClass(StudentClass obj) {
        int displayOrder = 0;
        String sqlT = "SELECT MAX(display_order) + 1 FROM student_class where class_id = ?";
        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sqlT);) {
            ps.setObject(1, obj.getClassid().getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                displayOrder = rs.getInt(1);
            }
        } catch (SQLException e) {
            // Handle the exception appropriately (e.g., log it)
            e.printStackTrace();
        }

        String sql = "INSERT INTO `group6_lms`.`student_class` "
                + "(class_id, student_id, is_active, display_order) "
                + "VALUES (?, ?, true, ?)";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, obj.getClassid().getId());
            ps.setObject(2, obj.getUser().getId());
            ps.setObject(3, displayOrder);
            ps.executeUpdate();
        } catch (SQLException e) {
            // Handle the exception appropriately (e.g., log it)
            e.printStackTrace();
        }
    }
}
