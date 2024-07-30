package service;
import Dao.Tb_user;
import com.alibaba.fastjson.JSON;
import entity.User;
import Utils.sqlConnect;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;
import org.json.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.sql.*;
import java.util.Arrays;
import java.util.List;

import static jdk.internal.org.objectweb.asm.Type.getType;

public class sqlService implements Tb_user {

    @Override
    public ResultSet getSelectLogin(String dbname) throws ClassNotFoundException {
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
    public ResultSet getSelect(String dbname, Integer NUM, Integer pageNUM) throws ClassNotFoundException {
        ResultSet data = null;
        try {
            Connection conn = sqlConnect.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from "+dbname+" LIMIT "+pageNUM+" OFFSET "+(NUM-1)*pageNUM+";";
            data = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode() + "\n");
            e.printStackTrace();
        }
        return data;

    }
    @Override
    public int getCount(String dbname) {
        ResultSet count_num;
        int Count_data =0;
        try {
            Connection conn = sqlConnect.getConnection();
            Statement stmt = conn.createStatement();
            String sql_count ="select count(username) from "+dbname+";";
            count_num = stmt.executeQuery(sql_count);
            while(count_num.next()){
                Count_data = Integer.parseInt(count_num.getString("count(username)"));
            }
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode() + "\n");
            e.printStackTrace();
        }
        return Count_data;
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
    public int addTbp(String username, String pwd) {
        // TODO Auto-generated method stub
        Connection conn=null;
        try {
            //连接数据库
            conn= sqlConnect.getConnection();
            //定义sql
            String sql="insert into users(username,password,address,phone,alias) values(?,?,?,?,?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,username);
            pst.setString(2,pwd);
            pst.setString(3,"广州");
            pst.setString(4,"null");
            pst.setString(5,"");
            pst.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return 1;
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
    @Override
    public int readUpdata(JSONArray array_text) {
        // TODO Auto-generated method stub
        Connection conn=null;
        try {
            //连接数据库
            conn = sqlConnect.getConnection();
            //定义sql
            String sql = "insert into setting(set_key,set_value, set_remark, set_code, tenant_id, create_time, state, set_type, set_version) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            // 获取json array 的键值
            for (int i = 0; i < array_text.length(); i++) {
                // 将json array的某一值变成object对象
                Object data = array_text.get(i);
                // 将object对象变成json object
                JSONObject json=(JSONObject) data;
                // 获取json object 的键值
                pst.setString(1, (String) json.get("set_key"));
                pst.setString(2, (String) json.get("set_value"));
                pst.setString(3, (String) json.get("set_remark") );
                pst.setString(4, (String) json.get("set_code"));
                pst.setString(5, (String) json.get("tenant_id"));
                pst.setString(6, (String) json.get("create_time"));
                pst.setString(7, (String) json.get("state"));
                pst.setString(8, (String) json.get("set_type"));
                pst.setString(9, (String) json.get("set_version"));
                pst.executeUpdate();
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            sqlConnect.close(conn);
        }
        return 0;
    }

}

