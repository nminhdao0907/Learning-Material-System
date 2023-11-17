/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author OS
 */
import java.sql.Timestamp;
import model.Classs;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Setting;
import model.Subject;
import model.User;

public class ClassDAO extends BaseDAO {

    ArrayList<Classs> classeslist = new ArrayList<>();

    public ArrayList<Classs> getAllClass() {
        ArrayList<Classs> classList = new ArrayList<>();
        String sql = "SELECT min(id) AS id, class_name \n"
                + "FROM group6_lms.class\n"
                + "GROUP BY class_name;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs cls = new Classs();
                cls.setId(rs.getInt(1));
                cls.setClass_name(rs.getString(2));
                classList.add(cls);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classList;
    }

    public Map<Integer, String> getIDAndName() {
        Map<Integer, String> map = new LinkedHashMap<>();
        String sql = "SELECT min(id) AS id, class_name \n"
                + "FROM group6_lms.class\n"
                + "GROUP BY class_name;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                map.put(rs.getInt("id"), rs.getString("class_name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return map;
    }

    public ArrayList<Classs> getClassList() {
        ArrayList<Classs> classesList = new ArrayList<>();

        String sql = "SELECT class.*, "
                + "u1.fullname AS created_by_name, "
                + "u2.fullname AS updated_by_name, "
                + "u3.fullname AS trainer_name, "
                + "s.subject_code, "
                + "se.setting_value AS semester_name "
                + "FROM class "
                + "LEFT JOIN user u1 ON class.created_by = u1.id "
                + "LEFT JOIN user u2 ON class.updated_by = u2.id "
                + "LEFT JOIN user u3 ON class.trainer_id = u3.id "
                + "LEFT JOIN subject s ON class.subject_id = s.id "
                + "LEFT JOIN setting se ON class.semester_id = se.id";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classes = new Classs(
                        rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("created_by_name"),
                        rs.getString("updated_by_name"),
                        rs.getString("trainer_name"),
                        rs.getString("subject_code"),
                        rs.getString("semester_name")
                );
                classesList.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classesList;
    }

    public List<Setting> getSemesters() {
        List<Setting> semesters = new ArrayList<>();
        String sql = "SELECT id, setting_value FROM setting WHERE setting_name = 'Semester'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting semester = new Setting(rs.getInt("id"), rs.getString("setting_value"));
                semesters.add(semester);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
        return semesters;
    }

