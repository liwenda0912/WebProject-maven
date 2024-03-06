package uilts;
import java.sql.*;
public class sqlConnect {
    public void getCon() throws ClassNotFoundException {
        String driver = "com.mysql.cj.jdbc.Driver";
        Class.forName(driver);
        Connection con = null;
        try {
            String user = "root";
            String url = "jdbc:mysql://localhost:3306";
            String passwd = "123456";
            con = DriverManager.getConnection(url, user, passwd);
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode()+"\n");
            e.printStackTrace();
        }
    }
}
