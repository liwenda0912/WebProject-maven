package service;
import Dao.Tb_user;
import Dao.To_setting;
import Utils.mybatisUtils;
import Utils.sqlConnect;
import entity.Setting;
import entity.User;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.*;
import java.util.List;
import java.util.Map;

import static jdk.internal.org.objectweb.asm.Type.getType;
@Service
public class sqlService {

    mybatisUtils mybatisUtils = new mybatisUtils();
    SqlSession sqlsession;
    {
        try {
            sqlsession = mybatisUtils.MybatisUtils();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> findAll(RowBounds rowbounds) throws IOException {
        List<User> data = sqlsession.getMapper(Tb_user.class).findAll(rowbounds);
        return data;
    }

    public int upDataUser(User user) throws IOException {
        try {
//          SqlSession sqlsession = mybatisUtils.MybatisUtils();
            int r = sqlsession.getMapper(Tb_user.class).upDataUser(user);
            sqlsession.commit();
            return r;
        } catch (IOException e) {
            sqlsession.rollback();
            e.printStackTrace();
            return 0;
        }
    }

    public List<Setting> findSettingAll(RowBounds rowbounds) throws IOException {
        List<Setting> data = sqlsession.getMapper(To_setting.class).findSettingAll(rowbounds);
        return data;
    }
    public ResultSet getSelectLogin(String dbname) throws ClassNotFoundException {
        ResultSet data = null;
        try {
            //连接数据库
            Connection conn = sqlConnect.getConnection();
            //创建statement
            Statement stmt = conn.createStatement();
            //执行sql
            String sql = "select * from "+dbname+";";
            data = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode() + "\n");
            e.printStackTrace();
        }
        return data;
    }

    public ResultSet getSelect(String dbname, Integer NUM, Integer pageNUM) throws ClassNotFoundException {
        ResultSet data = null;
        try {

            //连接数据库
            Connection conn = sqlConnect.getConnection();
            //创建statement
            Statement stmt = conn.createStatement();
            //执行sql
            String sql = "select * from "+dbname+" LIMIT "+pageNUM+" OFFSET "+(NUM-1)*pageNUM+";";
            data = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode() + "\n");
            e.printStackTrace();
        }
        return data;

    }
    public int getCount(String dbname) {
        ResultSet count_num;
        int Count_data =0;
        try {
            //连接数据库
            Connection conn = sqlConnect.getConnection();
            //创建statement
            Statement stmt = conn.createStatement();
            //执行sql
            String sql_count ="select count(*) from "+dbname+";";
            count_num = stmt.executeQuery(sql_count);
            while(count_num.next()){
                Count_data = Integer.parseInt(count_num.getString("count(*)"));
            }
        } catch (SQLException e) {
            System.out.print("链接失败，状态:" + e.getErrorCode() + "\n");
            e.printStackTrace();
        }
        return Count_data;
    }

    public int delTbp(String username) {
        // TODO Auto-generated method stub
        Connection conn=null;
        try {
            //连接数据库
            conn= sqlConnect.getConnection();
            //执行sql
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

    public int addTbp(String username, String pwd) {
        // TODO Auto-generated method stub
        Connection conn=null;
        try {
            //连接数据库
            conn= sqlConnect.getConnection();
            //执行sql
            String sql="insert into user(username,password,address,phone,alias,city,province,zip,date) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,username);
            pst.setString(2,pwd);
            pst.setString(3,"广州");
            pst.setString(4,"110");
            pst.setString(5,"null");
            pst.setString(6,"广州");
            pst.setString(7,"广东");
            pst.setString(8,"810000");
            pst.setString(9,"2024-08-05");
            pst.executeUpdate();
            return 0;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return 1;
        }finally {
            sqlConnect.close(conn);
        }
    }
    public int updateTbp(String dbname, Map<String, String[]> params) {
        // TODO Auto-generated method stub
        Connection conn=null;
        String id = null;
        String edit_name = null;
        try {
            //连接数据库
            conn= sqlConnect.getConnection();
            //定义sql
            if(dbname.equals("setting")){
                String setting_id = params.get("setting_id")[0];
                System.out.print(params.keySet());
                for (Map.Entry<String, String[]> entry : params.entrySet()) {
                    //获取key
                    String paramName = entry.getKey();
                    //key是否为dbname
                    if (!paramName.equals("dbname")){
                        String[] paramValues = entry.getValue();
                        for (String paramValue : paramValues) {
                            // key是否为setting_id
                            if(!paramName.equals("setting_id")){
                                // 执行sql语句
                                String sql="update "+dbname+" set "+paramName+"=? where "+"setting_id=?";
                                PreparedStatement pst=conn.prepareStatement(sql);
                                pst.setString(1,paramValue);
                                pst.setString(2,setting_id);
                                pst.executeUpdate();
                            }
                        }
                    }
                }
            }else {
                String user_id = params.get("id")[0];
                System.out.print(dbname);
                for (Map.Entry<String, String[]> entry : params.entrySet()) {
                    //获取key
                    String paramName = entry.getKey();
                    //key是否为dbname
                    if (!paramName.equals("dbname")){
                        String[] paramValues = entry.getValue();
                        for (String paramValue : paramValues) {
                            // key是否为setting_id
                            if(!paramName.equals("id")){
                                // 执行sql语句
                                String sql="update "+dbname+" set "+paramName+"=? where "+"id=?";
                                PreparedStatement pst=conn.prepareStatement(sql);
                                pst.setString(1,paramValue);
                                pst.setString(2,user_id);
                                pst.executeUpdate();
                            }
                        }
                    }
                }
            }
            return 1;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
           return 0;
        }finally {
            sqlConnect.close(conn);
        }
    }
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
            return 0;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return 1;
        }finally {
            sqlConnect.close(conn);
        }
    }

}

