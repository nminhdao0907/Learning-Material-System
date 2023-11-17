/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Assignmentsub;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class AssignmentDAO extends BaseDAO {

    public List<Assignmentsub> getAssignmentByUserId(int userId) {
        List<Assignmentsub> lstAsm = new ArrayList<>();
        String sql = "SELECT * FROM assignment\n"
                + "	join student_class on student_class.class_id = assignment.class_id \n"
                + "     join subject on assignment.subject_id = subject.id\n"
                + "where student_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setObject(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignmentsub obj = new Assignmentsub();
                obj.setId(rs.getInt(1));
                obj.setAssignment_name(rs.getString(3));
                obj.setDue_date(rs.getDate(6));
                Subject s = new Subject();
                s.setName(rs.getString("subject_name"));
                obj.setSubject_id(s);
                lstAsm.add(obj);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
        return lstAsm;
    }

    public Assignmentsub getOne(int id) {
        Assignmentsub obj = new Assignmentsub();
        String sql = "SELECT * FROM assignment\n"
                + "    join subject on assignment.subject_id = subject.id\n"
                + "where assignment.id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setObject(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                obj.setId(rs.getInt(1));
                obj.setAssignment_name(rs.getString(3));
                obj.setContent(rs.getString(5));
                obj.setDue_date(rs.getDate(6));
                Subject s = new Subject();
                s.setName(rs.getString("subject_name"));
                obj.setSubject_id(s);
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }
        return obj;
    }

    public static void main(String[] args) {
        System.out.println(new AssignmentDAO().getAssignmentByUserId(23));
    }

}
