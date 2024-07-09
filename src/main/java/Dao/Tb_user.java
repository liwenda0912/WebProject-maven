package Dao;
import entity.User;

import java.sql.ResultSet;

public interface Tb_user {
    ResultSet getSelect(String dbname) throws ClassNotFoundException;

    int delTbp(String username);
    int addTbp(User user);
    int updateTbp(User user);
}
