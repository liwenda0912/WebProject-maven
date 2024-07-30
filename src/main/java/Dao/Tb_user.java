package Dao;
import entity.User;
import org.json.JSONArray;

import java.sql.ResultSet;
import java.util.List;

public interface Tb_user {

    ResultSet getSelectLogin(String dbname) throws ClassNotFoundException;

    ResultSet getSelect(String dbname, Integer NUM,Integer pageNum) throws ClassNotFoundException;

    int getCount(String dbname);

    int delTbp(String username);

    int addTbp(String username, String pwd);

    int updateTbp(User user);

    int readUpdata(JSONArray array_text);
}
