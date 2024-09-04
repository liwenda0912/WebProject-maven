package Dao;
import entity.Setting;
import entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.json.JSONArray;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

public interface Tb_user {
    List<User> findAll(RowBounds rowbounds) throws IOException;
    int upDataUser(User user) throws IOException;


    ResultSet getSelectLogin(String dbname) throws ClassNotFoundException;

    ResultSet getSelect(String dbname, Integer NUM,Integer pageNum) throws ClassNotFoundException;

    int getCount(String dbname);

    int delTbp(String username);

    int addTbp(String username, String pwd);

    int updateTbp(String dbname, Map<String, String[]> params);

    int readUpdata(JSONArray array_text);
}