    public List<Subject> getSubjects() {
        List<Subject> subjects = new ArrayList<>();
        String sql = "SELECT id, subject_code FROM subject";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt("id"), rs.getString("subject_code"));
                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
        return subjects;
    }

    public List<User> getTrainers() {
        List<User> trainers = new ArrayList<>();
        String sql = "SELECT id, fullname FROM user WHERE role_id = 3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User trainer = new User(rs.getInt("id"), rs.getString("fullname"));
                trainers.add(trainer);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
        return trainers;
    }
    // Method to check if a classes value already exists

    public boolean doesClassWithSubjectExistInSemester(String class_name, int semester_id, int subject_id) {
        boolean exists = false;
        String query = "SELECT COUNT(*) FROM class WHERE class_name = ? AND semester_id = ? AND subject_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, class_name);
            statement.setInt(2, semester_id);
            statement.setInt(3, subject_id);

            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    exists = count > 0;
                }
            }
        } catch (SQLException e) {
            // Handle exceptions
            e.printStackTrace();
        }

        return exists;
    }

    public boolean doesClassNameExistForUpdate(String className, int currentClassId) {
        boolean existsting = false;
        String query = "SELECT COUNT(*) FROM class WHERE class_name = ? AND id <> ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, className);
            statement.setInt(2, currentClassId);

            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    existsting = count > 0;
                }
            }
        } catch (SQLException e) {
            // Handle exceptions
            e.printStackTrace();
        }

        return existsting;
    }

    public ArrayList<Classs> GetClassByID(int id) {
        String sql = "SELECT class.*, "
                + "u1.fullname AS created_by_name, "
                + "u2.fullname AS updated_by_name, "
                + "u3.fullname AS trainer_name, "
                + "s.subject_code, "
                + "se.setting_value AS semester_name "
                + "FROM class "
                + "LEFT JOIN user u1 ON class.created_by = u1.id "
                + "LEFT JOIN user u2 ON class.updated_by = u2.id "
                + "LEFT JOIN user u3 ON class.trainer_id = u3.id "
                + "LEFT JOIN subject s ON class.subject_id = s.id "
                + "LEFT JOIN setting se ON class.semester_id = se.id "
                + "WHERE class.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classes = new Classs(
                        rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("created_by_name"),
                        rs.getString("updated_by_name"),
                        rs.getString("trainer_name"),
                        rs.getString("subject_code"),
                        rs.getString("semester_name")
                );
                classeslist.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classeslist;
    }

    public Classs getClass(String id) {
        String sql = "select * from class where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
                return classes;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Classs getClassByName(String classes_name) {
        String sql = "select * from class where class_name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, classes_name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
                return classes;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Classs getClassByID(int id) {
        String sql = "select * from class where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
                return classes;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Classs checkUpdateClass(String checkContent, String newContent, int id) {
        String sql = "select * from class\n"
                + "where " + checkContent + " = ? and class.id != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newContent);
            st.setInt(2, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
                return classes;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Classs checkClassByName(String newName, String oldName) {
        String sql = "select * from class\n"
                + "where class.class_name = ? and class.class_name != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newName);
            st.setString(1, oldName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Classs> getClassByPage(ArrayList<Classs> list, int start, int end) {
        ArrayList<Classs> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    /*        public ArrayList<Integer> getManagerIDList() {
            ArrayList<Integer> managerIDList = new ArrayList<>();
            String sql = "select distinct classes.managerID\n"
                    + "from classes\n"
                    + "order by classes.managerID";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    managerIDList.add(rs.getInt(1));
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return managerIDList;
        }
     */
    public ArrayList<Classs> SearchClassByID(int id) {
        String sql = "select * from class where id like ? order by class.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + id + "%"); // Use setString instead of setInt
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classeslist;
    }

    public ArrayList<Classs> SearchClassByName(String classes_value) {
        String sql = "select * from class where class_name like ? order by class.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + classes_value + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classeslist;
    }

    public ArrayList<Classs> SearchClassByType(String classes_name) {
        String sql = "select * from class where class_name like ? order by class.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + classes_name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classeslist;
    }

    public ArrayList<Classs> SearchClassByStatus(int is_active) {
        String sql = "select * from class where is_active like ? order by class.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + is_active + "%"); // Use setString instead of setInt
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classes = new Classs(rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"));
                classeslist.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classeslist;
    }

    public ArrayList<Classs> searchClasses(String className, int semesterID, int subjectID, int trainerID, int is_Active) {
        ArrayList<Classs> classesList = new ArrayList<>();

        StringBuilder sqlBuilder = new StringBuilder("SELECT class.*, "
                + "u1.fullname AS created_by_name, "
                + "u2.fullname AS updated_by_name, "
                + "u3.fullname AS trainer_name, "
                + "s.subject_code, "
                + "se.setting_value AS semester_name "
                + "FROM class "
                + "LEFT JOIN user u1 ON class.created_by = u1.id "
                + "LEFT JOIN user u2 ON class.updated_by = u2.id "
                + "LEFT JOIN user u3 ON class.trainer_id = u3.id "
                + "LEFT JOIN subject s ON class.subject_id = s.id "
                + "LEFT JOIN setting se ON class.semester_id = se.id "
                + "WHERE 1=1 ");

        if (className != null && !className.isEmpty()) {
            sqlBuilder.append("AND class.class_name LIKE ? ");
        }

        if (semesterID != 0) {
            sqlBuilder.append("AND class.semester_id = ? ");
        }

        if (subjectID != 0) {
            sqlBuilder.append("AND class.subject_id = ? ");
        }

        if (trainerID != 0) {
            sqlBuilder.append("AND class.trainer_id = ? ");
        }

        if (is_Active != -1) {
            sqlBuilder.append("AND class.is_active = ? ");
        }

        String sql = sqlBuilder.toString();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (className != null && !className.isEmpty()) {
                st.setString(parameterIndex++, "%" + className + "%");
            }

            if (semesterID != 0) {
                st.setInt(parameterIndex++, semesterID);
            }

            if (subjectID != 0) {
                st.setInt(parameterIndex++, subjectID);
            }

            if (trainerID != 0) {
                st.setInt(parameterIndex++, trainerID);
            }

            if (is_Active != -1) {
                st.setInt(parameterIndex, is_Active);
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classes = new Classs(
                        rs.getInt("id"),
                        rs.getInt("semester_id"),
                        rs.getInt("subject_id"),
                        rs.getString("class_name"),
                        rs.getInt("trainer_id"),
                        rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"),
                        rs.getString("description"),
                        rs.getInt("is_active"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("created_by_name"),
                        rs.getString("updated_by_name"),
                        rs.getString("trainer_name"),
                        rs.getString("subject_code"),
                        rs.getString("semester_name")
                );
                classesList.add(classes);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classesList;
    }

    public void AddClass(int semester_id, int subject_id, String class_name, int trainer_id, Timestamp start_date, Timestamp end_date, String description, int is_active, int created_by, Timestamp created_at) {
        String sql = "insert into class (semester_id, subject_id, class_name, trainer_id, start_date, end_date, description, is_active, created_by, created_at) values(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, semester_id);
            st.setInt(2, subject_id);
            st.setString(3, class_name);
            st.setInt(4, trainer_id);
            st.setTimestamp(5, start_date);
            st.setTimestamp(6, end_date);
            st.setString(7, description);
            st.setInt(8, is_active);
            st.setInt(9, created_by);
            st.setTimestamp(10, created_at); // Use setTimestamp for created_at
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateClass(int semester_id, int subject_id, String class_name, int trainer_id, Timestamp start_date, Timestamp end_date, String description, int is_active, int updated_by, Timestamp updated_at, int id) {
        String sql = "update class set \n"
                + "semester_id = ?, subject_id = ?, class_name = ?, trainer_id = ?, start_date = ?, end_date = ?, description = ?, is_active = ?, updated_by = ?, updated_at = ?\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, semester_id);
            st.setInt(2, subject_id);
            st.setString(3, class_name);
            st.setInt(4, trainer_id);
            st.setTimestamp(5, start_date);
            st.setTimestamp(6, end_date);
            st.setString(7, description);
            st.setInt(8, is_active);
            st.setInt(9, updated_by);
            st.setTimestamp(10, updated_at);
            st.setInt(11, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void ActivateClass(int is_active, int updated_by, Timestamp updated_at, int id) {
        String sql = "update class set \n"
                + "is_active = ?, updated_by = ?, updated_at = ?\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, is_active);
            st.setInt(2, updated_by);
            st.setTimestamp(3, updated_at);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void DeleteClass(int id) {
        String sql = "delete from class\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getMaxSid() {
        int maxSid = 0;

        try {
            String query = "SELECT MAX(id) AS maxSid FROM class";
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                maxSid = rs.getInt("maxSid");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return maxSid;
    }

    public static void main(String[] args) {
        ClassDAO d = new ClassDAO();
        Map<Integer, String> map = d.getIDAndName();
        System.out.println(map.get(5));
    }
}
