/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.SubjectManager;

/**
 *
 * @author bao chau
 */
public class SubjectDAO extends BaseDAO {

    public ArrayList<Subject> getSubjectList() {
        ArrayList<Subject> subjectlist = new ArrayList<>();
        String sql = "select subject.id,subject.subject_code,subject.subject_name,subject.description,\n"
                + "subject.manager_id,subject.is_active,subject.created_by,subject.created_at,subject.updated_by,subject.updated_at,subject.manager_name\n"
                + "from subject ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setManagerID(rs.getInt("manager_id"));
                subject.setManagerName(rs.getString("manager_name"));
                subject.setIsActive(rs.getInt("is_active"));
                subject.setCreatedBy(rs.getInt("created_by"));
                subject.setCreatedAt(rs.getString("created_at"));
                subject.setUpdatedBy(rs.getInt("updated_by"));
                subject.setUpdatedAt(rs.getString("updated_at"));
                subjectlist.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return subjectlist;
    }

    public ArrayList<Subject> getSubjectNameList() {
        ArrayList<Subject> subjectlist = new ArrayList<>();
        String sql = "select subject.id,subject.subject_name\n"
                + "from subject order by id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setName(rs.getString("subject_name"));
                subjectlist.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return subjectlist;
    }

    public ArrayList<Subject> getSubjectNameList2(int id) {
        ArrayList<Subject> subjectlist = new ArrayList<>();
        String sql = "select subject.id,subject.subject_name \n"
                + "from subject \n"
                + "where subject.manager_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setName(rs.getString("subject_name"));
                subjectlist.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return subjectlist;
    }

