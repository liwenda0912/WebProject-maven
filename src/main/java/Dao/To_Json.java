package Dao;

import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface To_Json {

    JSONObject settingJson(List<String> array_settingText, String[] column);

    JSONObject setJson(String name, String address, String id);

    void arrayList(ResultSet selectData, JSONArray array) throws SQLException;
}
