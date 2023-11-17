/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Assignment;
import model.Classs;
import model.SubmittedAssignment;

/**
 *
 * @author bao chau
 */
public class SubmittedAssigmentDAO extends BaseDAO {

    public ArrayList<SubmittedAssignment> getSubmittedAssignmentList(int trainerID, int assignmentID,String fullName,int classID) {
        ArrayList<SubmittedAssignment> list = new ArrayList<>();
        String sql = "select submitted_assignment.assignment_id,assignment.assignment_name,submitted_assignment.class_id,\n"
                + "submitted_assignment.student_id,user.fullname,submitted_assignment.mark,submitted_assignment.is_submit,submitted_assignment.submitted_at\n"
                + "from submitted_assignment join assignment on submitted_assignment.assignment_id = assignment.id\n"
                + "join user on user.id = submitted_assignment.student_id\n"
                + "join class on class.id = submitted_assignment.class_id\n"
                + "where submitted_assignment.assignment_id = ? and class.trainer_id = ? and fullname like ? and submitted_assignment.class_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, assignmentID);
            st.setInt(2, trainerID);
            st.setString(3, fullName);
            st.setInt(4, classID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SubmittedAssignment sa = new SubmittedAssignment();
                sa.setId(rs.getInt("submitted_assignment.assignment_id"));
                sa.setName(rs.getString("assignment.assignment_name"));
                sa.setClassID(rs.getInt("submitted_assignment.class_id"));
                sa.setStudentID(rs.getInt("submitted_assignment.student_id"));
                sa.setStudentName(rs.getString("user.fullname"));
                sa.setSubmittedAt(rs.getString("submitted_assignment.submitted_at"));
                sa.setIs_submit(rs.getInt("submitted_assignment.is_submit"));
                sa.setGrade(rs.getDouble("submitted_assignment.mark"));
                list.add(sa);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public ArrayList<SubmittedAssignment> getListByPage(ArrayList<SubmittedAssignment> list, int start, int end) {
        ArrayList<SubmittedAssignment> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    
    public ArrayList<SubmittedAssignment> getSubmittedAssignmentListForAllAssignments(int trainerID,String fullName,int classID) {
        ArrayList<SubmittedAssignment> list = new ArrayList<>();
        String sql = "select submitted_assignment.assignment_id,assignment.assignment_name,submitted_assignment.class_id,\n"
                + "submitted_assignment.student_id,user.fullname,submitted_assignment.mark,submitted_assignment.is_submit,submitted_assignment.submitted_at\n"
                + "from submitted_assignment join assignment on submitted_assignment.assignment_id = assignment.id\n"
                + "join user on user.id = submitted_assignment.student_id\n"
                + "join class on class.id = submitted_assignment.class_id\n"
                + "where class.trainer_id = ? and fullname like ? and submitted_assignment.class_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trainerID);
            st.setString(2, fullName);
            st.setInt(3, classID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SubmittedAssignment sa = new SubmittedAssignment();
                sa.setId(rs.getInt("submitted_assignment.assignment_id"));
                sa.setName(rs.getString("assignment.assignment_name"));
                sa.setClassID(rs.getInt("submitted_assignment.class_id"));
                sa.setStudentID(rs.getInt("submitted_assignment.student_id"));
                sa.setStudentName(rs.getString("user.fullname"));
                sa.setSubmittedAt(rs.getString("submitted_assignment.submitted_at"));
                sa.setIs_submit(rs.getInt("submitted_assignment.is_submit"));
                sa.setGrade(rs.getDouble("submitted_assignment.mark"));
                list.add(sa);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    

    public ArrayList<Classs> getClassListByTrainer(int trainerID) {
        String sql = "select distinct submitted_assignment.class_id, class.class_name\n" +
                        "from submitted_assignment join class on submitted_assignment.class_id = class.id\n" +
                        "where class.trainer_id = ?";
        ArrayList<Classs> classList = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trainerID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs classs = new Classs();
                classs.setId(rs.getInt("submitted_assignment.class_id"));
                classs.setClass_name(rs.getString("class.class_name"));
                classList.add(classs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classList;
    }
    
    public int getFirstClassIDListByTrainer(int trainerID) {
        String sql = "select distinct submitted_assignment.class_id, class.class_name\n" +
                        "from submitted_assignment join class on submitted_assignment.class_id = class.id\n" +
                        "where class.trainer_id = ?\n" +
                        "order by submitted_assignment.class_id asc\n" +
                        "limit 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trainerID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("submitted_assignment.class_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<Assignment> getAssignmentListByClass(int classID) {
        String sql = "select distinct submitted_assignment.assignment_id,assignment.assignment_name \n"
                + "from submitted_assignment join assignment on submitted_assignment.assignment_id = assignment.id \n"
                + "where submitted_assignment.class_id = ?";
        ArrayList<Assignment> assignmentList = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, classID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assignment asg = new Assignment();
                asg.setId(rs.getInt("submitted_assignment.assignment_id"));
                asg.setName(rs.getString("assignment.assignment_name"));
                assignmentList.add(asg);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return assignmentList;
    }
    
    public void grade(int studentID,int assignmentID,double mark,int classID) {
        String sql = "UPDATE `group6_lms`.`submitted_assignment` SET `mark` = ? WHERE (`assignment_id` = ?) and (`class_id` = ?) and (`student_id` = ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, mark);
            st.setInt(2,assignmentID);
            st.setInt(3,classID);
            st.setInt(4,studentID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public String getFileName(int assignmentID,int studentID,int classID){
        String sql = "select distinct assignment_file \n" +
                    "from submitted_assignment\n" +
                    "where assignment_id = ? and student_id = ? and class_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, assignmentID);
            st.setInt(2,studentID);
            st.setInt(3,classID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }
    
    
    public static void main(String[] args) {
        SubmittedAssigmentDAO d = new SubmittedAssigmentDAO();
        if(d.getFileName(1, 1,1)==null){
            System.out.println("a");
        }else{
            System.out.println("b");
        }

    }

}
