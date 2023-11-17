/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Chapter;

/**
 *
 * @author ptkng
 */
public class ChapterDAO extends BaseDAO {

    public ArrayList<Chapter> getChapterList() {
        ArrayList<Chapter> chapterlist = new ArrayList<>();
        String sql = "SELECT * FROM chapter;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapter_id(rs.getInt(1));
                chapter.setTitle(rs.getString(2));
                chapter.setSubject_id(rs.getInt(3));
                chapterlist.add(chapter);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return chapterlist;
    }
    
}
