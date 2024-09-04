package common;

import entity.Setting;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.SQLException;
import java.util.List;

public interface To_Json {


    JSONObject setJson(String name, String address, int id, String phone, String passwd, String alias, String province, String city);


    void arrayList(List<Setting> selectData, JSONArray array) throws SQLException;

    JSONObject settingJson(List<Setting> array_settingText, String[] column);

//    void arrayList(ResultSet selectData, JSONArray array) throws SQLException;

//    void arrayList(ResultSet selectData, JSONArray array) throws SQLException;
}