    public int getFirstSubjectId() {
        String sql = "SELECT id FROM subject ORDER BY id ASC LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public Subject getSubject(String getBy, String value) {
        String sql = "select subject.id,subject.subject_code,subject.subject_name,subject.description,\n"
                + "subject.manager_id,subject.is_active,subject.created_by,subject.created_at,subject.updated_by,subject.updated_at,subject.manager_name\n"
                + "from subject "
                + "where " + getBy + " = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setManagerID(rs.getInt("manager_id"));
                subject.setManagerName(rs.getString("manager_name"));
                subject.setIsActive(rs.getInt("is_active"));
                subject.setCreatedBy(rs.getInt("created_by"));
                subject.setCreatedAt(rs.getString("created_at"));
                subject.setUpdatedBy(rs.getInt("updated_by"));
                subject.setUpdatedAt(rs.getString("updated_at"));
                return subject;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Subject checkUpdateSubject(String checkContent, String newContent, int id) {
        String sql = "select * from subject\n"
                + "where " + checkContent + " = ? and subject.id != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newContent);
            st.setInt(2, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setManagerID(rs.getInt("manager_id"));
                subject.setIsActive(rs.getInt("is_active"));
                subject.setCreatedBy(rs.getInt("created_by"));
                subject.setCreatedAt(rs.getString("created_at"));
                subject.setUpdatedBy(rs.getInt("updated_by"));
                subject.setUpdatedAt(rs.getString("updated_at"));
                return subject;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public ArrayList<Subject> getSubjectByPage(ArrayList<Subject> list, int start, int end) {
        ArrayList<Subject> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public String getManagerName(String managerID) {
        String sql = "select user.fullname \n"
                + "from user\n"
                + "where user.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, managerID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("fullname");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void updateSubjectStatus(int subjectID, int status) {
        String sql = "UPDATE `group6_lms`.`subject` SET `is_active` = ? WHERE (`id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, subjectID);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<SubjectManager> getManagerList() {
        ArrayList<SubjectManager> managerList = new ArrayList<>();
        String sql = "select distinct user.id,user.fullname \n"
                + "from user join subject on subject.manager_id = user.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                managerList.add(new SubjectManager(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return managerList;
    }

    public ArrayList<SubjectManager> getManager() {
        ArrayList<SubjectManager> managerList = new ArrayList<>();
        String sql = "select distinct user.id,user.fullname \n"
                + "from user where user.role_id=2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                managerList.add(new SubjectManager(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return managerList;
    }

    public ArrayList<Subject> searchSubject(String searchContent, String status, String managerID) {
        ArrayList<Subject> subjectlist = new ArrayList<>();
        String sql = "select subject.id,subject.subject_code,subject.subject_name,subject.description,subject.manager_id,subject.is_active, "
                + "subject.created_by,subject.created_at,subject.updated_by,subject.updated_at,subject.manager_name from subject\n"
                + "where (subject.subject_code like ? or subject.subject_name like ?) and subject.is_active like ? and subject.manager_id like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchContent + "%");
            st.setString(2, "%" + searchContent + "%");
            st.setString(3, "%" + status + "%");
            st.setString(4, "%" + managerID + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setManagerID(rs.getInt("manager_id"));
                subject.setManagerName(rs.getString("subject.manager_name"));
                subject.setIsActive(rs.getInt("is_active"));
                subject.setCreatedBy(rs.getInt("created_by"));
                subject.setCreatedAt(rs.getString("created_at"));
                subject.setUpdatedBy(rs.getInt("updated_by"));
                subject.setUpdatedAt(rs.getString("updated_at"));
                subjectlist.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return subjectlist;
    }

    public ArrayList<Subject> searchSubjectWithoutMId(String searchContent, String status) {
        ArrayList<Subject> subjectlist = new ArrayList<>();
        String sql = "select subject.id,subject.subject_code,subject.subject_name,subject.description,subject.manager_id,subject.is_active, "
                + "subject.created_by,subject.created_at,subject.updated_by,subject.updated_at,subject.manager_name from subject\n"
                + "where (subject.subject_code like ? or subject.subject_name like ?) and subject.is_active like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchContent + "%");
            st.setString(2, "%" + searchContent + "%");
            st.setString(3, "%" + status + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                subject.setDescription(rs.getString("description"));
                subject.setManagerID(rs.getInt("manager_id"));
                subject.setManagerName(rs.getString("subject.manager_name"));
                subject.setIsActive(rs.getInt("is_active"));
                subject.setCreatedBy(rs.getInt("created_by"));
                subject.setCreatedAt(rs.getString("created_at"));
                subject.setUpdatedBy(rs.getInt("updated_by"));
                subject.setUpdatedAt(rs.getString("updated_at"));
                subjectlist.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return subjectlist;
    }

    public void addSubject(Subject subject) {
        String sql = "INSERT INTO `group6_lms`.`subject` "
                + " (`subject_code`, `subject_name`, `description`, `is_active`, `created_by`, `created_at`) "
                + "VALUES (?,?,?,?,?, now());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, subject.getCode());
            st.setString(2, subject.getName());
            st.setString(3, subject.getDescription());
            st.setInt(4, subject.getIsActive());
            st.setInt(5, subject.getCreatedBy());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void assignSubjectManager(Subject subject) {
        String sql = "UPDATE `group6_lms`.`subject` SET `manager_id` = ?, `manager_name` = ? WHERE (`id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject.getManagerID());
            st.setString(2, subject.getManagerName());
            st.setInt(3, subject.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void unAssignSubjectManager(String id) {
        String sql = "UPDATE `group6_lms`.`subject` SET `manager_id` = NULL, `manager_name` = NULL WHERE (`id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void activeAndDeactive(Subject subject) {
        String sql = "UPDATE `group6_lms`.`subject` SET  \n"
                + "`is_active`=?,`updated_by`=?,`updated_at`=NOW()"
                + "where subject.id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject.getIsActive());
            st.setInt(2, subject.getUpdatedBy());
            st.setInt(3, subject.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateSubject(Subject subject) {
        String sql = "UPDATE `group6_lms`.`subject` SET  \n"
                + "`subject_code`=?,`subject_name`=?,`description`=?,"
                + "`updated_by`=?,`updated_at`=NOW() "
                + "where subject.id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, subject.getCode());
            st.setString(2, subject.getName());
            st.setString(3, subject.getDescription());
            st.setInt(4, subject.getUpdatedBy());
            st.setInt(5, subject.getId());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSubject(int id) {
        String sql = "delete from subject\n"
                + "where subject.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        SubjectDAO d = new SubjectDAO();
        System.out.println(d.getSubjectList());
    }
}
