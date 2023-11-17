/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classs/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Chapter;
import model.ClassAssignment;
import model.Classs;
import model.Subject;

/**
 *
 * @author dangn
 */
public class ClassAssignmentDAO extends BaseDAO {

    public Map<Integer, String> getIDAndNameClasses() {
        Map<Integer, String> map = new LinkedHashMap<>();
        String sql = "SELECT MIN(al.class_id) AS class_id, cl.class_name\n"
                + "FROM assignment_list al\n"
                + "JOIN class cl ON al.class_id = cl.id\n"
                + "GROUP BY cl.class_name;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                map.put(rs.getInt("class_id"), rs.getString("class_name"));
            }
        } catch (Exception e) {
        }
        return map;
    }

    public ArrayList<ClassAssignment> getCasmList() {
        ArrayList<ClassAssignment> list = new ArrayList<>();
        String sql = "select al.id,al.name,al.subject_id,al.chapter_id,al.class_id,al.description,al.file_name,al.is_active,al.due_date,al.created_by,al.created_at,al.updated_by,al.updated_at,\n"
                + "s.id,s.subject_code,s.subject_name,c.chapter_id,c.title, cl.class_name\n"
                + "from assignment_list al\n"
                + "join subject s on al.subject_id = s.id\n"
                + "JOIN chapter c on al.chapter_id = c.chapter_id\n"
                + "LEFT JOIN class cl on al.class_id = cl.id\n"
                + "ORDER BY al.id asc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ClassAssignment asm = new ClassAssignment();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Classs cls = new Classs();
                asm.setId(rs.getInt("id"));
                asm.setName(rs.getString("name"));
                asm.setFile_name(rs.getString("file_name"));
                asm.setIs_active(rs.getInt(8));
                asm.setDescription(rs.getString("description"));
                asm.setDue_date(rs.getTimestamp("due_date"));
                asm.setCreated_at(rs.getString("created_at"));
                asm.setCreated_by(rs.getInt("created_by"));
                asm.setUpdated_at(rs.getString("updated_at"));
                asm.setUpdated_by(rs.getInt("updated_by"));
                subject.setId(rs.getInt(14));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("title"));
                cls.setClass_name(rs.getString("class_name"));
                cls.setId(rs.getInt(5));
                asm.setSubject(subject);
                asm.setChapter(chapter);
                asm.setClasss(cls);
                list.add(asm);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<ClassAssignment> getClassList() {
        ArrayList<ClassAssignment> list = new ArrayList<>();
        String sql = "SELECT MIN(al.class_id) AS class_id, cl.class_name\n"
                + "FROM assignment_list al\n"
                + "JOIN class cl ON al.class_id = cl.id\n"
                + "GROUP BY cl.class_name;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ClassAssignment asm = new ClassAssignment();
                Classs cls = new Classs();
                cls.setId(rs.getInt(1));
                cls.setClass_name(rs.getString(2));
                asm.setClasss(cls);
                list.add(asm);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ClassAssignmentDAO d = new ClassAssignmentDAO();
//        Timestamp testTimestamp = Timestamp.valueOf("2023-11-06 15:30:00");
//        d.updateAssignment("9", "ABCD", 18, 19, 5, "ABCDABCD", testTimestamp, 0, 0);
//        Map<Integer, String> map = d.getIDAndNameClasses();
//        System.out.println(map.get(5));
        System.out.println(d.getClassList());

    }

    public ArrayList<ClassAssignment> getClassAsmByPage(ArrayList<ClassAssignment> list, int start, int end) {
        ArrayList<ClassAssignment> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void activeAndDeactive(ClassAssignment casm) {
        String sql = "UPDATE assignment_list SET  \n"
                + "`is_active`=?,`updated_by`=?,`updated_at`= NOW()"
                + "where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, casm.getIs_active());
            st.setInt(2, casm.getUpdated_by());
            st.setInt(3, casm.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<ClassAssignment> searchAssignment(String searchQuery, String chap, String classes, String status) {
        ArrayList<ClassAssignment> list = new ArrayList<>();
        String sql = "SELECT al.id, al.name, al.subject_id, al.chapter_id, al.class_id, al.description, al.file_name, al.is_active, al.due_date, al.created_by, al.created_at, al.updated_by, al.updated_at,"
                + "s.id, s.subject_code, s.subject_name, c.chapter_id, c.title, cl.class_name "
                + "FROM assignment_list al "
                + "JOIN subject s ON al.subject_id = s.id "
                + "JOIN chapter c ON al.chapter_id = c.chapter_id "
                + "LEFT JOIN class cl ON al.class_id = cl.id "
                + "WHERE (al.name LIKE ? OR al.id LIKE ?) "
                + "AND (al.chapter_id LIKE ? OR cl.class_name LIKE ?) "
                + "AND al.is_active LIKE ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchQuery + "%");
            st.setString(2, "%" + searchQuery + "%");
            st.setString(3, "%" + chap + "%");
            st.setString(4, "%" + classes + "%");
            st.setString(5, "%" + status + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ClassAssignment asm = new ClassAssignment();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Classs cls = new Classs();
                asm.setId(rs.getInt("id"));
                asm.setName(rs.getString("name"));
                asm.setFile_name(rs.getString("file_name"));
                asm.setIs_active(rs.getInt(8));
                asm.setDescription(rs.getString("description"));
                asm.setDue_date(rs.getTimestamp("due_date"));
                asm.setCreated_at(rs.getString("created_at"));
                asm.setCreated_by(rs.getInt("created_by"));
                asm.setUpdated_at(rs.getString("updated_at"));
                asm.setUpdated_by(rs.getInt("updated_by"));
                subject.setId(rs.getInt(14));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("title"));
                cls.setClass_name(rs.getString("class_name"));
                cls.setId(rs.getInt(5));
                asm.setChapter(chapter);
                asm.setClasss(cls);
                asm.setSubject(subject);
                list.add(asm);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addAssignment(String name, int subject_id, int chapter_id, int class_id, String description, Timestamp due_date, int status, int created_by) {
        String sql = "INSERT INTO assignment_list (name, subject_id, chapter_id, class_id, description, due_date, is_active, created_by, created_at)\n"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, subject_id);
            ps.setInt(3, chapter_id);
            ps.setInt(4, class_id);
            ps.setString(5, description);
            ps.setTimestamp(6, due_date);
            ps.setInt(7, status);
            ps.setInt(8, created_by);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateAssignment(String id, String name, int subject_id, int chapter_id, int class_id, String description, Timestamp due_date, int status, int updated_by) {
            String sql = "Update assignment_list \n"
                    + "set name = ?, subject_id = ?,chapter_id = ?,class_id = ?, description = ?,due_date = ?,is_active = ?,updated_by = ?, updated_at = NOW()\n"
                    + "where id = ?; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, subject_id);
            st.setInt(3, chapter_id);
            st.setInt(4, class_id);
            st.setString(5, description);
            st.setTimestamp(6, due_date);
            st.setInt(7, status);
            st.setInt(8, updated_by);
            st.setString(9, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ClassAssignment getAssignmentByID(String id) {
        ResultSet rs;
        String sql = "select al.id,al.name,al.subject_id,al.chapter_id,al.class_id,al.description,al.file_content,al.is_active,al.due_date,al.created_by,al.created_at,al.updated_by,al.updated_at,\n"
                + "s.id,s.subject_code,s.subject_name,c.chapter_id,c.title, cl.class_name\n"
                + "from assignment_list al\n"
                + "join subject s on al.subject_id = s.id\n"
                + "JOIN chapter c on al.chapter_id = c.chapter_id\n"
                + "LEFT JOIN class cl on al.class_id = cl.id\n"
                + " WHERE al.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                ClassAssignment asm = new ClassAssignment();
                Subject subject = new Subject();
                Chapter chapter = new Chapter();
                Classs cls = new Classs();
                asm.setId(rs.getInt("id"));
                asm.setName(rs.getString("name"));
                asm.setIs_active(rs.getInt(8));
                asm.setDescription(rs.getString("description"));
                asm.setDue_date(rs.getTimestamp("due_date"));
                asm.setCreated_at(rs.getString("created_at"));
                asm.setCreated_by(rs.getInt("created_by"));
                asm.setUpdated_at(rs.getString("updated_at"));
                asm.setUpdated_by(rs.getInt("updated_by"));
                subject.setId(rs.getInt(14));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                chapter.setChapter_id(rs.getInt("chapter_id"));
                chapter.setTitle(rs.getString("title"));
                cls.setClass_name(rs.getString("class_name"));
                cls.setId(rs.getInt(5));
                asm.setSubject(subject);
                asm.setChapter(chapter);
                asm.setClasss(cls);
                return asm;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
