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
import model.Chapter;
import model.Dimension;
import model.Setting;
import model.Subject;
import model.User;

/**
 *
 * @author ADMIN
 */
public class GeneralDAO {

    public List<Dimension> filter(String type, String name, int status) {
        String sql = "SELECT * FROM group6_lms.dimension d JOIN group6_lms.subject s ON d.subject_id = s.id WHERE 1=1";

        if (type != null && !type.isEmpty()) {
            sql += " AND d.type = ?";
        }

        if (name != null && !name.isEmpty()) {
            sql += " AND d.name = ?";
        }

        if (status != -1) { // Assuming -1 represents no status condition
            sql += " AND d.is_active = ?";
        }

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {

            int parameterIndex = 1;

            if (type != null && !type.isEmpty()) {
                ps.setString(parameterIndex, type);
                parameterIndex++;
            }

            if (name != null && !name.isEmpty()) {
                ps.setString(parameterIndex, name);
                parameterIndex++;
            }

            if (status != -1) {
                ps.setInt(parameterIndex, status);
            }

            ResultSet rs = ps.executeQuery();
            List<Dimension> list = new ArrayList<>();

            while (rs.next()) {
                Dimension d = new Dimension();
                d.setId(rs.getInt("dimension_id"));
                d.setType(rs.getString("type"));
                d.setName(rs.getString("name"));
                Subject s = new Subject();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("subject_name"));
                d.setSubject_id(s);
                d.setIs_active(rs.getInt("is_active"));
                d.setCreated_at(rs.getDate("created_at"));
                list.add(d);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Chapter> filterChap(String title, int status) {
        String sql = "SELECT * FROM group6_lms.chapter as c WHERE 1=1";

        if (title != null && !title.isEmpty()) {
            sql += " AND c.title = ?";
        }

        if (status != -1) { // Assuming -1 represents no status condition
            sql += " AND c.is_active = ?";
        }
        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {

            int parameterIndex = 1;

            if (title != null && !title.isEmpty()) {
                ps.setString(parameterIndex, title);
                parameterIndex++;
            }
            if (status != -1) {
                ps.setInt(parameterIndex, status);
            }

            ResultSet rs = ps.executeQuery();
            List<Chapter> list = new ArrayList<>();

            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                c.setSubject_id(rs.getInt("subject_id"));
                c.setIs_active(rs.getInt("is_active"));
                c.setCreated_at(rs.getDate("created_at"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int getDimensionListSize() {
        int size = 0;
        String query = "SELECT COUNT(*) FROM group6_lms.dimension"; // Adjust the table name to match your database schema

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement statement = connection.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                size = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }

        return size;
    }

    public int getChapterListSize() {
        int size = 0;
        String query = "SELECT COUNT(*) FROM group6_lms.chapter"; // Adjust the table name to match your database schema

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement statement = connection.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                size = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }

        return size;
    }

    public List<Dimension> getListDimensionPerPage(int numberProductPerPage, int pageCur) {
        String sql = "SELECT DISTINCT d.dimension_id, d.type, d.name, d.subject_id, d.is_active, d.created_at,s.subject_name \n"
                + "                      FROM group6_lms.dimension d join group6_lms.subject s on d.subject_id = s.id  \n"
                + "                       ORDER BY d.dimension_id \n"
                + "                        LIMIT ?, ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Dimension> list = new ArrayList<>();
            while (rs.next()) {
                Dimension d = new Dimension();
                d.setId(rs.getInt("dimension_id"));
                d.setType(rs.getString("type"));
                d.setName(rs.getString("name"));
                Subject s = new Subject();
                s.setName(rs.getString("subject_name"));
                d.setSubject_id(s);
                d.setIs_active(rs.getInt("is_active"));
                d.setCreated_at(rs.getDate("created_at"));
                list.add(d);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Chapter> getListChapterPerPage(int numberProductPerPage, int pageCur) {
        String sql = "SELECT DISTINCT c.chapter_id, c.title, c.subject_id, c.is_active, c.created_at, c.description, c.display_order \n"
                + "                    FROM group6_lms.chapter c\n"
                + "                             ORDER BY c.chapter_id\n"
                + "                         LIMIT ?, ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Chapter> list = new ArrayList<>();
            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                c.setSubject_id(rs.getInt("subject_id"));
                c.setIs_active(rs.getInt("is_active"));
                c.setCreated_at(rs.getDate("created_at"));
                c.setDescription(rs.getString("description"));
                c.setDisplay_order(rs.getInt("display_order"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Chapter> getAllChap() {

        String sql = "SELECT * FROM group6_lms.chapter ";//

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            List<Chapter> list = new ArrayList<>();//

            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                c.setSubject_id(rs.getInt("subject_id"));
                c.setIs_active(rs.getInt("is_active"));
                c.setCreated_at(rs.getDate("created_at"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Dimension> getType() {

        String sql = "SELECT * FROM group6_lms.Dimension ";//

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            List<Dimension> list = new ArrayList<>();//

            while (rs.next()) {
                Dimension d = new Dimension();
                d.setType(rs.getString("type"));

                list.add(d);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public void addDimension(Dimension dimension) {
        String sql = "INSERT INTO `group6_lms`.`dimension` "
                + "(type, name, subject_id, is_active, created_at) "
                + "VALUES (?, ?, ?, ?, now())";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {

            ps.setString(1, dimension.getType());
            ps.setString(2, dimension.getName());
            ps.setInt(3, dimension.getSubject_id().getId());
            ps.setInt(4, dimension.getIs_active());

            ps.executeUpdate();
        } catch (SQLException e) {
            // Handle the exception appropriately (e.g., log it)
            e.printStackTrace();
        }
    }

    public void addChap(Chapter chapter) {
        String sql = "INSERT INTO `group6_lms`.`chapter`\n"
                + "              (title,subject_id, is_active,description ,created_at)\n"
                + "                     VALUES (?,?,?,?, now());";
        try {
            Connection connection = new BaseDAO().connection;
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, chapter.getTitle());
            st.setInt(2, chapter.getSubject_id());
            st.setInt(3, chapter.getIs_active());
            st.setString(4, chapter.getDescription());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Dimension> getsortlstAcs(String sortBy, int numberProductPerPage, int pageCur) {
        String sql = "SELECT * FROM group6_lms.dimension d "
                + "JOIN group6_lms.subject s ON d.subject_id = s.id "
                + "ORDER BY " + constructOrderByClause(sortBy)
                + " LIMIT ?, ?;";

        List<Dimension> dimensionList = new ArrayList<>();

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dimension d = new Dimension();
                d.setId(rs.getInt("dimension_id"));
                d.setType(rs.getString("type"));
                d.setName(rs.getString("name"));
                Subject s = new Subject();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("subject_name"));
                d.setSubject_id(s);
                d.setIs_active(rs.getInt("is_active"));
                d.setCreated_at(rs.getDate("created_at"));
                dimensionList.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return the list of Dimension objects
        return dimensionList;
    }

    public List<Chapter> getsortlstAcsChap(String sortBy, int numberProductPerPage, int pageCur) {
        String sql = "SELECT * FROM group6_lms.chapter "
                + "ORDER BY " + constructOrderByClauseChap(sortBy)
                + " LIMIT ?, ?;";

        List<Chapter> list = new ArrayList<>();

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                c.setSubject_id(rs.getInt("subject_id"));
                c.setIs_active(rs.getInt("is_active"));
                c.setCreated_at(rs.getDate("created_at"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Chapter> getsortlstDescChap(String sortBy, int numberProductPerPage, int pageCur) {
        String sql = "SELECT * FROM group6_lms.chapter "
                + "ORDER BY " + constructOrderByClauseChapDesc(sortBy)
                + " LIMIT ?, ?;";

        List<Chapter> list = new ArrayList<>();

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                c.setSubject_id(rs.getInt("subject_id"));
                c.setIs_active(rs.getInt("is_active"));
                c.setCreated_at(rs.getDate("created_at"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Dimension> getsortlstDesc(String sortBy, int numberProductPerPage, int pageCur) {
        String sql = "SELECT * FROM group6_lms.dimension d "
                + "JOIN group6_lms.subject s ON d.subject_id = s.id "
                + "ORDER BY " + constructOrderByClauseDesc(sortBy)
                + " LIMIT ?, ?;";

        List<Dimension> dimensionList = new ArrayList<>();

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dimension d = new Dimension();
                d.setId(rs.getInt("dimension_id"));
                d.setType(rs.getString("type"));
                d.setName(rs.getString("name"));
                Subject s = new Subject();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("subject_name"));
                d.setSubject_id(s);
                d.setIs_active(rs.getInt("is_active"));
                d.setCreated_at(rs.getDate("created_at"));
                dimensionList.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return the list of Dimension objects
        return dimensionList;
    }

    public int sizeBysortAcs(String sortby) {

        String sql = "SELECT COUNT(*) as total FROM group6_lms.dimension "
                + "ORDER BY " + constructOrderByClause(sortby);

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                total = rs.getInt("total");
            }
            return total;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    private String constructOrderByClause(String sortBy) {
        String orderBy = "dimension_id ASC"; // Default sorting if sortBy is null or invalid
        if (sortBy != null) {
            switch (sortBy) {
                case "id":
                    orderBy = "dimension_id ASC";
                    break;
                case "typeT":
                    orderBy = "type ASC";
                    break;
                case "name":
                    orderBy = "name ASC";
                    break;
                case "subjectname":
                    orderBy = "subject_id ASC";
                    break;
                // Add additional cases for other sorting options if needed
            }
        }

        return orderBy;
    }

    private String constructOrderByClauseChap(String sortBy) {
        String orderBy = "chapter_id ASC"; // Default sorting if sortBy is null or invalid
        if (sortBy != null) {
            switch (sortBy) {
                case "id":
                    orderBy = "chapter_id ASC";
                    break;
                case "title":
                    orderBy = "title ASC";
                    break;
                // Add more cases for other sorting options if required
            }
        }
        return orderBy;
    }

    private String constructOrderByClauseChapDesc(String sortBy) {
        String orderBy = "chapter_id DESC"; // Default sorting if sortBy is null or invalid
        if (sortBy != null) {
            switch (sortBy) {
                case "id":
                    orderBy = "chapter_id DESC";
                    break;
                case "title":
                    orderBy = "title DESC";
                    break;
                // Add more cases for other sorting options if required
            }
        }
        return orderBy;
    }

    private String constructOrderByClauseDesc(String sortBy) {
        String orderBy = "id DESC"; // Default sorting if sortBy is null or invalid
        if (sortBy != null) {
            switch (sortBy) {
                case "id":
                    orderBy = "dimension_id DESC";
                    break;
                case "typeT":
                    orderBy = "type DESC";
                    break;
                case "name":
                    orderBy = "name DESC";
                    break;
                case "subjectname":
                    orderBy = "subject_id DESC";
                    break;
                // Add additional cases for other sorting options if needed
            }
        }
        return orderBy;
    }

    public Dimension getOne(int ID) {

        String sql = "SELECT * FROM group6_lms.dimension d join group6_lms.subject s on d.subject_id = s.id  WHERE dimension_id = ?";//

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, ID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dimension d = new Dimension();
                d.setId(rs.getInt("dimension_id"));
                d.setType(rs.getString("type"));
                d.setName(rs.getString("name"));
                Subject s = new Subject();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("subject_name"));
                d.setSubject_id(s);
                d.setIs_active(rs.getInt("is_active"));
                d.setCreated_at(rs.getDate("created_at"));

                return d;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Chapter getOneChap(int ID) {

        String sql = "SELECT * FROM group6_lms.chapter  WHERE chapter_id = ?";//

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, ID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Chapter c = new Chapter();
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                c.setSubject_id(rs.getInt("subject_id"));
                c.setIs_active(rs.getInt("is_active"));
                c.setDescription(rs.getString("description"));
                return c;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Chapter> getdisplayorder() {
        String sql = "SELECT * FROM group6_lms.chapter ";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            List<Chapter> lst = new ArrayList<>();
            while (rs.next()) {
                Chapter c = new Chapter();
                c.setDisplay_order(rs.getInt("display_order"));
                lst.add(c);
            }
            return lst;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            // Handle the exception accordingly, whether logging or throwing a custom exception
        }
        return null; // If an error occurs, return null or handle appropriately
    }

    public boolean delete(int id) {
        int check = 0;
        String sql = "DELETE FROM group6_lms.dimension Where dimension_id = ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean deleteChap(int id) {
        int check = 0;
        String sql = "DELETE FROM group6_lms.chapter Where chapter_id = ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean update(Dimension obj, int id) {
        int check = 0;
        String sql = "UPDATE group6_lms.dimension SET type = ?, name = ?, subject_id = ?,is_active = ? WHERE dimension_id = ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, obj.getType());
            ps.setObject(2, obj.getName());
            ps.setObject(3, obj.getSubject_id().getId()); // Update with the Subject's ID
            ps.setObject(4, obj.getIs_active());
            ps.setObject(5, obj.getId());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updateChap(Chapter obj, int id) {
        int check = 0;
        String sql = "UPDATE group6_lms.chapter SET title = ?, is_active = ?, subject_id = ?, description = ?, display_order = ? WHERE chapter_id = ?";

        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, obj.getTitle());
            ps.setObject(2, obj.getIs_active());
            ps.setObject(3, obj.getSubject_id());
            ps.setObject(4, obj.getDescription());
            ps.setObject(5, obj.getDisplay_order());
            ps.setObject(6, obj.getChapter_id());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public void activeAndDeactive(Dimension dimen) {
        String sql = "UPDATE `group6_lms`.`dimension` SET \n"
                + "    is_active = ?, updated_by= ?, updated_at =NOW() \n"
                + "     where dimension_id= ?";
        Connection connection = new BaseDAO().connection;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, dimen.getIs_active());
            st.setInt(2, dimen.getUpdated_by());
            st.setInt(3, dimen.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void activeAndDeactiveChap(Chapter chap) {
        String sql = "UPDATE `group6_lms`.`chapter` SET \n"
                + "    is_active = ?, updated_by= ?, updated_at =NOW() \n"
                + "     where chapter_id= ?";
        Connection connection = new BaseDAO().connection;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, chap.getIs_active());
            st.setInt(2, chap.getUpdated_by());
            st.setInt(3, chap.getChapter_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Dimension> Search(String search) {
        String sql = "SELECT * FROM group6_lms.dimension d join group6_lms.subject s on d.subject_id = s.id  WHERE type LIKE ? ";
        try ( Connection connection = new BaseDAO().connection;  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();

            List<Dimension> list = new ArrayList<>();
            while (rs.next()) {
                Dimension d = new Dimension();
                d.setId(rs.getInt("dimension_id"));
                d.setType(rs.getString("type"));
                d.setName(rs.getString("name"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id")); // Correct the column name
                s.setName(rs.getString("subject_name"));
                d.setSubject_id(s);
                d.setIs_active(rs.getInt("is_active"));
                d.setCreated_at(rs.getDate("created_at"));
                list.add(d);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean isTypeOrNameExists(int id, String type, String name) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = new BaseDAO().connection;

            // Construct a SQL query to check for the existence of a record with the same type or name
            String sql = "SELECT COUNT(*) FROM group6_lms.dimension WHERE (type = ? OR name = ?) AND id <> ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, type);
            statement.setString(2, name);
            statement.setInt(3, id);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0; // If count > 0, a matching record exists
            }
        } catch (SQLException e) {
            // Handle database-related errors
            e.printStackTrace();
        } finally {
            // Close resources (resultSet, statement, connection) in reverse order
        }

        return false; // Return false in case of errors
    }

    public static void main(String[] args) {
    }
    // ... other methods ...

}
