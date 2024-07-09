package service;

import Dao.Tb_user;
import entity.Enum;
import entity.User;
import Utils.sqlConnect;

import java.sql.*;

public class sqlService implements Tb_user {
    @Override
    public ResultSet getSelect(String dbname) throws ClassNotFoundException {
        ResultSet data = null;
        try {
            Connection conn = sqlConnect.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from "+dbname+";";
            data = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode() + "\n");
            e.printStackTrace();
        }
        return data;
    }
    @Override
    public int delTbp(String username) {
        // TODO Auto-generated method stub
        Connection conn=null;
        try {
            //连接数据库
            conn= sqlConnect.getConnection();
            //定义sql
            String sql="select * from users where id="+username;
            PreparedStatement pst=conn.prepareStatement(sql);
            int resultSet=pst.executeUpdate();
            return resultSet;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            sqlConnect.close(conn);
        }
        return 0;
    }

    @Override
    public int addTbp(User user) {
        // TODO Auto-generated method stub
        Connection conn=null;
        try {
            //连接数据库
            conn= sqlConnect.getConnection();
            //定义sql
            String sql="insert into users(username,passwd) values(?,?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPasswd());
            int resultSet=pst.executeUpdate();
            return resultSet;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            sqlConnect.close(conn);
        }
        return 0;
    }

    @Override
    public int updateTbp(User user) {
        // TODO Auto-generated method stub
        Connection conn=null;
        try {
            //连接数据库
            conn= sqlConnect.getConnection();
            //定义sql
            String sql="update users set username=?,passwd=? where username=?";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPasswd());
            int resultSet=pst.executeUpdate();
            return resultSet;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            sqlConnect.close(conn);
        }
        return 0;
    }
}

