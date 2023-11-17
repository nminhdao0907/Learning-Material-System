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
import model.Setting;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.util.List;

public class SettingDAO extends BaseDAO {

    ArrayList<Setting> settinglist = new ArrayList<>();

    public ArrayList<Setting> getSettingList() {
        String sql = "select * from setting order by setting.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return settinglist;
    }
    // Method to check if a setting value already exists

    public boolean doesSettingValueExist(String settingValue) {
        boolean exists = false;
        String query = "SELECT COUNT(*) FROM setting WHERE setting_value = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, settingValue);

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

    public boolean doesSettingValueExistForUpdate(String settingValue, int currentSettingId) {
        boolean existsting = false;
        String query = "SELECT COUNT(*) FROM setting WHERE setting_value = ? AND id <> ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, settingValue);
            statement.setInt(2, currentSettingId);

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

public ArrayList<Setting> searchSettings(String settingValue, String settingName, int isActive) {
    ArrayList<Setting> settingsList = new ArrayList<>();

    StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM setting WHERE 1=1 ");

    if (!isEmpty(settingValue)) {
        sqlBuilder.append("AND setting_value LIKE ? ");
    }

    if (!isEmpty(settingName)) {
        sqlBuilder.append("AND setting_name = ? ");
    }

    if (isActive != -1) {
        sqlBuilder.append("AND is_active = ? ");
    }

    String sql = sqlBuilder.toString();

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        int parameterIndex = 1;

        if (!isEmpty(settingValue)) {
            st.setString(parameterIndex++, "%" + settingValue + "%");
        }

        if (!isEmpty(settingName)) {
            st.setString(parameterIndex++, settingName);
        }

        if (isActive != -1) {
            st.setInt(parameterIndex, isActive);
        }

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Setting setting = new Setting(
                    rs.getInt("id"),
                    rs.getString("setting_name"),
                    rs.getString("setting_value"),
                    rs.getInt("is_active"),
                    rs.getInt("display_order"),
                    rs.getString("description"),
                    rs.getInt("created_by"),
                    rs.getTimestamp("created_at"),
                    rs.getInt("updated_by"),
                    rs.getTimestamp("updated_at")
            );
            settingsList.add(setting);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return settingsList;
}
private boolean isEmpty(String s) {
    return s == null || s.trim().isEmpty();
}
    public ArrayList<Setting> GetSettingByID(int id) {
        String sql = "SELECT setting.*, u1.fullname AS created_by_name, u2.fullname AS updated_by_name "
                + "FROM setting "
                + "LEFT JOIN user u1 ON setting.created_by = u1.id "
                + "LEFT JOIN user u2 ON setting.updated_by = u2.id "
                + "WHERE setting.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting(
                        rs.getInt("id"),
                        rs.getString("setting_name"),
                        rs.getString("setting_value"),
                        rs.getInt("is_active"),
                        rs.getInt("display_order"),
                        rs.getString("description"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getInt("updated_by"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("created_by_name"),
                        rs.getString("updated_by_name")
                );
                settinglist.add(setting);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return settinglist;
    }

    public Setting getSetting(String id) {
        String sql = "select * from setting where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
                return setting;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Setting getSettingByName(String setting_name) {
        String sql = "select * from setting where setting_name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, setting_name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
                return setting;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Setting getSettingByID(int id) {
        String sql = "select * from setting where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
                return setting;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Setting checkSettingbyCode(String newCode, String oldCode) {
        String sql = "select * from setting\n"
                + "where setting.id = ? and setting.id != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newCode);
            st.setString(2, oldCode);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
                return setting;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Setting checkSettingByName(String newName, String oldName) {
        String sql = "select * from setting\n"
                + "where setting.setting_name = ? and setting.setting_name != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newName);
            st.setString(1, oldName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
                return setting;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Setting> getSettingByPage(ArrayList<Setting> list, int start, int end) {
        ArrayList<Setting> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    /*        public ArrayList<Integer> getManagerIDList() {
            ArrayList<Integer> managerIDList = new ArrayList<>();
            String sql = "select distinct setting.managerID\n"
                    + "from setting\n"
                    + "order by setting.managerID";
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
    public ArrayList<Setting> SearchSettingByID(int id) {
        String sql = "select * from setting where id like ? order by setting.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + id + "%"); // Use setString instead of setInt
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return settinglist;
    }

    public ArrayList<Setting> SearchSettingByName(String setting_value) {
        String sql = "select * from setting where setting_value like ? order by setting.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + setting_value + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return settinglist;
    }

    public ArrayList<Setting> SearchSettingByType(String setting_name) {
        String sql = "select * from setting where setting_name like ? order by setting.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + setting_name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return settinglist;
    }

    public ArrayList<Setting> SearchSettingByStatus(int is_active) {
        String sql = "select * from setting where is_active like ? order by setting.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + is_active + "%"); // Use setString instead of setInt
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting(rs.getInt("id"), rs.getString("setting_name"), rs.getString("setting_value"), rs.getInt("is_active"), rs.getInt("display_order"), rs.getString("description"), rs.getInt("created_by"), rs.getTimestamp("created_at"), rs.getInt("updated_by"), rs.getTimestamp("updated_at"));
                settinglist.add(setting);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return settinglist;
    }

    public void AddSetting(String setting_name, String setting_value, int is_active, int display_order, String description, int created_by, Timestamp created_at) {
        String sql = "insert into setting (setting_name, setting_value, is_active, display_order, description, created_by, created_at) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, setting_name);
            st.setString(2, setting_value);
            st.setInt(3, is_active);
            st.setInt(4, display_order);
            st.setString(5, description);
            st.setInt(6, created_by);
            st.setTimestamp(7, created_at); // Use setTimestamp for created_at
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateSetting(String setting_name, String setting_value, int is_active, int display_order, String description, int updated_by, Timestamp updated_at, int id) {
        String sql = "update setting set \n"
                + "setting_name = ?, setting_value = ?, is_active = ?, display_order = ?, description = ?, updated_by = ?, updated_at = ?\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, setting_name);
            st.setString(2, setting_value);
            st.setInt(3, is_active);
            st.setInt(4, display_order);
            st.setString(5, description);
            st.setInt(6, updated_by);
            st.setTimestamp(7, updated_at);
            st.setInt(8, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void ActivateSetting(int is_active, int updated_by, Timestamp updated_at, int id) {
        String sql = "update setting set \n"
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

    public void DeleteSetting(int id) {
        String sql = "delete from setting\n"
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
            String query = "SELECT MAX(id) AS maxSid FROM setting";
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
        //       SettingDAO a = new SettingDAO();
//        List<Setting> list = a.getSettingList();
        //       System.out.println(list);
        // Get the current date and time
//            java.util.Timestamp utilTimestamp = new java.util.Timestamp();
        // Convert java.util.Timestamp to java.sql.Timestamp
//            java.sql.Timestamp created_at = new java.sql.Timestamp(utilTimestamp.getTime());
//  a.AddSetting("Role", "Arduin FDTI", 1, 2, "It is IOT", 1, created_at);
        //  List<Setting> list = a.SearchSettingByStatus(1);
        //  System.out.println(list.get(0).toString());
    }

}
